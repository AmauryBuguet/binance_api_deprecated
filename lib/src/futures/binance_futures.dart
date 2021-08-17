import 'package:flutter/material.dart' hide Interval;

import '../commons/binance_common.dart';
import '../commons/common_classes.dart';
import '../commons/common_enums.dart';
import '../commons/exceptions.dart';

import 'future_classes.dart';
import 'futures_enums.dart';

class BinanceFutures extends Binance {
  BinanceFutures({
    String apiSecret = "",
    String apiKey = "",
  }) : super(
          endpoint: 'fapi.binance.com',
          wsEndpoint: 'wss://fstream.binance.com',
          prefix: 'fapi/v1',
          apiKey: apiKey,
          apiSecret: apiSecret,
        );

  Future<FuturesExchangeInfo> exchangeInfo() => sendRequest(
        path: 'fapi/v1/exchangeInfo',
        securityType: SecurityType.NONE,
        type: RequestType.GET,
      ).then((r) => FuturesExchangeInfo.fromMap(r));

  Future<List<Kline>> continuousCandlestickData({
    @required String pair,
    @required ContractType contractType,
    @required Interval interval,
    int startTime,
    int endTime,
    int limit,
  }) async {
    if (!{ContractType.CURRENT_MONTH, ContractType.NEXT_MONTH, ContractType.PERPETUAL}.contains(contractType)) {
      List<Kline> list = [];
      return list;
    }
    Map<String, String> params = {
      'pair': pair,
      'contractType': contractTypeToStr[contractType],
      'interval': intervalToStr[interval],
    };
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: 'fapi/v1/continuousKlines',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<Kline>.from(r.map((t) => Kline.fromList(t))));
  }

  Future<List<Kline>> indexPriceKlines({
    @required String pair,
    @required Interval interval,
    int startTime,
    int endTime,
    int limit,
  }) {
    Map<String, String> params = {
      'pair': pair,
      'interval': intervalToStr[interval],
    };
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: 'fapi/v1/indexPriceKlines',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<Kline>.from(r.map((t) => Kline.fromList(t))));
  }

  Future<List<Kline>> markPriceKlines({
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
      path: 'fapi/v1/markPriceKlines',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<Kline>.from(r.map((t) => Kline.fromList(t))));
  }

  Future<PremiumIndex> premiumIndex({@required String symbol}) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    return sendRequest(
      path: 'fapi/v1/premiumIndex',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => PremiumIndex.fromMap(r));
  }

  Future<List<PremiumIndex>> premiumIndexes() {
    return sendRequest(
      path: 'fapi/v1/premiumIndex',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
    ).then((r) => List<PremiumIndex>.from(r.map((p) => PremiumIndex.fromMap(p))));
  }

  Future<List<FundingRate>> fundingRate({
    String symbol,
    int startTime,
    int endTime,
    int limit,
  }) {
    Map<String, String> params = {};
    if (symbol != null) params['symbol'] = symbol;
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: 'fapi/v1/fundingRate',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<FundingRate>.from(r.map((t) => FundingRate.fromMap(t))));
  }

  Future<Ticker24hStatistics> ticker24hStatistics({@required String symbol}) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    return sendRequest(
      path: 'fapi/v1/ticker/24hr',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => Ticker24hStatistics.fromMap(r));
  }

  Future<List<Ticker24hStatistics>> allTickers24hStatistics() {
    return sendRequest(
      path: 'fapi/v1/ticker/24hr',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
    ).then((r) => List<Ticker24hStatistics>.from(r.map((p) => Ticker24hStatistics.fromMap(p))));
  }

  Future<PriceTicker> priceTicker({@required String symbol}) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    return sendRequest(
      path: 'fapi/v1/ticker/price',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => PriceTicker.fromMap(r));
  }

  Future<List<PriceTicker>> allPriceTickers() {
    return sendRequest(
      path: 'fapi/v1/ticker/price',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
    ).then((r) => List<PriceTicker>.from(r.map((p) => PriceTicker.fromMap(p))));
  }

  Future<BookTicker> bookTicker({@required String symbol}) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    return sendRequest(
      path: 'fapi/v1/ticker/bookTicker',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => BookTicker.fromMap(r));
  }

  Future<List<BookTicker>> allBookTickers() {
    return sendRequest(
      path: 'fapi/v1/ticker/bookTicker',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
    ).then((r) => List<BookTicker>.from(r.map((p) => BookTicker.fromMap(p))));
  }

  Future<List<LiquidationOrder>> allLiquidationOrders({
    String symbol,
    int startTime,
    int endTime,
    int limit,
  }) {
    Map<String, String> params = {};
    if (symbol != null) params['symbol'] = symbol;
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (limit != null) params['limit'] = limit.toString();
    return sendRequest(
      path: 'fapi/v1/allForceOrders',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<LiquidationOrder>.from(r.map((t) => LiquidationOrder.fromMap(t))));
  }

  Future<OpenInterest> openInterest({@required String symbol}) {
    Map<String, String> params = {
      'symbol': symbol,
    };
    return sendRequest(
      path: 'fapi/v1/openInterest',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => OpenInterest.fromMap(r));
  }

  Future<List<OpenInterestStatistics>> openInterestStatistics({
    @required String symbol,
    @required Interval period,
    int limit,
    int startTime,
    int endTime,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'period': intervalToStr[period],
    };
    if (limit != null) params['limit'] = limit.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    return sendRequest(
      path: 'futures/data/openInterestHist',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<OpenInterestStatistics>.from(r.map((t) => OpenInterestStatistics.fromMap(t))));
  }

  Future<List<LongShortInfo>> topAccountslongShortInfo({
    @required String symbol,
    @required Interval period,
    int limit,
    int startTime,
    int endTime,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'period': intervalToStr[period],
    };
    if (limit != null) params['limit'] = limit.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    return sendRequest(
      path: 'futures/data/topLongShortAccountRatio',
      securityType: SecurityType.MARKET_DATA,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<LongShortInfo>.from(r.map((t) => LongShortInfo.fromMap(t))));
  }

  Future<List<LongShortInfo>> topPositionslongShortInfo({
    @required String symbol,
    @required Interval period,
    int limit,
    int startTime,
    int endTime,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'period': intervalToStr[period],
    };
    if (limit != null) params['limit'] = limit.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    return sendRequest(
      path: 'futures/data/topLongShortPositionRatio',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<LongShortInfo>.from(r.map((t) => LongShortInfo.fromMap(t))));
  }

  Future<List<LongShortInfo>> globalAccountslongShortInfo({
    @required String symbol,
    @required Interval period,
    int limit,
    int startTime,
    int endTime,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'period': intervalToStr[period],
    };
    if (limit != null) params['limit'] = limit.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    return sendRequest(
      path: 'futures/data/globalLongShortAccountRatio',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<LongShortInfo>.from(r.map((t) => LongShortInfo.fromMap(t))));
  }

  Future<List<BuySellInfo>> takerBuySellInfo({
    @required String symbol,
    @required Interval period,
    int limit,
    int startTime,
    int endTime,
  }) {
    Map<String, String> params = {
      'symbol': symbol,
      'period': intervalToStr[period],
    };
    if (limit != null) params['limit'] = limit.toString();
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    return sendRequest(
      path: 'futures/data/takerlongshortRatio',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<BuySellInfo>.from(r.map((t) => BuySellInfo.fromMap(t))));
  }

  Future<List<Kline>> lvtKlines({
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
      path: 'fapi/v1/lvtKlines',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<Kline>.from(r.map((t) => Kline.fromList(t))));
  }

  Future<List<IndexInfo>> indexInfo({String symbol}) {
    Map<String, String> params = {};
    if (symbol != null) params['symbol'] = symbol;
    return sendRequest(
      path: 'fapi/v1/indexInfo',
      securityType: SecurityType.NONE,
      type: RequestType.GET,
      params: params,
    ).then((r) => List<IndexInfo>.from(r.map((t) => IndexInfo.fromMap(t))));
  }

  Future<bool> positionMode({int recvWindow}) {
    Map<String, String> params = {};
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'fapi/v1/positionSide/dual',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((r) => r['dualSidePosition']);
  }

  Future<String> setPositionMode({@required bool dualSidePosition, int recvWindow}) async {
    Map<String, String> params = {
      "dualSidePosition": dualSidePosition.toString(),
    };
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    String error = await sendRequest(
      path: 'fapi/v1/positionSide/dual',
      securityType: SecurityType.TRADE,
      type: RequestType.POST,
      timestampNeeded: true,
      params: params,
    ).then<String>((value) => "").catchError(
      (err) {
        if (err.code == 200 || err.code == -4059) {
          return "";
        } else {
          return "${err.message}";
        }
      },
      test: (e) => e is BinanceApiException,
    );
    return error;
  }

  Future<MapEntry<String, OrderF>> sendOrder({
    @required String symbol,
    @required OrderSide side,
    @required OrderTypeF type,
    PositionSide positionSide,
    TimeInForce timeInForce,
    String quantity,
    bool reduceOnly,
    String price,
    String newClientOrderId,
    String stopPrice,
    bool closePosition,
    String activationPrice,
    String callbackRate,
    WorkingType workingType,
    bool priceProtect,
    ResponseType newOrderRespType,
    int recvWindow,
  }) async {
    Map<String, String> params = {
      "symbol": symbol,
      "side": orderSideToStr[side],
      "type": orderTypeFToStr[type],
    };
    if (positionSide != null) params['positionSide'] = positionSideToStr[positionSide];
    if (timeInForce != null) params['timeInForce'] = timeInForceToStr[timeInForce];
    if (quantity != null) params['quantity'] = quantity;
    if (reduceOnly != null) params['reduceOnly'] = reduceOnly.toString();
    if (price != null) params['price'] = price;
    if (newClientOrderId != null) params['newClientOrderId'] = newClientOrderId;
    if (stopPrice != null) params['stopPrice'] = stopPrice;
    if (closePosition != null) params['closePosition'] = closePosition.toString();
    if (activationPrice != null) params['activationPrice'] = activationPrice;
    if (callbackRate != null) params['callbackRate'] = callbackRate.toString();
    if (workingType != null) params['workingType'] = workingTypeToStr[workingType];
    if (priceProtect != null) params['priceProtect'] = priceProtect.toString();
    if (newOrderRespType != null) params['newOrderRespType'] = responseTypeToStr[newOrderRespType];
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    OrderF order;
    String error = await sendRequest(
      path: 'fapi/v1/order',
      securityType: SecurityType.TRADE,
      type: RequestType.POST,
      timestampNeeded: true,
      params: params,
    ).then<String>((value) {
      order = OrderF.fromMap(value);
      return "";
    }).catchError(
      (err) {
        return "${err.code} : ${err.message}";
      },
      test: (e) => e is BinanceApiException,
    );
    return MapEntry(error, order);
  }

  Future<FuturesAccountInfo> accountInfo({int recvWindow}) async {
    Map<String, String> params = {};
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'fapi/v2/account',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => FuturesAccountInfo.fromMap(m));
  }

  Future<List<TradeF>> tradeList({
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
      path: 'fapi/v1/userTrades',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => List<TradeF>.from(m.map((o) => TradeF.fromMap(o))));
  }

  Future<List<Income>> incomeHistory({
    String symbol,
    IncomeType incomeType,
    int startTime,
    int endTime,
    int fromId,
    int limit,
    int recvWindow,
  }) {
    Map<String, String> params = {};
    if (symbol != null) params['symbol'] = symbol;
    if (incomeType != null) params['incomeType'] = incomeTypeToStr[incomeType];
    if (startTime != null) params['startTime'] = startTime.toString();
    if (endTime != null) params['endTime'] = endTime.toString();
    if (fromId != null) params['fromId'] = fromId.toString();
    if (limit != null) params['limit'] = limit.toString();
    if (recvWindow != null) params['recvWindow'] = recvWindow.toString();
    return sendRequest(
      path: 'fapi/v1/income',
      securityType: SecurityType.USER_DATA,
      type: RequestType.GET,
      timestampNeeded: true,
      params: params,
    ).then((m) => List<Income>.from(m.map((i) => Income.fromMap(i))));
  }

  Future<String> getListenKey() async {
    return sendRequest(
      path: 'fapi/v1/listenKey',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.POST,
      timestampNeeded: false,
      params: {},
    ).then((m) => m['listenKey']);
  }

  void pingListenKey() {
    sendRequest(
      path: 'fapi/v1/listenKey',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.PUT,
      timestampNeeded: false,
      params: {},
    );
  }

  void deleteListenKey() {
    sendRequest(
      path: 'fapi/v1/listenKey',
      securityType: SecurityType.USER_STREAM,
      type: RequestType.DELETE,
      timestampNeeded: false,
      params: {},
    );
  }
}
