enum OrderStatus {
  NEW,
  PARTIALLY_FILLED,
  FILLED,
  CANCELED,
  PENDING_CANCEL,
  REJECTED,
  EXPIRED,
}

Map<OrderStatus, String> orderStatusToStr = {
  OrderStatus.NEW: "NEW",
  OrderStatus.PARTIALLY_FILLED: "PARTIALLY_FILLED",
  OrderStatus.FILLED: "FILLED",
  OrderStatus.CANCELED: "CANCELED",
  OrderStatus.PENDING_CANCEL: "PENDING_CANCEL",
  OrderStatus.REJECTED: "REJECTED",
  OrderStatus.EXPIRED: "EXPIRED",
};

Map<String, OrderStatus> orderStatusFromStr = {
  "NEW": OrderStatus.NEW,
  "PARTIALLY_FILLED": OrderStatus.PARTIALLY_FILLED,
  "FILLED": OrderStatus.FILLED,
  "CANCELED": OrderStatus.CANCELED,
  "PENDING_CANCEL": OrderStatus.PENDING_CANCEL,
  "REJECTED": OrderStatus.REJECTED,
  "EXPIRED": OrderStatus.EXPIRED,
};

enum OrderSide {
  BUY,
  SELL,
}

Map<OrderSide, String> orderSideToStr = {
  OrderSide.BUY: "BUY",
  OrderSide.SELL: "SELL",
};

Map<String, OrderSide> orderSideFromStr = {
  "BUY": OrderSide.BUY,
  "SELL": OrderSide.SELL,
};

enum TimeInForce {
  GTC,
  IOC,
  FOK,
  GTX,
}

Map<TimeInForce, String> timeInForceToStr = {
  TimeInForce.GTC: "GTC",
  TimeInForce.IOC: "IOC",
  TimeInForce.FOK: "FOK",
  TimeInForce.GTX: "GTX",
};

Map<String, TimeInForce> timeInForceFromStr = {
  "GTC": TimeInForce.GTC,
  "IOC": TimeInForce.IOC,
  "FOK": TimeInForce.FOK,
  "GTX": TimeInForce.GTX,
};

enum ResponseType {
  ACK,
  RESULT,
  FULL,
}

Map<ResponseType, String> responseTypeToStr = {
  ResponseType.ACK: "ACK",
  ResponseType.RESULT: "RESULT",
  ResponseType.FULL: "FULL",
};

Map<String, ResponseType> responseTypeFromStr = {
  "ACK": ResponseType.ACK,
  "RESULT": ResponseType.RESULT,
  "FULL": ResponseType.FULL,
};

enum Interval {
  INTERVAL_1m,
  INTERVAL_3m,
  INTERVAL_5m,
  INTERVAL_15m,
  INTERVAL_30m,
  INTERVAL_1h,
  INTERVAL_2h,
  INTERVAL_4h,
  INTERVAL_6h,
  INTERVAL_8h,
  INTERVAL_12h,
  INTERVAL_1d,
  INTERVAL_3d,
  INTERVAL_1w,
  INTERVAL_1M,
}

Map<Interval, String> intervalToStr = {
  Interval.INTERVAL_1m: "1m",
  Interval.INTERVAL_3m: "3m",
  Interval.INTERVAL_5m: "5m",
  Interval.INTERVAL_15m: "15m",
  Interval.INTERVAL_30m: "30m",
  Interval.INTERVAL_1h: "1h",
  Interval.INTERVAL_2h: "2h",
  Interval.INTERVAL_4h: "4h",
  Interval.INTERVAL_6h: "6h",
  Interval.INTERVAL_8h: "8h",
  Interval.INTERVAL_12h: "12h",
  Interval.INTERVAL_1d: "1d",
  Interval.INTERVAL_3d: "3d",
  Interval.INTERVAL_1w: "1w",
  Interval.INTERVAL_1M: "1M",
};

Map<String, Interval> intervalFromStr = {
  "1m": Interval.INTERVAL_1m,
  "3m": Interval.INTERVAL_3m,
  "5m": Interval.INTERVAL_5m,
  "15m": Interval.INTERVAL_15m,
  "30m": Interval.INTERVAL_30m,
  "1h": Interval.INTERVAL_1h,
  "2h": Interval.INTERVAL_2h,
  "4h": Interval.INTERVAL_4h,
  "6h": Interval.INTERVAL_6h,
  "8h": Interval.INTERVAL_8h,
  "12h": Interval.INTERVAL_12h,
  "1d": Interval.INTERVAL_1d,
  "3d": Interval.INTERVAL_3d,
  "1w": Interval.INTERVAL_1w,
  "1M": Interval.INTERVAL_1M,
};

enum RateLimitType {
  REQUEST_WEIGHT,
  ORDERS,
  RAW_REQUESTS,
}

Map<RateLimitType, String> rateLimitToStr = {
  RateLimitType.REQUEST_WEIGHT: "REQUEST_WEIGHT",
  RateLimitType.ORDERS: "ORDERS",
  RateLimitType.RAW_REQUESTS: "RAW_REQUESTS",
};

Map<String, RateLimitType> rateLimitFromStr = {
  "REQUEST_WEIGHT": RateLimitType.REQUEST_WEIGHT,
  "ORDERS": RateLimitType.ORDERS,
  "RAW_REQUESTS": RateLimitType.RAW_REQUESTS,
};

enum RateLimitInterval {
  SECOND,
  MINUTE,
  DAY,
}

Map<RateLimitInterval, String> rateLimitIntervalToStr = {
  RateLimitInterval.SECOND: "SECOND",
  RateLimitInterval.MINUTE: "MINUTE",
  RateLimitInterval.DAY: "DAY",
};

Map<String, RateLimitInterval> rateLimitIntervalFromStr = {
  "SECOND": RateLimitInterval.SECOND,
  "MINUTE": RateLimitInterval.MINUTE,
  "DAY": RateLimitInterval.DAY,
};

enum WsUserEventType {
  OUTBOUND_ACCOUNT_POSITION,
  BALANCE_UPDATE,
  EXECUTION_REPORT,
  LIST_STATUS,
  LISTEN_KEY_EXPIRED,
  MARGIN_CALL,
  ACCOUNT_UPDATE,
  ORDER_TRADE_UPDATE,
  ACCOUNT_CONFIG_UPDATE,
}

Map<String, WsUserEventType> wsEventTypeFromStr = {
  "outboundAccountPosition": WsUserEventType.OUTBOUND_ACCOUNT_POSITION,
  "balanceUpdate": WsUserEventType.BALANCE_UPDATE,
  "executionReport": WsUserEventType.EXECUTION_REPORT,
  "listStatus": WsUserEventType.LIST_STATUS,
  "listenKeyExpired": WsUserEventType.LISTEN_KEY_EXPIRED,
  "MARGIN_CALL": WsUserEventType.MARGIN_CALL,
  "ACCOUNT_UPDATE": WsUserEventType.ACCOUNT_UPDATE,
  "ORDER_TRADE_UPDATE": WsUserEventType.ORDER_TRADE_UPDATE,
  "ACCOUNT_CONFIG_UPDATE": WsUserEventType.ACCOUNT_CONFIG_UPDATE,
};

enum SecurityType {
  NONE,
  TRADE,
  MARGIN,
  USER_DATA,
  USER_STREAM,
  MARKET_DATA,
}

enum RequestType {
  GET,
  POST,
  DELETE,
  PUT,
}
