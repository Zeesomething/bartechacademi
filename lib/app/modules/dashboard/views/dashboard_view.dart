import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BartechAcademy'),
        centerTitle: true,
      ),
      body: Obx(() {
        final isLoading = controller.isLoading.value;

        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Training Carousel
                const Text(
                  'Available Training',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                _buildTrainingCarousel(),

                const SizedBox(height: 32),

                // Navigation Options
                const Text(
                  'Navigate To',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Certificate Check Navigation Card
                _buildNavigationCard(
                  icon: Icons.verified,
                  iconColor: Colors.green.shade700,
                  backgroundColor: Colors.green.shade100,
                  title: 'Check Certificate',
                  subtitle: 'Verify and check your certificates',
                  onTap: () => Get.toNamed('/certificate-check'),
                ),

                const SizedBox(height: 12),

                // Training Catalog Navigation Card
                _buildNavigationCard(
                  icon: Icons.menu_book,
                  iconColor: Colors.blue.shade700,
                  backgroundColor: Colors.blue.shade100,
                  title: 'Training Catalog',
                  subtitle: 'Browse all available training courses',
                  onTap: () => Get.toNamed('/training-list'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildTrainingCarousel() {
  final carouselTrainings = controller.carouselTrainings;

  if (carouselTrainings.isEmpty) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'No training courses available',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  return CarouselSlider.builder(
    itemCount: carouselTrainings.length,
    itemBuilder: (context, index, realIndex) {
      final training = carouselTrainings[index];
      return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey.shade200,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Fixed-height header
              Container(
                height: 100, // Reduced from 120
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.blue.shade300,
                ),
                width: double.infinity,
                child: const Center(
                  child: Icon(
                    Icons.school,
                    size: 40, // Reduced from 50
                    color: Colors.white,
                  ),
                ),
              ),
              // Content section with Expanded to handle variable height
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0), // Reduced from 12.0
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // Use minimal space
                    children: [
                      Text(
                        training.namaTraining ?? 'Untitled Training',
                        style: const TextStyle(
                          fontSize: 16, // Reduced from 18
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4), // Reduced from 8
                      Text(
                        training.formattedTanggal ?? 'No date specified',
                        style: TextStyle(
                          fontSize: 13, // Reduced from 14
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Spacer(), // Push button to bottom
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 8.0), // Smaller button
                          ),
                          onPressed: () {
                            // Handle training enrollment
                            Get.toNamed('/training-detail', arguments: training);
                          },
                          child: const Text('Enroll Now'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
    options: CarouselOptions(
      height: 250, // Reduced from 280 to fit content better
      viewportFraction: 0.85,
      enlargeCenterPage: true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 5),
    ),
  );
}
      
  }

  Widget _buildNavigationCard({
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

