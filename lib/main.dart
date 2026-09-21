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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D1B4C), // سرمه‌ای تیره بالا
              Color(0xFF1A1A5E),
              Color(0xFF060D2E), // سرمه‌ای مشکی پایین
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'خاندان کاشی حسینی',
                style: TextStyle(
                  fontFamily: 'Tahoma',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37), // طلایی
                  shadows: [
                    Shadow(color: Colors.black45, blurRadius: 8, offset: Offset(0, 2)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Container(height: 2, width: 160, color: const Color(0xFFD4AF37)),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildMenuButton(context, 'تبارنامه', Icons.park),
                    _buildMenuButton(context, 'آلبوم', Icons.photo_library),
                    _buildMenuButton(context, 'دل‌ها', Icons.favorite),
                    _buildMenuButton(context, 'پیام‌های مستقیم', Icons.mark_email_unread),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF22307A), Color(0xFF16205A)],
        ),
        border: Border.all(color: const Color(0xFFD4AF37), width: 2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black54, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 55, color: const Color(0xFFD4AF37)),
          const SizedBox(height: 12),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Color(0xFFF0E6C8),
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
