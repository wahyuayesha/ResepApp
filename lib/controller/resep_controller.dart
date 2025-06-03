import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/models/resep_model.dart';

class ResepController extends GetxController{
  var baseUrl = 'https://dummyjson.com/recipes';
  var resepList = [].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchResep();
    super.onInit();
  }

  void fetchResep() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        resepList.value = List<ResepModel>.from(
          (data['recipes'] as List).map((item) => ResepModel.fromJson(item))
        );
      } else {
        Get.snackbar('Error', 'Gagal memuat data resep :(',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.errorSnackbar,
          colorText: AppColors.errorSnackbarText,);
      }
    } catch (e) {
      Get.snackbar('Error', '$e',
        backgroundColor: AppColors.errorSnackbar,
        colorText: AppColors.errorSnackbarText,);
    } finally {
      isLoading.value = false;
    }
  }

  void searchResep(String query) {
    if (query.isEmpty) {
      fetchResep();
    } else {
      var filteredList = resepList.where((resep) => resep.name.toLowerCase().contains(query.toLowerCase())).toList();
      resepList.value = filteredList;
    }
  }
}