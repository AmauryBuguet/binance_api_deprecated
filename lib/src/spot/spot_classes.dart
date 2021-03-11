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
