import 'package:connectivity_plus/connectivity_plus.dart'
    show Connectivity, ConnectivityResult;

class NetworkChecker {
  final _connectivity = Connectivity();
  bool isOffline = false;

  void setOffline(List<ConnectivityResult> results) {
    isOffline = results.contains(ConnectivityResult.none);
  }

  NetworkChecker() {
    _connectivity.checkConnectivity().then(setOffline);
    _connectivity.onConnectivityChanged.listen(setOffline);
  }
}
