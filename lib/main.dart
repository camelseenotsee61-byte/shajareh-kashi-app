import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'family_member.dart';

void main() {
  runApp(const ShajarehKashiApp());
}

class ShajarehKashiApp extends StatelessWidget {
  const ShajarehKashiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شجره‌نامه خاندان کاشی حسینی',
      theme: ThemeData(
        fontFamily: 'sans-serif',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D2B1E),
        primaryColor: const Color(0xFF0D2B1E),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
          surface: Color(0xFF133E2B),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

// ---------------------------------------------------------------------------
// صفحه اصلی داشبورد
// ---------------------------------------------------------------------------
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B1E),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.06),
                      border: Border.all(color: Colors.amber.withOpacity(0.3), width: 1.5),
                    ),
                    child: const Icon(
                      Icons.account_tree_rounded,
                      size: 66,
                      color: Colors.amber,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'شجره‌نامه خاندان کاشی حسینی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'یادگار ماندگار پیوند، مهر و اصالت خانوادگی',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.5,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 28),

                // اهداف برنامه
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.auto_stories_rounded, color: Colors.amber, size: 22),
                          SizedBox(width: 8),
                          Text(
                            'اهداف برنامه',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '۱. حفظ و ثبت دقیق پیوندهای تباری و تاریخچه خاندان کاشی حسینی.\n'
                        '۲. آشنایی نسل‌های جدید با ریشه‌ها، اجداد و بزرگان فامیل.\n'
                        '۳. ایجاد بستری پویا جهت تکمیل، ویرایش و ماندگاری اطلاعات خانوادگی.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.8,
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // دکمه مشاهده شجره‌نامه
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FamilyTreePage()),
                    );
                  },
                  icon: const Icon(Icons.people_alt_rounded, color: Color(0xFF0D2B1E), size: 22),
                  label: const Text(
                    'مشاهده شجره‌نامه خاندان',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D2B1E),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                  ),
                ),
                const SizedBox(height: 12),

                // دکمه پیشنهاد افزودن یا ویرایش عضو
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MemberSuggestionPage()),
                    );
                  },
                  icon: const Icon(Icons.edit_note_rounded, color: Colors.amber, size: 22),
                  label: const Text(
                    'پیشنهاد افزودن یا ویرایش عضو',
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    side: const BorderSide(color: Colors.amber, width: 1.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                const SizedBox(height: 22),

                // نشان مدیر ارشد
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.04),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.amber.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.workspace_premium_rounded, color: Colors.amber, size: 17),
                        SizedBox(width: 7),
                        Text(
                          'مدیر ارشد و طراح: حمید حسینی',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.amber,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
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

// ---------------------------------------------------------------------------
// صفحه نمایش شجره‌نامه خاندان با داده‌های اصلی و اصیل
// ---------------------------------------------------------------------------
class FamilyTreePage extends StatefulWidget {
  const FamilyTreePage({super.key});

  // لیست یکپارچه اعضای خاندان بر اساس داده‌های دقیق اولیه
  static final List<FamilyMember> allMembersList = [
    FamilyMember(
      name: 'مرحوم باقر و مرحومه سیده عالیه بیگم موسوی',
      description: 'اجداد پدری خاندان',
    ),
    FamilyMember(
      name: 'مرحوم محمدحسن حسینی و مرحومه آقا سلطان فتحعلی',
      description: 'اجداد مادری خاندان',
    ),
    FamilyMember(
      name: 'مرحوم میرزا محمدعلی کاشی حسینی',
      birthDate: '۶ اردیبهشت ۱۳۰۷',
      deathDate: '۶ بهمن ۱۳۸۲',
      description: 'پدر بزرگوار',
    ),
    FamilyMember(
      name: 'مرحومه جمیله حسینی',
      birthDate: '۲۰ شهریور ۱۳۱۷',
      deathDate: '۱۱ دی ۱۴۰۳',
      description: 'مادر مهربان',
    ),
    FamilyMember(
      name: 'مرحوم حسن کاشی حسینی',
      birthDate: '۵ شهریور ۱۳۳۳',
      deathDate: '۲۹ آبان ۱۳۹۸',
      spouse: 'سرکار خانم عصمت بهجتی',
      description:
          'فرزند ارشد خانواده — فرزندان: محسن (متولد ۱۰ اسفند ۱۳۵۸)، جواد (متولد ۵ تیر ۱۳۶۲)، محمد (متولد ۳ اسفند ۱۳۶۳)، مهدیه (متولد ۲۵ مرداد ۱۳۶۵)، فاطمه (متولد ۸ شهریور ۱۳۷۱)',
    ),
    FamilyMember(
      name: 'مرحوم حسین کاشی حسینی',
      birthDate: '۱ فروردین ۱۳۳۵',
      deathDate: '۲۰ آبان ۱۴۰۰',
      spouse: 'مرحومه معصومه قدمی',
      description:
          'فرزند خانواده — فرزندان: اعظم (متولد ۱۷ آبان ۱۳۵۷)، مهدی (متولد ۱ فروردین ۱۳۶۱)، سمیه (متولد ۳ اردیبهشت ۱۳۶۳)، محمد (متولد ۱۳۶۷)',
    ),
    FamilyMember(
      name: 'جناب علی کاشی حسینی',
      birthDate: '۱ فروردین ۱۳۳۹',
      spouse: 'سرکار خانم زهرا بیدگلی',
      description: 'فرزند خانواده — فرزندان: زینب، صغرا، حسن',
    ),
    FamilyMember(
      name: 'سرکار خانم صغرا کاشی حسینی',
      birthDate: '۱ فروردین ۱۳۴۸',
      spouse: 'جناب قاسم حسینی',
      description: 'فرزند خانواده — فرزندان: امیر (متولد ۲۷ آذر ۱۳۶۲)',
    ),
    FamilyMember(
      name: 'سرکار خانم معصومه کاشی حسینی',
      birthDate: '۱ بهمن ۱۳۴۹',
      spouse: 'جناب رسول قدرتی',
      description:
          'فرزند خانواده — فرزندان: علی (متولد ۶ دی ۱۳۷۳)، فاطمه (متولد ۵ آبان ۱۳۷۵)، ساجده (متولد ۲۶ اسفند ۱۳۸۱)',
    ),
    FamilyMember(
      name: 'سرکار خانم فاطمه کاشی حسینی',
      birthDate: '۷ تیر ۱۳۵۴',
      spouse: 'جناب سعید بیدگلی',
      description: 'فرزند خانواده — فرزندان: حامد، زهرا، امیرمحمد',
    ),
    FamilyMember(
      name: 'جناب حمید حسینی',
      birthDate: '۱۴ اسفند ۱۳۶۱',
      spouse: 'سرکار خانم منصوره رسولی (متولد ۲۴ دی ۱۳۶۲)',
      description:
          'مدیر ارشد، طراح برنامه و پدر خانواده — فرزندان: امیررضا حسینی (متولد ۲۱ اسفند ۱۳۸۶)، ریحانه حسینی (متولد ۱۲ شهریور ۱۳۹۰)، امیرعباس حسینی (متولد ۲۲ آذر ۱۳۹۳)، زینب حسینی (متولد ۲۲ دی ۱۳۹۵)',
    ),
  ];

  @override
  State<FamilyTreePage> createState() => _FamilyTreePageState();
}

class _FamilyTreePageState extends State<FamilyTreePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF0D2B1E),
        appBar: AppBar(
          backgroundColor: const Color(0xFF081C13),
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.amber),
          title: const Text(
            'شجره‌نامه خاندان کاشی حسینی',
            style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val.trim()),
                style: const TextStyle(color: Colors.white, fontSize: 13.5),
                decoration: InputDecoration(
                  hintText: 'جست‌وجوی نام عضو یا فرزندان...',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                  prefixIcon: const Icon(Icons.search_rounded, color: Colors.amber),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear_rounded, color: Colors.white70),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.08),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.amber.withOpacity(0.3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.amber.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.amber, width: 1.4),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _searchQuery.isEmpty ? _buildStructuredView() : _buildSearchResultsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStructuredView() {
    final list = FamilyTreePage.allMembersList;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      children: [
        _buildSectionTitle('ریشه‌ها و نیاکان کهن', 'اجداد والامقام خاندان'),
        _buildMemberCard(list[0]),
        _buildMemberCard(list[1]),

        const SizedBox(height: 14),
        _buildSectionTitle('والدین گرامی', 'ستون‌های پرمهر خانواده'),
        _buildMemberCard(list[2]),
        _buildMemberCard(list[3]),

        const SizedBox(height: 14),
        _buildSectionTitle('فرزندان خانواده و نسل نو', 'برادران، خواهران و خانواده‌ها'),
        _buildMemberCard(list[4]),
        _buildMemberCard(list[5]),
        _buildMemberCard(list[6]),
        _buildMemberCard(list[7]),
        _buildMemberCard(list[8]),
        _buildMemberCard(list[9]),
        _buildMemberCard(list[10], isHighlighted: true),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSearchResultsView() {
    final results = FamilyTreePage.allMembersList.where((m) {
      final nameMatches = m.name.contains(_searchQuery);
      final descMatches = m.description?.contains(_searchQuery) ?? false;
      final spouseMatches = m.spouse?.contains(_searchQuery) ?? false;
      return nameMatches || descMatches || spouseMatches;
    }).toList();

    if (results.isEmpty) {
      return Center(
        child: Text(
          'عضوی با عنوان «$_searchQuery» یافت نشد.',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 14),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      itemCount: results.length,
      itemBuilder: (context, index) {
        final member = results[index];
        final isHamid = member.name.contains('حمید حسینی');
        return _buildMemberCard(member, isHighlighted: isHamid);
      },
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(width: 4, height: 16, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 11.5, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(FamilyMember member, {bool isHighlighted = false}) {
    final isDeceased = member.deathDate != null || member.name.startsWith('مرحوم');

    return Card(
      color: isHighlighted
          ? Colors.amber.withOpacity(0.14)
          : Colors.white.withOpacity(0.06),
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(
          color: isHighlighted
              ? Colors.amber
              : (isDeceased ? Colors.white24 : Colors.amber.withOpacity(0.2)),
          width: isHighlighted ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _showMemberDetailsDialog(member),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: isHighlighted
                    ? Colors.amber
                    : (isDeceased ? Colors.white12 : Colors.white.withOpacity(0.1)),
                radius: 21,
                child: Icon(
                  isDeceased
                      ? Icons.hourglass_bottom_rounded
                      : (isHighlighted ? Icons.star_rounded : Icons.person_rounded),
                  color: isHighlighted
                      ? const Color(0xFF0D2B1E)
                      : (isDeceased ? Colors.white60 : Colors.amber),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member.name,
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: isHighlighted ? Colors.amber : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 3),
                    if (member.spouse != null)
                      Text(
                        'همسر: ${member.spouse}',
                        style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
                      )
                    else if (member.description != null)
                      Text(
                        member.description!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 11.5, color: Colors.white.withOpacity(0.65)),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white30, size: 15),
            ],
          ),
        ),
      ),
    );
  }

  void _showMemberDetailsDialog(FamilyMember member) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: const Color(0xFF133E2B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.amber, width: 1.2),
          ),
          title: Row(
            children: [
              const Icon(Icons.badge_rounded, color: Colors.amber),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  member.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (member.birthDate != null) _buildDialogRow('تاریخ تولد:', member.birthDate!),
              if (member.deathDate != null) _buildDialogRow('تاریخ وفات:', member.deathDate!),
              if (member.spouse != null) _buildDialogRow('همسر:', member.spouse!),
              if (member.description != null) ...[
                const SizedBox(height: 8),
                Text(
                  'توضیحات و فرزندان:',
                  style: TextStyle(fontSize: 12, color: Colors.amber.shade200, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  member.description!,
                  style: TextStyle(fontSize: 12.5, height: 1.7, color: Colors.white.withOpacity(0.9)),
                ),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('بستن', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDialogRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.white60)),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 12.5, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// صفحه پیشنهاد افزودن یا ویرایش عضو
// ---------------------------------------------------------------------------
class MemberSuggestionPage extends StatefulWidget {
  const MemberSuggestionPage({super.key});

  @override
  State<MemberSuggestionPage> createState() => _MemberSuggestionPageState();
}

class _MemberSuggestionPageState extends State<MemberSuggestionPage> {
  final _formKey = GlobalKey<FormState>();

  String _requestType = 'افزودن عضو جدید';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _deathDateController = TextEditingController();
  final TextEditingController _spouseController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String? _preparedText;

  @override
  void dispose() {
    _nameController.dispose();
    _relationController.dispose();
    _birthDateController.dispose();
    _deathDateController.dispose();
    _spouseController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _prepareSuggestion() {
    if (!_formKey.currentState!.validate()) return;

    final buffer = StringBuffer();
    buffer.writeln('📋 پیشنهاد ثبت در شجره‌نامه خاندان کاشی حسینی:');
    buffer.writeln('🔹 نوع درخواست: $_requestType');
    buffer.writeln('👤 نام و نام خانوادگی: ${_nameController.text.trim()}');

    if (_relationController.text.trim().isNotEmpty) {
      buffer.writeln('🔗 نسبت یا جایگاه: ${_relationController.text.trim()}');
    }
    if (_birthDateController.text.trim().isNotEmpty) {
      buffer.writeln('🎂 تاریخ تولد: ${_birthDateController.text.trim()}');
    }
    if (_deathDateController.text.trim().isNotEmpty) {
      buffer.writeln('🕊 تاریخ وفات: ${_deathDateController.text.trim()}');
    }
    if (_spouseController.text.trim().isNotEmpty) {
      buffer.writeln('💍 همسر: ${_spouseController.text.trim()}');
    }
    if (_descController.text.trim().isNotEmpty) {
      buffer.writeln('📝 فرزندان و توضیحات: ${_descController.text.trim()}');
    }

    setState(() {
      _preparedText = buffer.toString();
    });
  }

  void _copyToClipboard() {
    if (_preparedText == null) return;
    Clipboard.setData(ClipboardData(text: _preparedText!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('متن پیشنهاد با موفقیت کپی شد.', textDirection: TextDirection.rtl),
        backgroundColor: Color(0xFF133E2B),
        duration: Duration(seconds: 2),
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
          backgroundColor: const Color(0xFF081C13),
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.amber),
          title: const Text(
            'پیشنهاد افزودن یا ویرایش عضو',
            style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: _requestType,
                  dropdownColor: const Color(0xFF133E2B),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('نوع درخواست', Icons.tune_rounded),
                  items: const [
                    DropdownMenuItem(value: 'افزودن عضو جدید', child: Text('افزودن عضو جدید')),
                    DropdownMenuItem(value: 'ویرایش اطلاعات عضو', child: Text('ویرایش اطلاعات عضو')),
                  ],
                  onChanged: (val) {
                    setState(() {
                      _requestType = val!;
                      _preparedText = null;
                    });
                  },
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('نام و نام خانوادگی (الزامی)', Icons.person_outline_rounded),
                  validator: (val) => (val == null || val.trim().isEmpty) ? 'لطفاً نام را وارد نمایید' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _relationController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('نسبت با خاندان (مثال: فرزند فلانی)', Icons.family_restroom_rounded),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _birthDateController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('تاریخ یا سال تولد', Icons.cake_outlined),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _deathDateController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('تاریخ یا سال وفات (در صورت فوت)', Icons.bedtime_outlined),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _spouseController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('نام همسر', Icons.favorite_border_rounded),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: _buildInputDecoration('نام فرزندان یا توضیحات تکمیلی', Icons.notes_rounded),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _prepareSuggestion,
                  icon: const Icon(Icons.playlist_add_check_rounded, color: Color(0xFF0D2B1E)),
                  label: const Text(
                    'آماده‌کردن متن پیشنهاد',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0D2B1E)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                if (_preparedText != null) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber.withOpacity(0.4)),
                    ),
                    child: SelectableText(
                      _preparedText!,
                      style: const TextStyle(color: Colors.white, height: 1.8, fontSize: 13),
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _copyToClipboard,
                    icon: const Icon(Icons.copy_rounded, color: Colors.amber),
                    label: const Text('کپی متن برای ارسال', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Colors.amber, width: 1.4),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ],
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 13),
      prefixIcon: Icon(icon, color: Colors.amber, size: 20),
      filled: true,
      fillColor: Colors.white.withOpacity(0.06),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.amber, width: 1.4),
      ),
    );
  }
}
