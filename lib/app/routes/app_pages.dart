import 'package:get/get.dart';

import '../modules/cek_sertifikat/bindings/cek_sertifikat_binding.dart';
import '../modules/cek_sertifikat/views/cek_sertifikat_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/list_training/bindings/list_training_binding.dart';
import '../modules/list_training/views/list_training_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CEK_SERTIFIKAT,
      page: () => const CekSertifikatView(),
      binding: CekSertifikatBinding(),
    ),
    GetPage(
      name: _Paths.LIST_TRAINING,
      page: () => const ListTrainingView(),
      binding: ListTrainingBinding(),
    ),
  ];
}
