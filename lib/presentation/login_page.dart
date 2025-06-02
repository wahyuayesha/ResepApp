import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/main.dart';
import 'package:uuk_app/controller/profile_controller.dart';
import 'package:uuk_app/widget/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final ProfileController profileController = Get.find<ProfileController>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Image.asset('assets/logo.png', width: 150, height: 150),
                  SizedBox(height: 50),
                  mytextfield(
                    hintText: 'Masukan Username',
                    controller: _usernameController,
                    icon: Icon(Icons.person, color: AppColors.textFieldBorder),
                  ),
                  SizedBox(height: 20),
                  mytextfield(
                    hintText: 'Masukan Password',
                    controller: _passwordController,
                    icon: Icon(Icons.lock, color: AppColors.textFieldBorder),
                    isPassword: true,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;

                if (username.isEmpty || password.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Username dan Password tidak boleh kosong',
                    backgroundColor: AppColors.errorSnackbar,
                    colorText: AppColors.errorSnackbarText,
                  );
                } else if (password.length < 6) {
                  Get.snackbar(
                    'Error',
                    'Password minimal 6 karakter',
                    backgroundColor: AppColors.errorSnackbar,
                    colorText: AppColors.errorSnackbarText,
                  );
                } else if (password == '123456' || password == 'qwerty') {
                  Get.snackbar(
                    'Error',
                    '$password? Password kamu overrated, silakan ganti',
                    backgroundColor: AppColors.errorSnackbar,
                    colorText: AppColors.errorSnackbarText,
                  );
                } else {
                  profileController.username.value = username;
                  Get.snackbar(
                    'Sukses',
                    'Login Sukses',
                    backgroundColor: AppColors.successSnackbar,
                    colorText: AppColors.successSnackbarText,
                  );
                  Get.offAll(MainPage());
                }
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
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
