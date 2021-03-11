# binance_api

A library to easily access Binance spot and Binance futures APIs.

Without API KEY and API SECRET , all functions relative to user data or trading won't work.
You also need to give the API key the proper authorizations, according to what you want to do with it (margin, futures, spot or read-only).

## Getting Started

Import with ```import 'binance_api/binance_api.dart';```

Then create an instance of BinanceAPI class (with or without api keys) and use members functions of instance.spot and instance.futures as you please.