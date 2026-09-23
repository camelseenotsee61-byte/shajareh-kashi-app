import 'package:flutter/material.dart';
import 'family_member.dart';

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

  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          if (subtitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 4),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.white54, fontSize: 11),
              ),
            ),
        ],
      ),
    );
  }
    Widget _buildPersonCard({
    required String name,
    required String role,
    String? birthDate,
    String? deathDate,
    String? spouse,
    List<String>? children,
    bool isHighlight = false,
    bool isDeceased = false,
  }) {
    Color mainColor = isHighlight
        ? Colors.amber
        : (isDeceased ? Colors.white60 : Colors.tealAccent);

    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          showMemberDetails(context, FamilyMember(
            name: name,
            birthDate: birthDate,
            deathDate: deathDate,
            spouse: spouse,
            description: (children == null || children.isEmpty) ? role : role + ' — فرزندان: ' + children.join('، '),
          ));
        },
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isHighlight
            ? Colors.amber.withOpacity(0.12)
            : Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isHighlight ? Colors.amber : Colors.white12,
          width: isHighlight ? 1.5 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: mainColor.withOpacity(0.2),
                child: Icon(
                  isDeceased ? Icons.eco_outlined : Icons.person_rounded,
                  color: mainColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
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
                    Text(
                      role,
                      style: TextStyle(color: mainColor, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (birthDate != null || deathDate != null || spouse != null)
            const Divider(color: Colors.white12, height: 16),
          if (birthDate != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Text('🎂 تولد: ',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text(birthDate,
                      style: const TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          if (deathDate != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Text('🕊 وفات: ',
                      style: TextStyle(color: Colors.white54, fontSize: 12)),
                  Text(deathDate,
                      style: const TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
            ),
          if (spouse != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Text('💍 همسر: ',
                      style: TextStyle(color: Colors.white70, fontSize: 12)),
                  Text(spouse,
                      style: const TextStyle(
                          color: Colors.amberAccent, fontSize: 12)),
                ],
              ),
            ),
          if (children != null && children.isNotEmpty) ...[
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('👥 فرزندان:',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 11,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  ...children.map((child) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        child: Text('• $child',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 11)),
                      )),
                ],
              ),
            ),
          ],
        ],
      ),
    ), 
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
    style: TextStyle(color: Colors.amber, fontSize: 16),
  ),
  iconTheme: const IconThemeData(color: Colors.amber),
  actions: [
    IconButton(
      icon: const Icon(Icons.help_outline),
      onPressed: () {
        _showHelpDialog(context);
      },
    ),
  ],
),

        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            children: [
              // ================= نسل اول =================
              _buildSectionTitle('نسل اول: سرسلسله و اجداد',
                  'پدربزرگ‌ها و مادربزرگ‌های والامقام'),
              _buildPersonCard(
                name: 'مرحوم باقر و مرحومه سیده عالیه بیگم موسوی',
                role: 'اجداد پدری خاندان',
                isDeceased: true,
              ),
              _buildPersonCard(
                name: 'مرحوم محمدحسن حسینی و مرحومه آقا سلطان فتحعلی',
                role: 'اجداد مادری خاندان',
                isDeceased: true,
              ),

              // ================= نسل دوم =================
              _buildSectionTitle(
                  'نسل دوم: پدر و مادر ارجمند', 'بنیان‌گذاران این شاخه از خاندان'),
              _buildPersonCard(
                name: 'مرحوم میرزا محمدعلی کاشی حسینی',
                role: 'پدر بزرگوار',
                birthDate: '۶ اردیبهشت ۱۳۰۷',
                deathDate: '۶ بهمن ۱۳۸۲',
                isDeceased: true,
              ),
              _buildPersonCard(
                name: 'مرحومه جمیله حسینی',
                role: 'مادر مهربان',
                birthDate: '۲۰ شهریور ۱۳۱۷',
                deathDate: '۱۱ دی ۱۴۰۳',
                isDeceased: true,
              ),

              // ================= نسل سوم =================
              _buildSectionTitle(
                  'نسل سوم: فرزندان و شاخه‌های خانواده', 'برادران، خواهران و همسران محترم'),
              
              // حسن کاشی حسینی
              _buildPersonCard(
                name: 'مرحوم حسن کاشی حسینی',
                role: 'فرزند ارشد خانواده',
                birthDate: '۵ شهریور ۱۳۳۳',
                deathDate: '۲۹ آبان ۱۳۹۸',
                spouse: 'سرکار خانم عصمت بهجتی',
                isDeceased: true,
                children: [
                  'محسن (متولد ۱۰ اسفند ۱۳۵۸)',
                  'جواد (متولد ۵ تیر ۱۳۶۲)',
                  'محمد (متولد ۳ اسفند ۱۳۶۳)',
                  'مهدیه (متولد ۲۵ مرداد ۱۳۶۵)',
                  'فاطمه (متولد ۸ شهریور ۱۳۷۱)',
                ],
              ),

              // حسین کاشی حسینی
              _buildPersonCard(
                name: 'مرحوم حسین کاشی حسینی',
                role: 'فرزند خانواده',
                birthDate: '۱ فروردین ۱۳۳۵',
                deathDate: '۲۰ آبان ۱۴۰۰',
                spouse: 'مرحومه معصومه قدمی',
                isDeceased: true,
                children: [
                  'اعظم (متولد ۱۷ آبان ۱۳۵۷)',
                  'مهدی (متولد ۱ فروردین ۱۳۶۱)',
                  'سمیه (متولد ۳ اردیبهشت ۱۳۶۳)',
                  'محمد (متولد ۱۳۶۷)',
                ],
              ),

              // علی کاشی حسینی
              _buildPersonCard(
                name: 'جناب علی کاشی حسینی',
                role: 'فرزند خانواده',
                birthDate: '۱ فروردین ۱۳۳۹',
                spouse: 'سرکار خانم زهرا بیدگلی',
                children: [
                  'زینب',
                  'صغرا',
                  'حسن',
                ],
              ),

              // صغرا کاشی حسینی
              _buildPersonCard(
                name: 'سرکار خانم صغرا کاشی حسینی',
                role: 'فرزند خانواده',
                birthDate: '۱ فروردین ۱۳۴۸',
                spouse: 'جناب قاسم حسینی',
                children: [
                  'امیر (متولد ۲۷ آذر ۱۳۶۲)',
                ],
              ),

              // معصومه کاشی حسینی
              _buildPersonCard(
                name: 'سرکار خانم معصومه کاشی حسینی',
                role: 'فرزند خانواده',
                birthDate: '۱ بهمن ۱۳۴۹',
                spouse: 'جناب رسول قدرتی',
                children: [
                  'علی (متولد ۶ دی ۱۳۷۳)',
                  'فاطمه (متولد ۵ آبان ۱۳۷۵)',
                  'ساجده (متولد ۲۶ اسفند ۱۳۸۱)',
                ],
              ),

              // فاطمه کاشی حسینی
              _buildPersonCard(
                name: 'سرکار خانم فاطمه کاشی حسینی',
                role: 'فرزند خانواده',
                birthDate: '۷ تیر ۱۳۵۴',
                spouse: 'جناب سعید بیدگلی',
                children: [
                  'حامد',
                  'زهرا',
                  'امیرمحمد',
                ],
              ),
               // خانواده حمید حسینی (کارت شاخص و ویژه)
              _buildPersonCard(
                name: 'جناب حمید حسینی',
                role: 'مدیر ارشد، طراح برنامه و پدر خانواده',
                birthDate: '۱۴ اسفند ۱۳۶۱',
                spouse: 'سرکار خانم منصوره رسولی (متولد ۲۴ دی ۱۳۶۲)',
                children: [
                  'امیررضا حسینی (متولد ۲۱ اسفند ۱۳۸۶)',
                  'ریحانه حسینی (متولد ۱۲ شهریور ۱۳۹۰)',
                  'امیرعباس حسینی (متولد ۲۲ آذر ۱۳۹۳)',
                  'زینب حسینی (متولد ۲۲ دی ۱۳۹۵)',
                ],
              ),

              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  '🌱 این اطلاعات به عنوان گنجینه هویتی خاندان کاشی حسینی ثبت و به یادگار خواهد ماند.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54, fontSize: 12, height: 1.6),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
    } 
    void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF0D2B1E),
        title: const Text(
          'راهنمای نرم‌افزار 💡',
          style: TextStyle(color: Colors.amber, fontSize: 18),
          textAlign: TextAlign.right,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'این برنامه گنجینه‌ای برای ثبت و ماندگاری شجره‌نامه خاندان کاشی حسینی است.',
                style: TextStyle(color: Colors.white, fontSize: 13, height: 1.6),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 12),
              Text('🎂 : تاریخ تولد', style: TextStyle(color: Colors.white70, fontSize: 13)),
              Text('🕊 : یادبود درگذشتگان', style: TextStyle(color: Colors.white70, fontSize: 13)),
              Text('💍 : همسر', style: TextStyle(color: Colors.white70, fontSize: 13)),
              Text('👥 : فرزندان', style: TextStyle(color: Colors.white70, fontSize: 13)),
              SizedBox(height: 14),
              Text(
                'طراح و مدیر پروژه: حمید حسینی',
                style: TextStyle(color: Colors.amber, fontSize: 13, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('بستن', style: TextStyle(color: Colors.amber)),
          ),
        ],
      ),
    );
}
}
// --- تابع نمایش دیالوگ مشخصات فرد ---
void showMemberDetails(BuildContext context, FamilyMember member) {
  showDialog(
    context: context,
    builder: (BuildContext ctx) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFF132B25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Color(0xFFD4AF37), width: 1.5),
          ),
          title: Text(
            member.name,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (member.birthDate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '🎂 تاریخ تولد: ${member.birthDate}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              if (member.deathDate != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '🕊️ یادبود درگذشتگان: ${member.deathDate}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              if (member.spouse != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Text(
                    '💍 همسر: ${member.spouse}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              if (member.description != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '📝 توضیحات: ${member.description}',
                    style: const TextStyle(color: Colors.white60, fontSize: 13),
                  ),
                ),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text(
                  'بستن',
                  style: TextStyle(color: Color(0xFFD4AF37), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
