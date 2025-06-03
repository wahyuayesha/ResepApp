import 'package:get/get.dart';
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/main.dart';

class ProfileController extends GetxController {
  RxString username = ''.obs;
  RxString password = ''.obs;

  void loginProfile(String name, String pass) {
    if (name.isEmpty || pass.isEmpty) {
      _showError('Username dan Password tidak boleh kosong');
    } else if (pass.length < 6) {
      _showError('Password minimal 6 karakter');
    } else if (pass == '123456' || pass == 'qwerty') {
      _showError('$pass? Password kamu overrated, silakan ganti');
    } else {
      username.value = name;
      password.value = pass;
      _showSuccess('Login Sukses');
      Get.offAll(MainPage(), transition: Transition.zoom);
    }
  }

  void editProfile(String newUsername, String newPassword) {
    if (newUsername.isEmpty && newPassword.isEmpty) {
      _showError('Username dan password tidak boleh kosong');
    } else if (newPassword.isNotEmpty && newPassword.length < 6) {
      _showError('Password harus minimal 6 karakter');
    } else {
      if (newUsername.isNotEmpty) {
        username.value = newUsername;
      }
      if (newPassword.isNotEmpty) {
        password.value = newPassword;
      }
      Get.back();
    }
  }

  void _showError(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: AppColors.errorSnackbar,
      colorText: AppColors.errorSnackbarText,
    );
  }

  void _showSuccess(String message) {
    Get.snackbar(
      'Sukses',
      message,
      backgroundColor: AppColors.successSnackbar,
      colorText: AppColors.successSnackbarText,
    );
  }
}
