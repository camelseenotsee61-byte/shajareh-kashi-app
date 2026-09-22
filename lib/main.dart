import 'package:flutter/material.dart';

void main() {
  runApp(const ShajarehApp());
}

class ShajarehApp extends StatelessWidget {
  const ShajarehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شجره‌نامه خاندان کاشی حسینی',
      theme: ThemeData(
        fontFamily: 'sans-serif',
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B1E),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('🌳', style: TextStyle(fontSize: 80)),
                  const SizedBox(height: 16),
                  const Text(
                    'شجره‌نامه خاندان کاشی حسینی',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'یادگار ماندگار پیوند، مهر و اصالت خانوادگی',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('📌 ', style: TextStyle(fontSize: 16)),
                            Text(
                              'اهداف برنامه:',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          '• حفظ و انتقال شجره‌نامه به نسل‌های آینده\n'
                          '• تقویت پیوندهای خانوادگی و همدلی\n'
                          '• دست‌گیری از نیازمندان با حفظ آبرو و حرمت\n'
                          '• آلبوم خاطرات و دل‌نوشته‌های ماندگار اعضا',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FamilyTreePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.account_tree_rounded),
                      label: const Text(
                        'مشاهده شجره‌نامه خاندان',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'مدیر ارشد و طراح: حمید حسینی',
                        style: TextStyle(color: Colors.amber, fontSize: 13),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FamilyTreePage extends StatelessWidget {
  FamilyTreePage({super.key});

  Widget _buildPersonCard({
    required String name,
    required String role,
    required IconData icon,
    Color roleColor = Colors.amber,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.07),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: roleColor.withOpacity(0.2),
            child: Icon(icon, color: roleColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  role,
                  style: TextStyle(color: roleColor, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B1E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0D2B1E),
          elevation: 0,
          title: const Text(
            'شجره‌نامه خاندان کاشی حسینی',
            style: TextStyle(color: Colors.amber, fontSize: 17),
          ),
          iconTheme: const IconThemeData(color: Colors.amber),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            children: [
              _buildSectionTitle('سرپرست و ارکان خانواده'),
              _buildPersonCard(
                name: 'حمید حسینی',
                role: 'مدیر ارشد و پدر خانواده',
                icon: Icons.person_rounded,
                roleColor: Colors.amber,
              ),
              _buildPersonCard(
                name: 'منصوره رسولی',
                role: 'همسر و مادر خانواده',
                icon: Icons.favorite_rounded,
                roleColor: const Color(0xFFFF80AB),
              ),

              _buildSectionTitle('فرزندان خانواده'),
              _buildPersonCard(
                name: 'امیررضا حسینی',
                role: 'فرزند بزرگ',
                icon: Icons.face_rounded,
                roleColor: Colors.lightBlueAccent,
              ),
              _buildPersonCard(
                name: 'ریحانه حسینی',
                role: 'فرزند خانواده',
                icon: Icons.face_3_rounded,
                roleColor: Colors.pinkAccent,
              ),
              _buildPersonCard(
                name: 'امیرعباس حسینی',
                role: 'فرزند خانواده',
                icon: Icons.face_rounded,
                roleColor: Colors.lightBlueAccent,
              ),
              _buildPersonCard(
                name: 'زینب حسینی',
                role: 'فرزند کوچک خانواده',
                icon: Icons.face_3_rounded,
                roleColor: Colors.pinkAccent,
              ),

              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '🌱 این شجره‌نامه به مرور با اطلاعات تکمیلی، شاخه‌های اجدادی و بستگان گسترش خواهد یافت.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.6),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
