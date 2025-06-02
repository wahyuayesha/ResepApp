import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuk_app/controller/profile_controller.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Text('Halo, ${profileController.username.value} 👋!', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
    );
  }
}
