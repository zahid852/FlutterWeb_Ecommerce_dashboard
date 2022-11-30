import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<ConnectivityResult> get isConnected;
}

class NetworkInforImpl implements NetworkInfo {
  // InternetConnectionChecker _internetConnectionChecker;
  Connectivity connectivity;
  ConnectivityResult _connectivityResult;
  NetworkInforImpl(this.connectivity, this._connectivityResult);
  @override
  Future<ConnectivityResult> get isConnected =>
      connectivity.checkConnectivity();
}
