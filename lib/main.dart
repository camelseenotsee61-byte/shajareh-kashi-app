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
      backgroundColor: const Color(0xFF0D2B1E), // سبز تیره
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🌳', style: TextStyle(fontSize: 80)),
                const SizedBox(height: 20),
                const Text(
                  'شجره‌نامه خاندان کاشی حسینی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Tahoma',
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'یادگار ماندگار پیوند، مهر و اصالت خانوادگی',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Column(
                    children: [
                      Text('📌 اهداف برنامه:',
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text(
                        '• حفظ و انتقال شجره‌نامه به نسل‌های آینده\n'
                        '• تقویت پیوندهای خانوادگی و همدلی\n'
                        '• دست‌گیری از نیازمندان با حفظ آبرو و حرمت\n'
                        '• آلبوم خاطرات و دل‌نوشته‌های ماندگار اعضا',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 1.8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FamilyTreePage()),
                    );
                  },
                  icon: const Icon(Icons.account_tree),
                  label: const Text('مشاهده شجره‌نامه خاندان',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('مدیر ارشد و طراح: حمید حسینی',
                      style: TextStyle(color: Colors.amber, fontSize: 14)),
                  style: OutlinedButton.styleFrom(
                    side(color: Colors.amber),
                    padding: const EdgeInsets.symmetric(horizontal:.symmetric(horizontal: 25, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
