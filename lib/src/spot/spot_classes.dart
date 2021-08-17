import '../commons/common_enums.dart';

import 'spot_enums.dart';

class Balance {
  final String asset;
  final double free;
  final double locked;

  Balance.fromMap(Map m)
      : this.asset = m['asset'],
        this.free = double.parse(m['free']),
        this.locked = double.parse(m['locked']);
}

class SpotAccountInfo {
  final int makerCommission;
  final int takerCommission;
  final int buyerCommission;
  final int sellerCommission;
  final bool canTrade;
  final bool canWithdraw;
  final bool canDeposit;
  final int updateTime;
  final String accountType;
  final List<Balance> balances;
  final List<String> permissions;

  SpotAccountInfo.fromMap(Map m)
      : this.makerCommission = m['makerCommission'],
        this.takerCommission = m['takerCommission'],
        this.buyerCommission = m['buyerCommission'],
        this.sellerCommission = m['sellerCommission'],
        this.canTrade = m['canTrade'],
        this.canWithdraw = m['canWithdraw'],
        this.canDeposit = m['canDeposit'],
        this.updateTime = m['updateTime'],
        this.accountType = m['accountType'],
        this.balances = List<Balance>.from(m['balances'].map((b) => Balance.fromMap(b))),
        this.permissions = m.containsKey("maker") ? m['maker'].cast<String>() : [];
}

class Symbol {
  final String symbol;
  final SymbolStatus status;
  final String baseAsset;
  final int baseAssetPrecision;
  final String quoteAsset;
  final int quotePrecision;
  final int quoteAssetPrecision;
  final List<OrderType> orderTypes;
  final bool icebergAllowed;
  final bool ocoAllowed;
  final bool isSpotTradingAllowed;
  final bool isMarginTradingAllowed;
  final List<dynamic> filters;
  final List<String> permissions;

  Symbol.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.status = symbolStatusFromStr[m['status']],
        this.baseAsset = m['baseAsset'],
        this.baseAssetPrecision = m['baseAssetPrecision'],
        this.quoteAsset = m['quoteAsset'],
        this.quotePrecision = m['quotePrecision'],
        this.quoteAssetPrecision = m['quoteAssetPrecision'],
        this.orderTypes = List<OrderType>.from(m['orderTypes'].map((o) => orderTypeFromStr[o])),
        this.icebergAllowed = m['icebergAllowed'],
        this.ocoAllowed = m['ocoAllowed'],
        this.isSpotTradingAllowed = m['isSpotTradingAllowed'],
        this.isMarginTradingAllowed = m['isMarginTradingAllowed'],
        this.filters = m['filters'],
        this.permissions = m['permissions'].cast<String>();
}

class SpotExchangeInfo {
  final String timezone;
  final int serverTime;
  final List<RateLimitType> rateLimits;
  final List<dynamic> exchangeFilters;
  final List<Symbol> symbols;

  SpotExchangeInfo.fromMap(Map m)
      : this.exchangeFilters = m['exchangeFilters'],
        this.rateLimits = List<RateLimitType>.from(m["rateLimits"].map((b) => rateLimitFromStr[b])),
        this.serverTime = m["serverTime"],
        this.symbols = List<Symbol>.from(m['symbols'].map((s) => Symbol.fromMap(s))),
        this.timezone = m['timezone'];
}

class Order {
  final String symbol;
  final int orderId;
  final int orderListId;
  final String clientOrderId;
  final double price;
  final double origQty;
  final double executedQty;
  final double cummulativeQuoteQty;
  final OrderStatus status;
  final TimeInForce timeInForce;
  final OrderType type;
  final OrderSide side;
  final double stopPrice;
  final double icebergQty;
  final int time;
  final int updateTime;
  final bool isWorking;
  final double origQuoteOrderQty;

  Order.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.orderId = m['orderId'],
        this.orderListId = m['orderListId'],
        this.clientOrderId = m['clientOrderId'],
        this.price = double.parse(m['price']),
        this.origQty = double.parse(m['origQty']),
        this.executedQty = double.parse(m['executedQty']),
        this.cummulativeQuoteQty = double.parse(m['cummulativeQuoteQty']),
        this.status = orderStatusFromStr[m['status']],
        this.timeInForce = timeInForceFromStr[m['timeInForce']],
        this.type = orderTypeFromStr[m['type']],
        this.side = orderSideFromStr[m['side']],
        this.stopPrice = double.parse(m['stopPrice']),
        this.icebergQty = double.parse(m['icebergQty']),
        this.time = m['time'],
        this.updateTime = m['updateTime'],
        this.isWorking = m['isWorking'],
        this.origQuoteOrderQty = double.parse(m['origQuoteOrderQty']);
}

class Trade {
  final String symbol;
  final int id;
  final int orderId;
  final int orderListId;
  final double price;
  final double qty;
  final double quoteQty;
  final double commission;
  final String commissionAsset;
  final int time;
  final bool isBuyer;
  final bool isMaker;
  final bool isBestMatch;

  Trade.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.id = m['id'],
        this.orderId = m['orderId'],
        this.orderListId = m['orderListId'],
        this.price = double.parse(m['price']),
        this.qty = double.parse(m['qty']),
        this.quoteQty = double.parse(m['quoteQty']),
        this.commission = double.parse(m['commission']),
        this.commissionAsset = m['commissionAsset'],
        this.time = m['time'],
        this.isBuyer = m['isBuyer'],
        this.isMaker = m['isMaker'],
        this.isBestMatch = m['isBestMatch'];
}

class SnapshotData {
  final List<Balance> balances;
  final double totalAssetOfBtc;

  SnapshotData.fromMap(Map m)
      : this.balances = List<Balance>.from(m['balances'].map((b) => Balance.fromMap(b))),
        this.totalAssetOfBtc = double.parse(m['totalAssetOfBtc']);
}

class SnapshotVos {
  final SnapshotData data;
  final String type;
  final int updateTime;

  SnapshotVos.fromMap(Map m)
      : this.data = SnapshotData.fromMap(m['data']),
        this.type = m['type'],
        this.updateTime = m['updateTime'];
}

class AccountSnapshot {
  final int code;
  final String msg;
  final List<SnapshotVos> snapshotVos;

  AccountSnapshot.fromMap(Map m)
      : this.code = m['code'],
        this.msg = m['msg'],
        this.snapshotVos = List<SnapshotVos>.from(m['snapshotVos'].map((e) => SnapshotVos.fromMap(e)));
}

class CryptoDeposit {
  final int insertTime;
  final double amount;
  final String asset;
  final String address;
  final String addressTag;
  final String txId;
  final int status;

  CryptoDeposit.fromMap(Map m)
      : this.insertTime = m['insertTime'],
        this.amount = m['amount'],
        this.asset = m['asset'],
        this.address = m['address'],
        this.addressTag = m.containsKey('addressTag') ? m['addressTag'] : "",
        this.txId = m['txId'],
        this.status = m['status'];
}

class CryptoDepositHistory {
  final List<CryptoDeposit> depositList;
  final bool success;

  CryptoDepositHistory.fromMap(Map m)
      : this.depositList = List<CryptoDeposit>.from(m['depositList'].map((e) => CryptoDeposit.fromMap(e))),
        this.success = m['success'];
}

class WsSpotAccountUpdateEvent {
  final WsUserEventType eventType;
  final int eventTime;
  final int lastUpdateTime;
  List<Balance> balances;

  WsSpotAccountUpdateEvent.fromMap(Map m)
      : this.eventType = wsEventTypeFromStr[m['e']],
        this.eventTime = m['E'],
        this.lastUpdateTime = m['u'],
        this.balances = List<Balance>.from(m['B'].map((b) => Balance.fromMap(b)));
}

class WsBalanceUpdateEvent {
  final WsUserEventType eventType;
  final int eventTime;
  final String asset;
  final double balanceDelta;
  final int clearTime;

  WsBalanceUpdateEvent.fromMap(Map m)
      : this.eventType = wsEventTypeFromStr[m['e']],
        this.eventTime = m['E'],
        this.asset = m['a'],
        this.balanceDelta = double.parse(m['d']),
        this.clearTime = m['T'];
}

class WsOrderUpdateEvent {
  final WsUserEventType eventType;
  final int eventTime;
  final String symbol;
  final String clientOrderId;
  final OrderSide side;
  final OrderType orderType;
  final TimeInForce timeInForce;
  final double quantity;
  final double price;
  final double stopPrice;
  final double icebergQty;
  final int orderListId;
  final String origClientOrderId;
  final String executionType;
  final OrderStatus orderStatus;
  final String rejectReason;
  final int orderId;
  final double lastExecutedQuantity;
  final double cumulativeFilledQuantity;
  final double lastExecutedPrice;
  final double commissionAmount;
  final String commissionAsset;
  final int transactionTime;
  final int tradeId;
  final bool isOnTheBook;
  final bool isMaker;
  final int creationTime;
  final double cumulativeQuoteAssetTransactedQuantity;
  final double lastQuoteAssetTransactedQuantity;
  final double quoteOrderQty;

  WsOrderUpdateEvent.fromMap(Map m)
      : this.eventType = wsEventTypeFromStr[m['e']],
        this.eventTime = m['E'],
        this.symbol = m['s'],
        this.clientOrderId = m['c'],
        this.side = orderSideFromStr[m['S']],
        this.orderType = orderTypeFromStr[m['o']],
        this.timeInForce = timeInForceFromStr[m['f']],
        this.quantity = double.parse(m['q']),
        this.price = double.parse(m['p']),
        this.stopPrice = double.parse(m['P']),
        this.icebergQty = double.parse(m['F']),
        this.orderListId = m['g'],
        this.origClientOrderId = m['C'],
        this.executionType = m['x'],
        this.orderStatus = orderStatusFromStr[m['X']],
        this.rejectReason = m['r'],
        this.orderId = m['i'],
        this.lastExecutedQuantity = double.parse(m['l']),
        this.cumulativeFilledQuantity = double.parse(m['z']),
        this.lastExecutedPrice = double.parse(m['L']),
        this.commissionAmount = double.parse(m['n']),
        this.commissionAsset = m['N'],
        this.transactionTime = m['T'],
        this.tradeId = m['t'],
        this.isOnTheBook = m['w'],
        this.isMaker = m['m'],
        this.creationTime = m['O'],
        this.cumulativeQuoteAssetTransactedQuantity = double.parse(m['Z']),
        this.lastQuoteAssetTransactedQuantity = double.parse(m['Y']),
        this.quoteOrderQty = double.parse(m['Q']);
}

class OcoOrder {
  final String symbol;
  final int orderId;
  final String clientOrderId;

  OcoOrder.fromMap(Map m)
      : this.symbol = m['s'],
        this.orderId = m['i'],
        this.clientOrderId = m['c'];
}

class WsListStatusEvent {
  final WsUserEventType eventType;
  final int eventTime;
  final String symbol;
  final int orderListId;
  final String contingencyType;
  final String listStatusType;
  final String listOrderStatus;
  final String listRejectReason;
  final String listClientOrderId;
  final int transactionTime;

  WsListStatusEvent.fromMap(Map m)
      : this.eventType = wsEventTypeFromStr[m['e']],
        this.eventTime = m['E'],
        this.symbol = m['s'],
        this.orderListId = m['g'],
        this.contingencyType = m['c'],
        this.listStatusType = m['l'],
        this.listOrderStatus = m['L'],
        this.listRejectReason = m['r'],
        this.listClientOrderId = m['C'],
        this.transactionTime = m['T'];
}
