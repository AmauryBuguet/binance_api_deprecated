class MakerOrder {
  final double price;
  final double quantity;

  MakerOrder.fromList(List l)
      : this.price = double.parse(l[0]),
        this.quantity = double.parse(l[1]);
}

class OrderBook {
  final int lastUpdateId;
  final int messageOutputTime;
  final int transactionTime;
  final List<MakerOrder> bids;
  final List<MakerOrder> asks;

  OrderBook.fromMap(Map m)
      : this.lastUpdateId = m['lastUpdateId'],
        this.messageOutputTime = m.containsKey('E') ? m['E'] : 0,
        this.transactionTime = m.containsKey('T') ? m['T'] : 0,
        this.bids = List<MakerOrder>.from(m['bids'].map((b) => MakerOrder.fromList(b))),
        this.asks = List<MakerOrder>.from(m['asks'].map((b) => MakerOrder.fromList(b)));
}

class PublicTrade {
  final int id;
  final double price;
  final double qty;
  final double quoteQty;
  final int timestamp;
  final bool isBuyerMaker;
  final bool isBestMatch;

  PublicTrade.fromMap(Map m)
      : this.id = m['id'],
        this.price = double.parse(m['price']),
        this.qty = double.parse(m['qty']),
        this.quoteQty = double.parse(m['quoteQty']),
        this.timestamp = m['time'],
        this.isBuyerMaker = m['isBuyerMaker'],
        this.isBestMatch = m.containsKey('isBestMatch') ? m['isBestMatch'] : true;
}

class AggregatedTrade {
  final int id;
  final double price;
  final double qty;
  final int firstTradeId;
  final int lastTradeId;
  final int timestamp;
  final bool isBuyerMaker;
  final bool isBestMatch;

  AggregatedTrade.fromMap(Map m)
      : this.id = m['a'],
        this.price = double.parse(m['p']),
        this.qty = double.parse(m['q']),
        this.firstTradeId = m['f'],
        this.lastTradeId = m['l'],
        this.timestamp = m['T'],
        this.isBuyerMaker = m['m'],
        this.isBestMatch = m.containsKey('M') ? m['M'] : true;
}

class Kline {
  final DateTime openTime;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;
  final int closeTime;

  final double quoteVolume;
  final int tradesCount;
  final double takerBase;
  final double takerQuote;

  Kline.fromList(List c)
      : this.openTime = DateTime.fromMillisecondsSinceEpoch(c.first),
        this.open = double.parse(c[1]),
        this.high = double.parse(c[2]),
        this.low = double.parse(c[3]),
        this.close = double.parse(c[4]),
        this.volume = double.parse(c[5]),
        this.closeTime = c[6],
        this.quoteVolume = double.parse(c[7]),
        this.tradesCount = c[8],
        this.takerBase = double.parse(c[9]),
        this.takerQuote = double.parse(c[10]);
}
