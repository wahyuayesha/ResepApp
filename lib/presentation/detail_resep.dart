import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uuk_app/controller/resep_controller.dart';
import 'package:uuk_app/models/resep_model.dart';

// ignore: must_be_immutable
class DetailResep extends StatelessWidget {
  final ResepModel resep;

  DetailResep({super.key, required this.resep});
  ResepController resepController = Get.put(ResepController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Resep', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(resep.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              resep.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                SizedBox(width: 5),
                Text(
                  resep.rating.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                SizedBox(width: 10),
                Icon(Icons.timer_rounded, color: Colors.grey, size: 20),
                SizedBox(width: 5),
                Text(
                  '${resep.cookTimeMinutes + resep.prepTimeMinutes} min',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                SizedBox(width: 10),
                Icon(Icons.people, color: Colors.grey, size: 20),
                SizedBox(width: 5),
                Text(
                  '${resep.servings} servings',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.fastfood_rounded,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  for (var ingredient in resep.ingredients)
                    Text('- $ingredient', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        color: Colors.redAccent,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Instructions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  for (var instruction in resep.instructions)
                    Text('- $instruction', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
