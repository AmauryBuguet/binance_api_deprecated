import 'futures/binance_futures.dart';
import 'spot/binance_spot.dart';

class BinanceAPI {
  BinanceFutures futures;
  BinanceSpot spot;
  final String apiKey;
  final String apiSecret;

  BinanceAPI({this.apiKey = "", this.apiSecret = ""}) {
    futures = BinanceFutures(apiKey: apiKey, apiSecret: apiSecret);
    spot = BinanceSpot(apiKey: apiKey, apiSecret: apiSecret);
  }
}
