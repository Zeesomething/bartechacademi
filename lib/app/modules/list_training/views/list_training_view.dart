import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_training_controller.dart';

class ListTrainingView extends GetView<ListTrainingController> {
  const ListTrainingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListTrainingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListTrainingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
