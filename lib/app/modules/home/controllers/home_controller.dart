import 'dart:async';

import 'package:bartechacademi/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  late Timer _pindah;
  @override
  void onInit() {
    _pindah = Timer.periodic(
      const Duration(seconds: 5),
      (timer) => Get.off(() => DashboardView(),
      transition: Transition.rightToLeft),
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _pindah.cancel();
    super.onClose();
  }

  
}
