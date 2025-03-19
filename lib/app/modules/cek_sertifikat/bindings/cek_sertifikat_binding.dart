import 'package:get/get.dart';

import '../controllers/cek_sertifikat_controller.dart';

class CekSertifikatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CekSertifikatController>(
      () => CekSertifikatController(),
    );
  }
}
