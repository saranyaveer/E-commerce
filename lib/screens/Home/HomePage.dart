// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sample_project/services/storage_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('My Home'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                StorageService().logout();
                Get.toNamed('/login');
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: SizedBox(
                width: 240,
                height: 240,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.list_alt_rounded,
                    size: 40,
                  ),
                  label: const Text(
                    'Tap here',
                    style: TextStyle(fontSize: 25),
                  ),
                  onPressed: () {
                    Get.toNamed('/bottombar');
                    // Get.toNamed('/productlistpage');
                    // Get.to(
                    //   const CookiePage(),
                    //   binding: UserListBinding(),
                    // );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
