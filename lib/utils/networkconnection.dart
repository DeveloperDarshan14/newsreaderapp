



import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings {


  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
            () => ConnectionManagerController());
  }
}


class ConnectionManagerController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  var connectionType = 0.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;

        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
       /* Get.snackbar('Error', 'Failed to get connection type',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withOpacity(0.10),
            colorText: Appcolors.apptheme_color,
            borderColor: Colors.red,
            borderWidth: 1,
            margin: EdgeInsets.only(bottom: 20, left: 10.0, right: 10.0));*/
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}