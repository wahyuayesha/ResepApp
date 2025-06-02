import 'package:flutter/material.dart';
import 'package:uuk_app/config/colors.dart';

Widget mytextfield({
  required String hintText,
  required TextEditingController controller,
  required Icon icon,
  bool isPassword = false,
}) {
  return TextField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      prefixIcon: icon,
      hintText: hintText,
      hintStyle: TextStyle(color: AppColors.textFieldBorder),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
      filled: true,
      fillColor: AppColors.textFieldBackground,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        borderSide: BorderSide(color: AppColors.textFieldBorder, width: 2),
      ),
    ),
  );
}
