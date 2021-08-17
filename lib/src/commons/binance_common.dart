import 'dart:io';
import 'dart:convert' as convert;

import 'package:convert/convert.dart';
import 'package:flutter/material.dart' hide Interval;
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:web_socket_channel/io.dart';

import 'common_classes.dart';
import 'common_enums.dart';
import 'exceptions.dart';

abstract class Binance {
  final String endpoint;
  final String wsEndpoint;
  final String prefix;
  String apiKey;
  String apiSecret;

  Binance({
    @required this.endpoint,
    @required this.wsEndpoint,
    @required this.prefix,
    this.apiKey = "",
    this.apiSecret = "",
  });

  /////////////////////////////// REST API ///////////////////////////////
  Future<dynamic> sendRequest({
    @required String path,
    @required SecurityType securityType,
    @required RequestType type,
    bool timestampNeeded = false,
    Map<String, String> params,
  }) async {
    params ??= {};
    if (timestampNeeded) params['timestamp'] = (DateTime.now().millisecondsSinceEpoch).toString();

    if (securityType == SecurityType.TRADE || securityType == SecurityType.USER_DATA) {
      var tempUri = Uri.https('', '', params);
      String queryParams = tempUri.toString().substring(7);
      List<int> messageBytes = convert.utf8.encode(queryParams);
      List<int> key = convert.utf8.encode(apiSecret);
      Hmac hmac = new Hmac(sha256, key);
      Digest digest = hmac.convert(messageBytes);
      String signature = hex.encode(digest.bytes);
      params['signature'] = signature;
    }

    Map<String, String> header = {};
    header[HttpHeaders.contentTypeHeader] = "application/x-www-form-urlencoded";
    if (securityType != SecurityType.NONE) header["X-MBX-APIKEY"] = apiKey;

    final uri = Uri.https(endpoint, '$path', params);
    http.Response response;

    switch (type) {
      case RequestType.GET:
        response = await http.get(
          uri,
          headers: securityType == SecurityType.NONE ? null : header,
        );
        break;
      case RequestType.POST:
        response = await http.post(
          uri,
          headers: header,
        );
        break;
      case RequestType.DELETE:
        response = await http.delete(
          uri,
          headers: header,
        );
        break;
      case RequestType.PUT:
        response = await http.put(uri);
        break;
      default:
    }

    final result = convert.jsonDecode(response.body);

    if (result is Map) {
      if (result.containsKey("code") && result['code'] != 200) {
        throw BinanceApiException(result["msg"], result["code"]);
      }
    }

    return result;
  }

  Future<bool> testPing() => sendRequest(
        path: '$prefix/ping',
        securityType: SecurityType.NONE,
        type: RequestType.GET,
      ).then((r) => true);

  Future<int> serverTime() => sendRequest(
        path: '$prefix/time',
        securityType: SecurityType.NONE,
        type: RequestType.GET,
      ).then((r) => r['serverTime']);

  Future<OrderBook> orderBook({@required String symbol, int limit}) {
    Map<String, String> params = {"symbol": symbol};
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: '$prefix/depth',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => OrderBook.fromMap(r));
  }

  Future<List<PublicTrade>> tradesList({@required String symbol, int limit}) {
    Map<String, String> params = {"symbol": symbol};
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: '$prefix/trades',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<PublicTrade>.from(r.map((t) => PublicTrade.fromMap(t))));
  }

  Future<List<PublicTrade>> historicalTrades({@required String symbol, int limit, int fromId}) {
    Map<String, String> params = {"symbol": symbol};
    if (limit != null) params['limit'] = limit.toString();
    if (fromId != null) params['fromId'] = fromId.toString();
    return sendRequest(
      path: '$prefix/historicalTrades',
      securityType: SecurityType.MARKET_DATA,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<PublicTrade>.from(r.map((t) => PublicTrade.fromMap(t))));
  }

  Future<List<AggregatedTrade>> aggregatedTrades({
    @required String symbol,
    int fromId,
    int startTime,
    int endTime,
    int limit,
  }) {
    Map<String, String> params = {"symbol": symbol};
    if (fromId != null) params['fromId'] = fromId.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: '$prefix/aggTrades',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<AggregatedTrade>.from(r.map((t) => AggregatedTrade.fromMap(t))));
  }

  Future<List<Kline>> candlestickData({
    @required String symbol,
    @required Interval interval,
    int startTime,
    int endTime,
    int limit,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'interval': intervalToStr[interval],
    };
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: '$prefix/klines',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<Kline>.from(r.map((t) => Kline.fromList(t))));
  }

  //////////////////////////// WEBSOCKETS API ////////////////////////////
  IOWebSocketChannel subscribe(String channel) => IOWebSocketChannel.connect(
        '$wsEndpoint/ws/$channel',
        pingInterval: Duration(minutes: 5),
      );

  Map toMap(json) => convert.jsonDecode(json);
  List<Map> toList(json) => List<Map>.from(convert.jsonDecode(json));

  Stream<WsAggregatedTrade> aggregatedTrade({@required String symbol}) {
    final channel = subscribe('${symbol.toLowerCase()}@aggTrade');

    return channel.stream.map<Map>(toMap).map<WsAggregatedTrade>((e) => WsAggregatedTrade.fromMap(e));
  }

  Stream<WsKlineEvent> kline({@required String symbol, @required Interval interval}) {
    final channel = subscribe('${symbol.toLowerCase()}@kline_${intervalToStr[interval]}');
    return channel.stream.map<Map>(toMap).map<WsKlineEvent>((e) => WsKlineEvent.fromMap(e));
  }

  Stream<WsMiniTicker> miniTicker24h({@required String symbol}) {
    final channel = subscribe('${symbol.toLowerCase()}@miniTicker');
    return channel.stream.map<Map>(toMap).map<WsMiniTicker>((e) => WsMiniTicker.fromMap(e));
  }

  Stream<WsUserDataEvent> userDataStream({@required String listenKey}) {
    final channel = subscribe(listenKey);
    return channel.stream.map<Map>(toMap).map<WsUserDataEvent>((e) => WsUserDataEvent.fromMap(e));
  }
}
