import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/presentation/detail_resep.dart';
import 'package:uuk_app/controller/resep_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});
  ResepController resepController = Get.find<ResepController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primary,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: TextField(
              onChanged: (value) {
                resepController.searchResep(value);
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: AppColors.textFieldBorder),
                hintText: 'Cari Resep...',
                hintStyle: TextStyle(color: AppColors.textFieldBorder),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13)),
                filled: true,
                fillColor: AppColors.textFieldBackground,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: BorderSide(color: AppColors.textFieldBorder, width: 2),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (resepController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                  itemCount: resepController.resepList.length,
                  itemBuilder: (context, index) {
                    var resep = resepController.resepList[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: ListTile(
                        hoverColor: AppColors.primary,
                        onTap: () {
                          Get.to(DetailResep(resep: resep), transition: Transition.rightToLeft);
                        },
                        tileColor: AppColors.background,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(resep.image),
                        ),
                        title: Text(
                          resep.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.star, color: Colors.yellow, size: 16),
                            const SizedBox(width: 5),
                            Text(resep.rating.toString()),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
