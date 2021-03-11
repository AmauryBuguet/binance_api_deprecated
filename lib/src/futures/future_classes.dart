import '../commons/binance_common.dart';
import '../commons/common_enums.dart';

import 'futures_enums.dart';

class RateLimit {
  final String interval;
  final int intervalNum;
  final int limit;
  final String rateLimitType;

  RateLimit.fromMap(Map m)
      : this.interval = m["interval"],
        this.intervalNum = m["intervalNum"],
        this.limit = m["limit"],
        this.rateLimitType = m["rateLimitType"];
}

class SymbolF {
  final String symbol;
  final String pair;
  final ContractType contractType;
  final int deliveryDate;
  final int onboardDate;
  final ContractStatus status;
  final double maintMarginPercent;
  final double requiredMarginPercent;
  final String baseAsset;
  final String quoteAsset;
  final String marginAsset;
  final int pricePrecision;
  final int quantityPrecision;
  final int baseAssetPrecision;
  final int quotePrecision;
  final String underlyingType;
  final List<String> underlyingSubType;
  final int settlePlan;
  final double triggerProtect;
  final List<dynamic> filters;
  final List<OrderTypeF> orderTypes;
  final TimeInForce timeInForce;

  SymbolF.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.pair = m['pair'],
        this.contractType = contractTypeFromStr[m['contractType']],
        this.deliveryDate = m['deliveryDate'],
        this.onboardDate = m['onboardDate'],
        this.status = contractStatusFromStr[m['status']],
        this.maintMarginPercent = double.parse(m['maintMarginPercent']),
        this.requiredMarginPercent = double.parse(m['requiredMarginPercent']),
        this.baseAsset = m['baseAsset'],
        this.quoteAsset = m['quoteAsset'],
        this.marginAsset = m['marginAsset '],
        this.pricePrecision = m['pricePrecision'],
        this.quantityPrecision = m['quantityPrecision'],
        this.baseAssetPrecision = m['baseAssetPrecision'],
        this.quotePrecision = m['quotePrecision'],
        this.underlyingType = m['underlyingType'],
        this.underlyingSubType = m['underlyingSubType'].cast<String>(),
        this.settlePlan = m['settlePlan'],
        this.triggerProtect = double.parse(m['triggerProtect']),
        this.filters = m['filters'],
        this.orderTypes = List<OrderTypeF>.from(m['orderTypes'].map((o) => orderTypeFFromStr[o])),
        this.timeInForce = timeInForceFromStr[m['timeInForce']];
}

class FuturesExchangeInfo {
  final List<dynamic> exchangeFilters;
  final List<RateLimit> rateLimits;
  final int serverTime;
  final List<SymbolF> symbols;
  final String timezone;

  FuturesExchangeInfo.fromMap(Map m)
      : this.exchangeFilters = m['exchangeFilters'],
        this.rateLimits = List<RateLimit>.from(m["rateLimits"].map((b) => RateLimit.fromMap(b))),
        this.serverTime = m["serverTime"],
        this.symbols = List<SymbolF>.from(m['symbols'].map((s) => SymbolF.fromMap(s))),
        this.timezone = m['timezone'];
}

class PremiumIndex {
  final String symbol;
  final double markPrice;
  final double indexPrice;
  final double estimatedSettlePrice;
  final double lastFundingRate;
  final int nextFundingTime;
  final double interestRate;
  final int time;

  PremiumIndex.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.markPrice = double.parse(m['markPrice']),
        this.indexPrice = double.parse(m['indexPrice']),
        this.estimatedSettlePrice = m.containsKey('estimatedSettlePrice') ? double.parse(m['estimatedSettlePrice']) : 0,
        this.lastFundingRate = double.parse(m['lastFundingRate']),
        this.nextFundingTime = m['nextFundingTime'],
        this.interestRate = double.parse(m['interestRate']),
        this.time = m['time'];
}

class FundingRate {
  final String symbol;
  final double fundingRate;
  final int fundingTime;

  FundingRate.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.fundingRate = double.parse(m['fundingRate']),
        this.fundingTime = m['fundingTime'];
}

class Ticker24hStatistics {
  final String symbol;
  final double priceChange;
  final double priceChangePercent;
  final double weightedAvgPrice;
  final double prevClosePrice;
  final double lastPrice;
  final double lastQty;
  final double openPrice;
  final double highPrice;
  final double lowPrice;
  final double volume;
  final double quoteVolume;
  final int openTime;
  final int closeTime;
  final int firstId;
  final int lastId;
  final int count;

  Ticker24hStatistics.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.priceChange = double.parse(m['priceChange']),
        this.priceChangePercent = double.parse(m['priceChangePercent']),
        this.weightedAvgPrice = double.parse(m['weightedAvgPrice']),
        this.prevClosePrice = m.containsKey('prevClosePrice') ? double.parse(m['prevClosePrice']) : 0,
        this.lastPrice = double.parse(m['lastPrice']),
        this.lastQty = double.parse(m['lastQty']),
        this.openPrice = double.parse(m['openPrice']),
        this.highPrice = double.parse(m['highPrice']),
        this.lowPrice = double.parse(m['lowPrice']),
        this.volume = double.parse(m['volume']),
        this.quoteVolume = double.parse(m['quoteVolume']),
        this.openTime = m['openTime'],
        this.closeTime = m['closeTime'],
        this.firstId = m['firstId'],
        this.lastId = m['lastId'],
        this.count = m['count'];
}

class PriceTicker {
  final String symbol;
  final double price;
  final int time;

  PriceTicker.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.price = double.parse(m['price']),
        this.time = m['time'];
}

class BookTicker {
  final String symbol;
  final double bidPrice;
  final double bidQty;
  final double askPrice;
  final double askQty;
  final int time;

  BookTicker.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.bidPrice = double.parse(m['bidPrice']),
        this.bidQty = double.parse(m['bidQty']),
        this.askPrice = double.parse(m['askPrice']),
        this.askQty = double.parse(m['askQty']),
        this.time = m['time'];
}

class LiquidationOrder {
  final String symbol;
  final double price;
  final double origQty;
  final double executedQty;
  final double averagePrice;
  final OrderStatus status;
  final TimeInForce timeInForce;
  final OrderTypeF type;
  final OrderSide side;
  final int time;

  LiquidationOrder.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.price = double.parse(m['price']),
        this.origQty = double.parse(m['origQty']),
        this.executedQty = double.parse(m['executedQty']),
        this.averagePrice = double.parse(m['averagePrice']),
        this.status = orderStatusFromStr[m['status']],
        this.timeInForce = timeInForceFromStr[m['timeInForce']],
        this.type = orderTypeFFromStr[m['type']],
        this.side = orderSideFromStr[m['side']],
        this.time = m['time'];
}

class OpenInterest {
  final double openInterest;
  final String symbol;
  final int time;

  OpenInterest.fromMap(Map m)
      : this.openInterest = double.parse(m['openInterest']),
        this.symbol = m['symbol'],
        this.time = m['time'];
}

class OpenInterestStatistics {
  final String symbol;
  final double sumOpenInterest;
  final double sumOpenInterestValue;
  final int timestamp;

  OpenInterestStatistics.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.sumOpenInterest = double.parse(m['sumOpenInterest']),
        this.sumOpenInterestValue = double.parse(m['sumOpenInterestValue']),
        this.timestamp = m['timestamp'];
}

class LongShortInfo {
  final String symbol;
  final double longShortRatio;
  final double longAccount;
  final double shortAccount;
  final int timestamp;

  LongShortInfo.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.longShortRatio = double.parse(m['longShortRatio']),
        this.longAccount = double.parse(m['longAccount']),
        this.shortAccount = double.parse(m['shortAccount']),
        this.timestamp = m['timestamp'];
}

class BuySellInfo {
  final double buySellRatio;
  final double buyVol;
  final double sellVol;
  final int timestamp;

  BuySellInfo.fromMap(Map m)
      : this.buySellRatio = double.parse(m['buySellRatio']),
        this.buyVol = double.parse(m['buyVol']),
        this.sellVol = double.parse(m['sellVol']),
        this.timestamp = m['timestamp'];
}

class BaseAsset {
  final String baseAsset;
  final double weightInQuantity;
  final double weightInPercentage;

  BaseAsset.fromMap(Map m)
      : this.baseAsset = m['baseAsset'],
        this.weightInQuantity = double.parse(m['weightInQuantity']),
        this.weightInPercentage = double.parse(m['weightInPercentage']);
}

class IndexInfo {
  final String symbol;
  final int time;
  final List<BaseAsset> baseAssetList;

  IndexInfo.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.time = m['time'],
        this.baseAssetList = List<BaseAsset>.from(m['baseAssetList'].map((b) => BaseAsset.fromMap(b)));
}

class OrderF {
  final String clientOrderId;
  final double cumQty;
  final double cumQuote;
  final double executedQty;
  final int orderId;
  final double avgPrice;
  final double origQty;
  final double price;
  final bool reduceOnly;
  final OrderSide side;
  final PositionSide positionSide;
  final OrderStatus status;
  final double stopPrice;
  final bool closePosition;
  final String symbol;
  final TimeInForce timeInForce;
  final OrderTypeF type;
  final OrderTypeF origType;
  final double activatePrice;
  final double priceRate;
  final int updateTime;
  final WorkingType workingType;
  final bool priceProtect;

  OrderF.fromMap(Map m)
      : this.clientOrderId = m['clientOrderId'],
        this.cumQty = double.parse(m['cumQty']),
        this.cumQuote = double.parse(m['cumQuote']),
        this.executedQty = double.parse(m['executedQty']),
        this.orderId = m['orderId'],
        this.avgPrice = double.parse(m['avgPrice']),
        this.origQty = double.parse(m['origQty']),
        this.price = double.parse(m['price']),
        this.reduceOnly = m['reduceOnly'],
        this.side = orderSideFromStr[m['side']],
        this.positionSide = positionSideFromStr[m['positionSide']],
        this.status = orderStatusFromStr[m['status']],
        this.stopPrice = double.parse(m['stopPrice']),
        this.closePosition = m['closePosition'],
        this.symbol = m['symbol'],
        this.timeInForce = timeInForceFromStr[m['timeInForce']],
        this.type = orderTypeFFromStr[m['type']],
        this.origType = orderTypeFFromStr[m['origType']],
        this.activatePrice = double.parse(m['activatePrice']),
        this.priceRate = double.parse(m['priceRate']),
        this.updateTime = m['updateTime'],
        this.workingType = workingTypeFromStr[m['workingType']],
        this.priceProtect = m['priceProtect'];
}

class FuturesAccountInfo {
  final int feeTier;
  final bool canTrade;
  final bool canDeposit;
  final bool canWithdraw;
  final int updateTime;
  final double totalInitialMargin;
  final double totalMaintMargin;
  final double totalWalletBalance;
  final double totalUnrealizedProfit;
  final double totalMarginBalance;
  final double totalPositionInitialMargin;
  final double totalOpenOrderInitialMargin;
  final double totalCrossWalletBalance;
  final double totalCrossUnPnl;
  final double availableBalance;
  final double maxWithdrawAmount;
  final List<Asset> assets;
  final List<Position> positions;

  FuturesAccountInfo.fromMap(Map<String, dynamic> m)
      : this.feeTier = m["feeTier"],
        this.canTrade = m["canTrade"],
        this.canDeposit = m["canDeposit"],
        this.canWithdraw = m["canWithdraw"],
        this.updateTime = m["updateTime"],
        this.totalInitialMargin = double.parse(m["totalInitialMargin"]),
        this.totalMaintMargin = double.parse(m["totalMaintMargin"]),
        this.totalWalletBalance = double.parse(m["totalWalletBalance"]),
        this.totalUnrealizedProfit = double.parse(m["totalUnrealizedProfit"]),
        this.totalMarginBalance = double.parse(m["totalMarginBalance"]),
        this.totalPositionInitialMargin = double.parse(m["totalPositionInitialMargin"]),
        this.totalOpenOrderInitialMargin = double.parse(m["totalOpenOrderInitialMargin"]),
        this.totalCrossWalletBalance = double.parse(m["totalCrossWalletBalance"]),
        this.totalCrossUnPnl = double.parse(m["totalCrossUnPnl"]),
        this.availableBalance = double.parse(m["availableBalance"]),
        this.maxWithdrawAmount = double.parse(m["maxWithdrawAmount"]),
        this.assets = List<Asset>.from(m["assets"].map((e) => Asset.fromMap(e))).where((e) => e.walletBalance != 0).toList(),
        this.positions = List<Position>.from(m["positions"].map((e) => Position.fromMap(e)))
            .where((element) => element.positionAmount != 0)
            .toList();
}

class Asset {
  final String name;
  final double walletBalance;
  final double unrealizedProfit;
  final double marginBalance;
  final double maintMargin;
  final double initialMargin;
  final double positionInitialMargin;
  final double openOrderInitialMargin;
  final double crossWalletBalance;
  final double crossUnPnl;
  final double availableBalance;
  final double maxWithdrawAmount;

  Asset.fromMap(Map<String, dynamic> m)
      : this.name = m["asset"],
        this.walletBalance = double.parse(m["walletBalance"]),
        this.unrealizedProfit = double.parse(m["unrealizedProfit"]),
        this.marginBalance = double.parse(m["marginBalance"]),
        this.maintMargin = double.parse(m["maintMargin"]),
        this.initialMargin = double.parse(m["initialMargin"]),
        this.positionInitialMargin = double.parse(m["positionInitialMargin"]),
        this.openOrderInitialMargin = double.parse(m["openOrderInitialMargin"]),
        this.crossWalletBalance = double.parse(m["crossWalletBalance"]),
        this.crossUnPnl = double.parse(m["crossUnPnl"]),
        this.availableBalance = double.parse(m["availableBalance"]),
        this.maxWithdrawAmount = double.parse(m["maxWithdrawAmount"]);
}

class Position {
  final String symbol;
  final double initialMargin;
  final double maintMargin;
  final double unrealizedProfit;
  final int leverage;
  final bool isolated;
  final double entryPrice;
  final String positionSide;
  final double positionAmount;

  Position.fromMap(Map<String, dynamic> m)
      : this.symbol = m["symbol"],
        this.initialMargin = double.parse(m["initialMargin"]),
        this.maintMargin = double.parse(m["maintMargin"]),
        this.unrealizedProfit = double.parse(m["unrealizedProfit"]),
        this.leverage = int.parse(m["leverage"]),
        this.isolated = m['isolated'],
        this.entryPrice = double.parse(m["entryPrice"]),
        this.positionSide = m["positionSide"],
        this.positionAmount = double.parse(m["positionAmt"]);
}

class TradeF {
  final bool buyer;
  final double commission;
  final String commissionAsset;
  final int id;
  final bool maker;
  final int orderId;
  final double price;
  final double qty;
  final double quoteQty;
  final double realizedPnl;
  final OrderSide side;
  final PositionSide positionSide;
  final String symbol;
  final int time;

  TradeF.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.id = m['id'],
        this.orderId = m['orderId'],
        this.price = double.parse(m['price']),
        this.qty = double.parse(m['qty']),
        this.quoteQty = double.parse(m['quoteQty']),
        this.commission = double.parse(m['commission']),
        this.commissionAsset = m['commissionAsset'],
        this.time = m['time'],
        this.buyer = m['buyer'],
        this.maker = m['maker'],
        this.realizedPnl = double.parse(m['realizedPnl']),
        this.positionSide = positionSideFromStr[m['positionSide']],
        this.side = orderSideFromStr[m['side']];
}

class Income {
  final String symbol;
  final IncomeType incomeType;
  final String income;
  // final double income;
  final String asset;
  final String info;
  final int time;
  final int tranId;
  final int tradeId;

  Income.fromMap(Map m)
      : this.symbol = m['symbol'],
        this.incomeType = incomeTypeFromStr[m['incomeType']],
        // this.income = double.parse(m['income']),
        this.income = m['income'],
        this.asset = m['asset'],
        this.info = m['info'],
        this.time = m['time'],
        this.tranId = m['tranId'],
        this.tradeId = int.tryParse(m['tradeId']) ?? 0;
}
