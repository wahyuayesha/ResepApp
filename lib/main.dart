import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuk_app/config/colors.dart';
import 'package:uuk_app/presentation/home.dart';
import 'package:uuk_app/presentation/login_page.dart';
import 'package:uuk_app/presentation/profile.dart';
import 'package:uuk_app/controller/profile_controller.dart';
import 'package:uuk_app/controller/resep_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ProfileController());
  Get.put(ResepController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [HomePage(), ProfilePage(), SizedBox()];

  void _onItemTapped(int index) {
    if (index == 2) {
      Get.offAll(LoginPage(), transition: Transition.zoom);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
