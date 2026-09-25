import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'family_member.dart';

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
        fontFamily: 'Vazir',
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        primaryColor: const Color(0xFF1B4332),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1B4332),
          primary: const Color(0xFF1B4332),
          secondary: const Color(0xFF2D6A4F),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1B4332),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
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
        appBar: AppBar(
          title: const Text(
            'شجره‌نامه خاندان کاشی حسینی',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // هدر گرافیکی بالای صفحه
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B4332), Color(0xFF2D6A4F), Color(0xFF40916C)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1B4332).withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
                child: const Column(
                  children: [
                    Icon(Icons.account_tree_rounded, size: 60, color: Color(0xFFFFD166)),
                    SizedBox(height: 12),
                    Text(
                      'شجره‌نامه خاندان کاشی حسینی',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 6),
                    Text(
                      'حفظ اصالت، پیوند نسل‌ها و یادبود درگذشتگان',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // دکمه مشاهده شجره نامه
              _buildMenuCard(
                context,
                title: 'مشاهده شجره‌نامه خاندان',
                subtitle: 'مرور ۴ نسل به همراه جستجو و جزئیات',
                icon: Icons.people_alt_rounded,
                iconBgColor: const Color(0xFFD8F3DC),
                iconColor: const Color(0xFF1B4332),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FamilyTreePage()),
                  );
                },
              ),
              const SizedBox(height: 14),

              // دکمه پیشنهاد افزودن یا ویرایش
              _buildMenuCard(
                context,
                title: 'پیشنهاد افزودن یا ویرایش عضو',
                subtitle: 'ارسال اطلاعات و مشخصات جدید به مدیر',
                icon: Icons.edit_note_rounded,
                iconBgColor: const Color(0xFFFFE8D6),
                iconColor: const Color(0xFFD48B37),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MemberSuggestionPage()),
                  );
                },
              ),
              const SizedBox(height: 14),

              // دکمه درباره مدیر
              _buildMenuCard(
                context,
                title: 'درباره مدیر و طراح برنامه',
                subtitle: 'جناب آقای حمید حسینی',
                icon: Icons.person_pin_rounded,
                iconBgColor: const Color(0xFFE0E7FF),
                iconColor: const Color(0xFF3742FA),
                onTap: () => _showAboutDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF2B2D42)),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: const Row(
            children: [
              Icon(Icons.stars_rounded, color: Color(0xFF1B4332), size: 28),
              SizedBox(width: 8),
              Text('طراح و مدیر ارشد', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مدیریت و گردآوری: جناب آقای حمید حسینی', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
              SizedBox(height: 10),
              Text(
                'این برنامه به منظور ثبت ماندگار شجره‌نامه خاندان اصیل کاشی حسینی، حفظ پیوند دل‌های نسل‌های آینده و تجلیل از درگذشتگان طراحی شده است.',
                style: TextStyle(fontSize: 13, height: 1.5, color: Colors.black87),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('بستن', style: TextStyle(color: Color(0xFF1B4332), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

class FamilyTreePage extends StatefulWidget {
  const FamilyTreePage({super.key});

  @override
  State<FamilyTreePage> createState() => _FamilyTreePageState();
}

class _FamilyTreePageState extends State<FamilyTreePage> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<FamilyMember> gen1Paternal = [
    FamilyMember(name: 'مرحوم باقر', isAlive: false, description: 'پدربزرگ پدری'),
    FamilyMember(name: 'مرحومه سیده عالیه بیگم موسوی', isAlive: false, description: 'مادربزرگ پدری'),
  ];

  final List<FamilyMember> gen1Maternal = [
    FamilyMember(name: 'مرحوم محمدحسن حسینی', isAlive: false, description: 'پدربزرگ مادری'),
    FamilyMember(name: 'مرحومه آقا سلطان فتحعلی', isAlive: false, description: 'مادربزرگ مادری'),
  ];

  final List<FamilyMember> gen2Parents = [
    FamilyMember(
      name: 'مرحوم میرزا محمدعلی کاشی حسینی',
      birthDate: '۱۳۰۷/۰۲/۰۶',
      deathDate: '۱۳۸۲/۱۱/۰۶',
      spouse: 'مرحومه جمیله حسینی',
      isAlive: false,
      description: 'پدر بزرگوار خاندان',
    ),
    FamilyMember(
      name: 'مرحومه جمیله حسینی',
      birthDate: '۱۳۱۷/۰۶/۲۰',
      deathDate: '۱۴۰۳/۱۰/۱۱',
      spouse: 'مرحوم میرزا محمدعلی کاشی حسینی',
      isAlive: false,
      description: 'مادر بزرگوار و دلسوز خاندان',
    ),
  ];

  final List<Map<String, dynamic>> branches = [
    {
      'parent': FamilyMember(
        name: 'مرحوم حسن کاشی حسینی',
        birthDate: '۱۳۳۳/۰۶/۰۵',
        deathDate: '۱۳۹۸/۰۸/۲۹',
        spouse: 'عصمت بهجتی',
        isAlive: false,
        description: 'فرزند ارشد',
      ),
      'children': [
        FamilyMember(name: 'محسن کاشی حسینی', birthDate: '۱۳۵۸/۱۲/۱۰', isAlive: true),
        FamilyMember(name: 'جواد کاشی حسینی', birthDate: '۱۳۶۲/۰۴/۰۵', isAlive: true),
        FamilyMember(name: 'محمد کاشی حسینی', birthDate: '۱۳۶۳/۱۲/۰۳', isAlive: true),
        FamilyMember(name: 'مهدیه کاشی حسینی', birthDate: '۱۳۶۵/۰۵/۲۵', isAlive: true),
        FamilyMember(name: 'فاطمه کاشی حسینی', birthDate: '۱۳۷۱/۰۶/۰۸', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'مرحوم حسین کاشی حسینی',
        birthDate: '۱۳۳۵/۰۱/۰۱',
        deathDate: '۱۴۰۰/۰۸/۲۰',
        spouse: 'مرحومه معصومه قدمی',
        isAlive: false,
      ),
      'children': [
        FamilyMember(name: 'اعظم کاشی حسینی', birthDate: '۱۳۵۷/۰۸/۱۷', isAlive: true),
        FamilyMember(name: 'مهدی کاشی حسینی', birthDate: '۱۳۶۱/۰۱/۰۱', isAlive: true),
        FamilyMember(name: 'سمیه کاشی حسینی', birthDate: '۱۳۶۳/۰۲/۰۳', isAlive: true),
        FamilyMember(name: 'محمد کاشی حسینی', birthDate: '۱۳۶۷', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'علی کاشی حسینی',
        birthDate: '۱۳۳۹/۰۱/۰۱',
        spouse: 'زهرا بیدگلی',
        isAlive: true,
      ),
      'children': [
        FamilyMember(name: 'زینب کاشی حسینی', isAlive: true),
        FamilyMember(name: 'صغرا کاشی حسینی', isAlive: true),
        FamilyMember(name: 'حسن کاشی حسینی', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'صغرا کاشی حسینی',
        birthDate: '۱۳۴۸/۰۱/۰۱',
        spouse: 'قاسم حسینی',
        isAlive: true,
      ),
      'children': [
        FamilyMember(name: 'امیر حسینی', birthDate: '۱۳۶۲/۰۹/۲۷', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'معصومه کاشی حسینی',
        birthDate: '۱۳۴۹/۱۱/۰۱',
        spouse: 'رسول قدرتی',
        isAlive: true,
      ),
      'children': [
        FamilyMember(name: 'علی قدرتی', birthDate: '۱۳۷۳/۱۰/۰۶', isAlive: true),
        FamilyMember(name: 'فاطمه قدرتی', birthDate: '۱۳۷۵/۰۸/۰۵', isAlive: true),
        FamilyMember(name: 'ساجده قدرتی', birthDate: '۱۳۸۱/۱۲/۲۶', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'فاطمه کاشی حسینی',
        birthDate: '۱۳۵۴/۰۴/۰۷',
        spouse: 'سعید بیدگلی',
        isAlive: true,
      ),
      'children': [
        FamilyMember(name: 'حامد بیدگلی', isAlive: true),
        FamilyMember(name: 'زهرا بیدگلی', isAlive: true),
        FamilyMember(name: 'امیرمحمد بیدگلی', isAlive: true),
      ]
    },
    {
      'parent': FamilyMember(
        name: 'حمید حسینی',
        birthDate: '۱۳۶۱/۱۲/۱۴',
        spouse: 'منصوره رسولی (متولد ۱۳۶۲/۱۰/۲۴)',
        isAlive: true,
        description: 'مدیر و طراح شجره‌نامه',
      ),
      'children': [
        FamilyMember(name: 'امیررضا حسینی', birthDate: '۱۳۸۶/۱۲/۲۱', isAlive: true),
        FamilyMember(name: 'ریحانه حسینی', birthDate: '۱۳۹۰/۰۶/۱۲', isAlive: true),
        FamilyMember(name: 'امیرعباس حسینی', birthDate: '۱۳۹۳/۰۹/۲۲', isAlive: true),
        FamilyMember(name: 'زینب حسینی', birthDate: '۱۳۹۵/۱۰/۲۲', isAlive: true),
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شجره‌نامه خاندان کاشی حسینی'),
        ),
        body: Column(
          children: [
            // باکس جستجو
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'جستجوی نام، تاریخ تولد یا وفات، همسر...',
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF1B4332)),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: const Color(0xFFF1F5F2),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val.trim();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(12),
                children: [
                  _buildSectionTitle('نسل اول: ریشه‌ها و اجداد'),
                  _buildGenerationCard('اجداد پدری', gen1Paternal),
                  _buildGenerationCard('اجداد مادری', gen1Maternal),
                  const SizedBox(height: 16),
                  _buildSectionTitle('نسل دوم: والدین بزرگوار'),
                  _buildGenerationCard('پدر و مادر خاندان', gen2Parents),
                  const SizedBox(height: 16),
                  _buildSectionTitle('نسل سوم و چهارم: فرزندان و نوه‌ها'),
                  ...branches.map((b) => _buildBranchCard(b['parent'] as FamilyMember, b['children'] as List<FamilyMember>)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      child: Row(
        children: [
          Container(
            width: 5,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xFF1B4332),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B4332),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenerationCard(String title, List<FamilyMember> members) {
    final filtered = members.where((m) => _matchesSearch(m)).toList();
    if (filtered.isEmpty && _searchQuery.isNotEmpty) return const SizedBox.shrink();

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF1B4332)),
            ),
            const Divider(height: 18),
            ...filtered.map((m) => _buildMemberTile(m)),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchCard(FamilyMember parent, List<FamilyMember> children) {
    final bool parentMatches = _matchesSearch(parent);
    final List<FamilyMember> matchingChildren = children.where((c) => _matchesSearch(c)).toList();

    if (_searchQuery.isNotEmpty && !parentMatches && matchingChildren.isEmpty) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: ExpansionTile(
          initiallyExpanded: true,
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          leading: _buildAvatar(parent),
          title: Text(
            parent.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: parent.isAlive ? const Color(0xFF1B4332) : Colors.black87,
            ),
          ),
          subtitle: Text(
            'همسر: ${parent.spouse ?? '---'} | ${children.length} فرزند',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          children: [
            Container(
              color: const Color(0xFFF8F9FA),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (parent.birthDate != null || parent.deathDate != null || parent.description != null) ...[
                    _buildDetailsRow(parent),
                    const Divider(height: 16),
                  ],
                  Row(
                    children: [
                      const Icon(Icons.child_care_rounded, size: 18, color: Color(0xFF1B4332)),
                      const SizedBox(width: 6),
                      Text(
                        'فرزندان (${children.length}):',
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF1B4332)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...(_searchQuery.isNotEmpty && !parentMatches ? matchingChildren : children)
                      .map((c) => _buildChildTile(c)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberTile(FamilyMember m) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(m, radius: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(m.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  [
                    if (m.birthDate != null) 'تولد: ${m.birthDate}',
                    if (m.deathDate != null) 'وفات: ${m.deathDate}',
                    if (m.spouse != null) 'همسر: ${m.spouse}',
                    if (m.description != null) m.description!,
                  ].join('  |  '),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildTile(FamilyMember c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          _buildAvatar(c, radius: 14),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              c.name,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
          if (c.birthDate != null)
            Text(
              'تولد: ${c.birthDate}',
              style: const TextStyle(fontSize: 11, color: Colors.black54),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(FamilyMember member, {double radius = 20}) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: member.isAlive ? const Color(0xFF1B4332) : const Color(0xFF5A6B7C),
      child: Text(
        member.name.isNotEmpty ? member.name.trim().characters.first : '؟',
        style: TextStyle(color: Colors.white, fontSize: radius * 0.9, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildDetailsRow(FamilyMember m) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (m.birthDate != null || m.deathDate != null)
          Text(
            '${m.birthDate != null ? 'تولد: ${m.birthDate}    ' : ''}${m.deathDate != null ? 'وفات: ${m.deathDate}' : ''}',
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        if (m.description != null)
          Text(
            'توضیحات: ${m.description}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
      ],
    );
  }

  bool _matchesSearch(FamilyMember m) {
    if (_searchQuery.isEmpty) return true;
    final q = _searchQuery.toLowerCase();
    return m.name.toLowerCase().contains(q) ||
        (m.birthDate != null && m.birthDate!.contains(q)) ||
        (m.deathDate != null && m.deathDate!.contains(q)) ||
        (m.spouse != null && m.spouse!.toLowerCase().contains(q)) ||
        (m.description != null && m.description!.toLowerCase().contains(q));
  }
}

class MemberSuggestionPage extends StatefulWidget {
  const MemberSuggestionPage({super.key});

  @override
  State<MemberSuggestionPage> createState() => _MemberSuggestionPageState();
}

class _MemberSuggestionPageState extends State<MemberSuggestionPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _relationController = TextEditingController();
  final _birthController = TextEditingController();
  final _deathController = TextEditingController();
  final _spouseController = TextEditingController();
  final _descController = TextEditingController();

  String _requestType = 'افزودن عضو جدید';
  bool _isAlive = true;
  String _generatedSummary = '';

  void _generateText() {
    if (!_formKey.currentState!.validate()) return;

    final buffer = StringBuffer();
    buffer.writeln('📋 نوع درخواست: $_requestType');
    buffer.writeln('👤 نام و نام خانوادگی: ${_nameController.text.trim()}');
    buffer.writeln('🔗 نسبت با سرشاخه: ${_relationController.text.trim().isNotEmpty ? _relationController.text.trim() : "ذکر نشده"}');
    buffer.writeln('🌱 وضعیت حیات: ${_isAlive ? "در قید حیات" : "درگذشته"}');
    if (_birthController.text.trim().isNotEmpty) {
      buffer.writeln('🎂 تاریخ تولد: ${_birthController.text.trim()}');
    }
    if (!_isAlive && _deathController.text.trim().isNotEmpty) {
      buffer.writeln('🕯 تاریخ وفات: ${_deathController.text.trim()}');
    }
    if (_spouseController.text.trim().isNotEmpty) {
      buffer.writeln('💍 همسر: ${_spouseController.text.trim()}');
    }
    if (_descController.text.trim().isNotEmpty) {
      buffer.writeln('📝 توضیحات: ${_descController.text.trim()}');
    }

    setState(() {
      _generatedSummary = buffer.toString();
    });
  }

  void _copyToClipboard() {
    if (_generatedSummary.isEmpty) return;
    Clipboard.setData(ClipboardData(text: _generatedSummary));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('متن کپی شد! می‌توانید آن را برای مدیر ارسال کنید.'),
        backgroundColor: Color(0xFF1B4332),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('پیشنهاد یا اصلاح اطلاعات')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: const Color(0xFFE8F5E9),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Color(0xFF1B4332)),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'اطلاعات وارد شده در این بخش آماده می‌شود تا پس از بررسی مدیر (جناب آقای حمید حسینی) در شجره‌نامه ثبت شود.',
                            style: TextStyle(fontSize: 12.5, color: Color(0xFF1B4332), height: 1.4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _requestType,
                  decoration: InputDecoration(
                    labelText: 'نوع درخواست',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'افزودن عضو جدید', child: Text('افزودن عضو جدید')),
                    DropdownMenuItem(value: 'ویرایش اطلاعات عضو', child: Text('ویرایش اطلاعات عضو موجود')),
                  ],
                  onChanged: (val) => setState(() => _requestType = val ?? 'افزودن عضو جدید'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'نام و نام خانوادگی *',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty) ? 'لطفاً نام را وارد کنید' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _relationController,
                  decoration: InputDecoration(
                    labelText: 'نسبت خانوادگی (مثلاً: فرزند حسن)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SwitchListTile(
                    title: const Text('در قید حیات است؟', style: TextStyle(fontWeight: FontWeight.w500)),
                    value: _isAlive,
                    activeColor: const Color(0xFF1B4332),
                    onChanged: (val) => setState(() => _isAlive = val),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _birthController,
                  decoration: InputDecoration(
                    labelText: 'تاریخ تولد (مثال: ۱۳۶۱/۱۲/۱۴)',
                    filled: true,
                    fillColor: Colors.white,
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                if (!_isAlive) ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _deathController,
                    decoration: InputDecoration(
                      labelText: 'تاریخ وفات (مثال: ۱۴۰۳/۱۰/۱۱)',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                TextFormField(
                  controller: _spouseController,
                  decoration: InputDecoration(
                    labelText: 'نام همسر (اختیاری)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'توضیحات تکمیلی (اختیاری)',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton.icon(
                  onPressed: _generateText,
                  icon: const Icon(Icons.check_circle_rounded),
                  label: const Text('آماده‌سازی متن پیشنهاد', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B4332),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                if (_generatedSummary.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text('متن آماده شده جهت ارسال:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(_generatedSummary, style: const TextStyle(fontSize: 13, height: 1.6)),
                          ),
                          const SizedBox(height: 14),
                          ElevatedButton.icon(
                            onPressed: _copyToClipboard,
                            icon: const Icon(Icons.copy_rounded),
                            label: const Text('کپی متن برای ارسال به مدیر'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2D6A4F),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
