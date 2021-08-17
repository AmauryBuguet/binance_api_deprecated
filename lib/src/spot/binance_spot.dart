import 'package:flutter/material.dart';

import '../commons/binance_common.dart';
import '../commons/common_enums.dart';

import 'spot_classes.dart';

class BinanceSpot extends Binance {
  BinanceSpot({
    String apiSecret = "",
    String apiKey = "",
  }) : super(
          endpoint: 'api.binance.com',
          wsEndpoint: 'wss://stream.binance.com:9443',
          prefix: 'api/v3',
          apiKey: apiKey,
          apiSecret: apiSecret,
        );

  Future<SpotExchangeInfo> exchangeInfo() => sendRequest(
        path: 'api/v3/exchangeInfo',
        securityType: SecurityType.NONE,
        type: RequestType.GET,
      ).then((r) => SpotExchangeInfo.fromMap(r));

  Future<double> avgPrice({@required String symbol}) => sendRequest(
        path: 'api/v3/avgPrice',
        securityType: SecurityType.NONE,
        type: RequestType.GET,
        params: {'symbol': symbol},
      ).then((r) => double.parse(r['price']));

  Future<Order> queryOrder({
    @required String symbol,
    int orderId,
    int origClientOrderId,
    int recvWindow,
  }) {
    Map<String, String> params = {'symbol': symbol};
    if (orderId != null) params['orderId'] = orderId.toString();
    if (origClientOrderId != null) params['origClientOrderId'] = origClientOrderId.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/order',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => Order.fromMap(m));
  }

  Future<List<Order>> allOpenOrders({
    String symbol,
    int recvWindow,
  }) {
    Map<String, String> params = {};
    if (symbol != null) params['symbol'] = symbol;
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/openOrders',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => List<Order>.from(m.map((o) => Order.fromMap(o))));
  }

  Future<List<Order>> allOrders({
    @required String symbol,
    int orderId,
    int startTime,
    int endTime,
    int limit,
    int recvWindow,
  }) {
    Map<String, String> params = {'symbol': symbol};
    if (orderId != null) params['orderId'] = orderId.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/allOrders',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => List<Order>.from(m.map((o) => Order.fromMap(o))));
  }

  Future<SpotAccountInfo> accountInfo({int recvWindow}) {
    Map<String, String> params = {};
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/account',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => SpotAccountInfo.fromMap(m));
  }

  Future<List<Trade>> tradeList({
    @required String symbol,
    int startTime,
    int endTime,
    int fromId,
    int limit,
    int recvWindow,
  }) {
    Map<String, String> params = {'symbol': symbol};
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (fromId != null) params['fromId'] = fromId.toString();
    if (limit != null) params['limit'] = limit.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'api/v3/myTrades',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => List<Trade>.from(m.map((o) => Trade.fromMap(o))));
  }

  Future<AccountSnapshot> accountSnapshot({
    @required String type,
    int startTime,
    int endTime,
    int limit,
    int recvWindow,
  }) async {
    Map<String, String> params = {'type': type};
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    AccountSnapshot snap;
    dynamic a;
    try {
      a = await sendRequest(
        path: 'sapi/v1/accountSnapshot',
        securityType: SecurityType.USER_DATA,
        type: RequestType.GET,
        timestampNeeded: true,
        params: params,
      );
      snap = AccountSnapshot.fromMap(a);
    } catch (e) {
      print("hello");
      print(a);
    }
    return snap;
  }

  Future<String> getListenKey() async {
    return sendRequest(
      path: 'api/v3/userDataStream',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.POST,
      timestampNeeded: false,
      params: {},
    ).then((m) => m['listenKey']);
  }

  void pingListenKey({@required String listenkey}) {
    Map<String, String> params = {'listenkey': listenkey};
    sendRequest(
      path: 'api/v3/userDataStream',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.PUT,
      timestampNeeded: false,
      params: params,
    );
  }

  void deleteListenKey({@required String listenkey}) {
    Map<String, String> params = {'listenkey': listenkey};
    sendRequest(
      path: 'api/v3/userDataStream',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.DELETE,
      timestampNeeded: false,
      params: params,
    );
  }

  Future<CryptoDepositHistory> deposityHistory({
    String asset,
    int status,
    int startTime,
    int endTime,
    int recvWindow,
  }) async {
    Map<String, String> params = {};
    if (asset != null) params['asset'] = asset;
    if (status != null) params['status'] = status.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'wapi/v3/depositHistory.html',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => CryptoDepositHistory.fromMap(m));
  }
}
