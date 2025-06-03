import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/controller/profile_controller.dart';
import 'package:uuk_app/widget/textfield.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  ProfileController profileController = Get.find<ProfileController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username: ${profileController.username.value}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Password: ${profileController.password.value}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => editProfile(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: AppColors.background,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget editProfile() {
    return SimpleDialog(
      contentPadding: EdgeInsets.all(20),
      title: Row(
        children: [
          Icon(Icons.edit, color: AppColors.primary),
          SizedBox(width: 10),
          Text(
            'Edit Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
      children: [
        mytextfield(
          hintText: ('New Username'),
          controller: nameController,
          icon: Icon(Icons.person, color: AppColors.textFieldBorder),
        ),
        SizedBox(height: 10),
        mytextfield(
          hintText: ('New Password'),
          controller: passwordController,
          icon: Icon(Icons.lock, color: AppColors.textFieldBorder),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            String username = nameController.text;
            String password = passwordController.text;
            profileController.editProfile(username, password);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonColor,
            foregroundColor: AppColors.background,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            ),
            elevation: 0,
          ),
          child: Text('Confirm', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
