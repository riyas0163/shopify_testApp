import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopify/utils/popups/loader.dart';

class Networkmanager extends GetxController {
  static Networkmanager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus = ConnectivityResult.none.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((event) {_updateConnectionstatus(event);
    });
  }

  // Future<void> _updateConnectionstatus(ConnectivityResult result) async {
  //   _connectivityStatus.value = result;
  //   if (_connectivityStatus.value == ConnectivityResult.none) {
  //     _showNoInternetSnackbar();
  //   }
  // }

  Future<void> _updateConnectionstatus(List<ConnectivityResult> results) async {
    if (results.isNotEmpty) {
      final result = results.first;
      _connectivityStatus.value = result;
      if (_connectivityStatus.value == ConnectivityResult.none) {
        _showNoInternetSnackbar();
      }
    }
  }


  void _showNoInternetSnackbar() {
    /// Assuming Tloaders.warningSnack bar is defined and imports are correct
    Tloaders.warningSnackbar(title: 'NO internet Connection');
  }

  /// check the internet connection status
  /// return true if connected 'false' otherwise
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException catch (_) {
      return false; // Handle platform exceptions as needed
    }
  }

  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
