/// ## Binance API
///
/// A library to easily access Binance spot and Binance futures APIs
///
/// Without API KEY and API SECRET , all functions relative to user data or trading won't work.
/// You also need to give the API key the proper authorizations, according to what you want to do
/// with it (margin, futures, spot or read-only).
///

library binance_api;

export 'src/binance.dart';
export 'src/commons/common_classes.dart';
export 'src/commons/common_enums.dart';
export 'src/futures/future_classes.dart';
export 'src/futures/futures_enums.dart';
export 'src/spot/spot_classes.dart';
export 'src/spot/spot_enums.dart';
