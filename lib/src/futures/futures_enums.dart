enum ContractType {
  PERPETUAL,
  CURRENT_MONTH,
  NEXT_MONTH,
  CURRENT_MONTH_DELIVERING,
  NEXT_MONTH_DELIVERING,
}

Map<ContractType, String> contractTypeToStr = {
  ContractType.PERPETUAL: "PERPETUAL",
  ContractType.CURRENT_MONTH: "CURRENT_MONTH",
  ContractType.NEXT_MONTH: "NEXT_MONTH",
  ContractType.CURRENT_MONTH_DELIVERING: "CURRENT_MONTH_DELIVERING",
  ContractType.NEXT_MONTH_DELIVERING: "NEXT_MONTH_DELIVERING",
};

Map<String, ContractType> contractTypeFromStr = {
  "PERPETUAL": ContractType.PERPETUAL,
  "CURRENT_MONTH": ContractType.CURRENT_MONTH,
  "NEXT_MONTH": ContractType.NEXT_MONTH,
  "CURRENT_MONTH_DELIVERING": ContractType.CURRENT_MONTH_DELIVERING,
  "NEXT_MONTH_DELIVERING": ContractType.NEXT_MONTH_DELIVERING,
};

enum ContractStatus {
  PENDING_TRADING,
  TRADING,
  PRE_DELIVERING,
  DELIVERING,
  DELIVERED,
  PRE_SETTLE,
  SETTLING,
  CLOSE,
}

Map<ContractStatus, String> contractStatusToStr = {
  ContractStatus.PENDING_TRADING: "PENDING_TRADING",
  ContractStatus.TRADING: "TRADING",
  ContractStatus.PRE_DELIVERING: "PRE_DELIVERING",
  ContractStatus.DELIVERING: "DELIVERING",
  ContractStatus.DELIVERED: "DELIVERED",
  ContractStatus.PRE_SETTLE: "PRE_SETTLE",
  ContractStatus.SETTLING: "SETTLING",
  ContractStatus.CLOSE: "CLOSE",
};

Map<String, ContractStatus> contractStatusFromStr = {
  "PENDING_TRADING": ContractStatus.PENDING_TRADING,
  "TRADING": ContractStatus.TRADING,
  "PRE_DELIVERING": ContractStatus.PRE_DELIVERING,
  "DELIVERING": ContractStatus.DELIVERING,
  "DELIVERED": ContractStatus.DELIVERED,
  "PRE_SETTLE": ContractStatus.PRE_SETTLE,
  "SETTLING": ContractStatus.SETTLING,
  "CLOSE": ContractStatus.CLOSE,
};

enum PositionSide {
  BOTH,
  LONG,
  SHORT,
}

Map<PositionSide, String> positionSideToStr = {
  PositionSide.BOTH: "BOTH",
  PositionSide.LONG: "LONG",
  PositionSide.SHORT: "SHORT",
};

Map<String, PositionSide> positionSideFromStr = {
  "BOTH": PositionSide.BOTH,
  "LONG": PositionSide.LONG,
  "SHORT": PositionSide.SHORT,
};

enum WorkingType {
  MARK_PRICE,
  CONTRACT_PRICE,
}

Map<WorkingType, String> workingTypeToStr = {
  WorkingType.MARK_PRICE: "MARK_PRICE",
  WorkingType.CONTRACT_PRICE: "CONTRACT_PRICE",
};

Map<String, WorkingType> workingTypeFromStr = {
  "MARK_PRICE": WorkingType.MARK_PRICE,
  "CONTRACT_PRICE": WorkingType.CONTRACT_PRICE,
};

enum OrderTypeF {
  LIMIT,
  MARKET,
  STOP,
  STOP_MARKET,
  TAKE_PROFIT,
  TAKE_PROFIT_MARKET,
  TRAILING_STOP_MARKET,
}

Map<OrderTypeF, String> orderTypeFToStr = {
  OrderTypeF.LIMIT: "LIMIT",
  OrderTypeF.MARKET: "MARKET",
  OrderTypeF.STOP: "STOP",
  OrderTypeF.STOP_MARKET: "STOP_MARKET",
  OrderTypeF.TAKE_PROFIT: "TAKE_PROFIT",
  OrderTypeF.TAKE_PROFIT_MARKET: "TAKE_PROFIT_MARKET",
  OrderTypeF.TRAILING_STOP_MARKET: "TRAILING_STOP_MARKET",
};

Map<String, OrderTypeF> orderTypeFFromStr = {
  "LIMIT": OrderTypeF.LIMIT,
  "MARKET": OrderTypeF.MARKET,
  "STOP": OrderTypeF.STOP,
  "STOP_MARKET": OrderTypeF.STOP_MARKET,
  "TAKE_PROFIT": OrderTypeF.TAKE_PROFIT,
  "TAKE_PROFIT_MARKET": OrderTypeF.TAKE_PROFIT_MARKET,
  "TRAILING_STOP_MARKET": OrderTypeF.TRAILING_STOP_MARKET,
};

enum IncomeType {
  TRANSFER,
  WELCOME_BONUS,
  REALIZED_PNL,
  FUNDING_FEE,
  COMMISSION,
  INSURANCE_CLEAR,
}

Map<IncomeType, String> incomeTypeToStr = {
  IncomeType.TRANSFER: "TRANSFER",
  IncomeType.WELCOME_BONUS: "WELCOME_BONUS",
  IncomeType.REALIZED_PNL: "REALIZED_PNL",
  IncomeType.FUNDING_FEE: "FUNDING_FEE",
  IncomeType.COMMISSION: "COMMISSION",
  IncomeType.INSURANCE_CLEAR: "INSURANCE_CLEAR",
};

Map<String, IncomeType> incomeTypeFromStr = {
  "TRANSFER": IncomeType.TRANSFER,
  "WELCOME_BONUS": IncomeType.WELCOME_BONUS,
  "REALIZED_PNL": IncomeType.REALIZED_PNL,
  "FUNDING_FEE": IncomeType.FUNDING_FEE,
  "COMMISSION": IncomeType.COMMISSION,
  "INSURANCE_CLEAR": IncomeType.INSURANCE_CLEAR,
};
