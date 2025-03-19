import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cek_sertifikat_controller.dart';

class CekSertifikatView extends GetView<CekSertifikatController> {
  const CekSertifikatView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CekSertifikatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CekSertifikatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
