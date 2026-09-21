import 'package:flutter/material.dart';

void main() {
  runApp(const ShajarehApp());
}

class ShajarehApp extends StatelessWidget {
  const ShajarehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شجره‌نامه خاندان کاشی حسینی',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Tahoma',
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF0F3822),
      ),
      home: const DashboardScreen(),
    );
  }
}
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A5E), // سرمه‌ای سلطنتی
      appBar: AppBar(
        title: const Text('خاندان کاشی حسینی',
            style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildMenuButton(context, 'تبارنامه', Icons.account_tree),
          _buildMenuButton(context, 'آلبوم', Icons.photo_album),
          _buildMenuButton(context, 'دل‌ها', Icons.favorite),
          _buildMenuButton(context, 'پیام‌ها', Icons.message),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border.all(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.amber),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
