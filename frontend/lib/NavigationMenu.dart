import 'package:flutter/material.dart';
import 'package:frontend/modules/pages/Home/home.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        extendBody: true,
        body: controller.screens[controller.selectedIndex.value],

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            controller.selectedIndex.value = 1;
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(Iconsax.home, "Home", 0),
                _item(Iconsax.shop, "Menu", 1),
                const SizedBox(width: 40),
                _item(Iconsax.heart, "Save", 2),
                _item(Iconsax.user, "Profile", 3),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _item(IconData icon, String label, int index) {
    final isActive = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () => controller.selectedIndex.value = index,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? Colors.green : Colors.grey),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.green : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    Home(),
    Container(color: Colors.blue),
    Container(color: Colors.yellow),
    Container(color: Colors.purple),
  ];
}
