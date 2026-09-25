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
                            builder: (context) => const FamilyTreePage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.account_tree_rounded),
                      label: const Text(
                        'مشاهده شجره‌نامه خاندان',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MemberSuggestionPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.person_add_alt_1),
                      label: const Text(
                        'پیشنهاد افزودن یا ویرایش عضو',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
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
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.amber),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26),
                        ),
                      ),
                      child: const Text(
                        'مدیر ارشد و طراح: حمید حسینی',
                        style: TextStyle(color: Colors.amber, fontSize: 13),
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

class MemberSuggestionPage extends StatefulWidget {
  const MemberSuggestionPage({super.key});

  @override
  State<MemberSuggestionPage> createState() => _MemberSuggestionPageState();
}

class _MemberSuggestionPageState extends State<MemberSuggestionPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _deathDateController = TextEditingController();
  final _spouseController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _relationshipController = TextEditingController();

  String _requestType = 'افزودن عضو جدید';
  String? _preparedText;

  @override
  void dispose() {
    _nameController.dispose();
    _birthDateController.dispose();
    _deathDateController.dispose();
    _spouseController.dispose();
    _descriptionController.dispose();
    _relationshipController.dispose();
    super.dispose();
  }

  String _valueOrEmpty(TextEditingController controller) {
    final value = controller.text.trim();
    return value.isEmpty ? 'ذکر نشده' : value;
  }

  void _prepareSuggestion() {
    if (!_formKey.currentState!.validate()) return;

    final text = [
      'پیشنهاد $_requestType برای شجره‌نامه خاندان کاشی حسینی',
      '',
      'نام و نام خانوادگی: ${_valueOrEmpty(_nameController)}',
      'نسبت با خاندان: ${_valueOrEmpty(_relationshipController)}',
      'تاریخ تولد: ${_valueOrEmpty(_birthDateController)}',
      'تاریخ وفات: ${_valueOrEmpty(_deathDateController)}',
      'همسر: ${_valueOrEmpty(_spouseController)}',
      'فرزندان یا توضیحات تکمیلی: ${_valueOrEmpty(_descriptionController)}',
      '',
      'این اطلاعات جهت بررسی و تأیید مدیر برنامه ارسال می‌شود.',
    ].join('\n');

    setState(() {
      _preparedText = text;
    });

    FocusScope.of(context).unfocus();
  }

  Future<void> _copySuggestion() async {
    final text = _preparedText;
    if (text == null) return;

    await Clipboard.setData(ClipboardData(text: text));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('متن پیشنهاد کپی شد. اکنون می‌توانید آن را در پیام‌رسان بچسبانید.'),
        duration: Duration(seconds: 4),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? hint,
    int maxLines = 1,
    bool requiredField = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        textDirection: TextDirection.rtl,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white38),
          prefixIcon: Icon(icon, color: Colors.amber),
          filled: true,
          fillColor: Colors.white.withOpacity(0.06),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amber, width: 1.5),
          ),
        ),
        validator: requiredField
            ? (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'لطفاً نام فرد را وارد کنید';
                }
                return null;
              }
            : null,
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
          iconTheme: const IconThemeData(color: Colors.amber),
          title: const Text(
            'پیشنهاد اصلاح اطلاعات',
            style: TextStyle(color: Colors.amber, fontSize: 17),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withOpacity(0.5)),
                ),
                child: const Text(
                  'مشخصات فرد را وارد کنید. پس از آماده‌کردن پیشنهاد، متن آن را کپی کنید و برای مدیر برنامه بفرستید. اطلاعات پس از بررسی و تأیید به شجره‌نامه افزوده می‌شود.',
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.7,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _requestType,
                      dropdownColor: const Color(0xFF132B25),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'نوع درخواست',
                        labelStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(
                          Icons.edit_note_rounded,
                          color: Colors.amber,
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.06),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.white24),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'افزودن عضو جدید',
                          child: Text('افزودن عضو جدید'),
                        ),
                        DropdownMenuItem(
                          value: 'ویرایش اطلاعات عضو',
                          child: Text('ویرایش اطلاعات عضو'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _requestType = value;
                          _preparedText = null;
                        });
                      },
                    ),
                    const SizedBox(height: 14),
                    _buildTextField(
                      controller: _nameController,
                      label: 'نام و نام خانوادگی',
                      icon: Icons.person_outline,
                      hint: 'نام کامل فرد',
                      requiredField: true,
                    ),
                    _buildTextField(
                      controller: _relationshipController,
                      label: 'نسبت با خاندان',
                      icon: Icons.account_tree_outlined,
                      hint: 'برای نمونه: فرزند، همسر، نوه',
                    ),
                    _buildTextField(
                      controller: _birthDateController,
                      label: 'تاریخ تولد',
                      icon: Icons.cake_outlined,
                      hint: 'برای نمونه: ۱۲ فروردین ۱۳۷۰',
                    ),
                    _buildTextField(
                      controller: _deathDateController,
                      label: 'تاریخ وفات، در صورت وجود',
                      icon: Icons.eco_outlined,
                    ),
                    _buildTextField(
                      controller: _spouseController,
                      label: 'نام همسر، در صورت وجود',
                      icon: Icons.favorite_border,
                    ),
                    _buildTextField(
                      controller: _descriptionController,
                      label: 'فرزندان یا توضیحات تکمیلی',
                      icon: Icons.notes_rounded,
                      hint: 'اطلاعات تکمیلی را اینجا بنویسید',
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: _prepareSuggestion,
                  icon: const Icon(Icons.description_outlined),
                  label: const Text(
                    'آماده‌کردن متن پیشنهاد',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              if (_preparedText != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'متن آمادهٔ ارسال',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SelectableText(
                        _preparedText!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _copySuggestion,
                          icon: const Icon(Icons.copy_rounded),
                          label: const Text('کپی متن برای ارسال'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.amber,
                            side: const BorderSide(color: Colors.amber),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class FamilyTreePage extends StatelessWidget {
  const FamilyTreePage({super.key});

  // لیست یکپارچه اعضا جهت جستجوی سریع
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
    final mainColor = isHighlight
        ? Colors.amber
        : (isDeceased ? Colors.white60 : Colors.tealAccent);

    return Builder(
      builder: (context) => InkWell(
        onTap: () {
          showMemberDetails(
            context,
            FamilyMember(
              name: name,
              birthDate: birthDate,
              deathDate: deathDate,
              spouse: spouse,
              description: (children == null || children.isEmpty)
                  ? role
                  : '$role — فرزندان: ${children.join('، ')}',
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: isHighlight
                ? Colors.amber.withOpacity(0.
