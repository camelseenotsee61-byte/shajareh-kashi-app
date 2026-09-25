import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'family_member.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShajarehApp());
}

class ShajarehApp extends StatelessWidget {
  const ShajarehApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'شجره‌نامه خاندان کاشی حسینی',
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa', 'IR'),
      theme: ThemeData(
        fontFamily: 'Vazirmatn',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A),
          primary: const Color(0xFF1E3A8A),
          secondary: const Color(0xFF0D9488),
          surface: const Color(0xFFF8FAFC),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شجره‌نامه خاندان کاشی حسینی'),
          centerTitle: true,
          elevation: 2,
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              tooltip: 'راهنمای برنامه',
              onPressed: () => _showHelpDialog(context),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_tree_rounded,
                    size: 96,
                    color: Color(0xFF1E3A8A),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'شجره‌نامه خاندان کاشی حسینی',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'سامانه ثبت، بازبینی و اتصال انساب خاندان',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFF475569)),
                  ),
                  const SizedBox(height: 36),
                  _buildMenuCard(
                    context,
                    title: 'مشاهده شجره‌نامه و اعضا',
                    subtitle: 'مرور شاخه‌های خانوادگی به همراه جستجوی سریع',
                    icon: Icons.people_alt_rounded,
                    color: const Color(0xFF1E3A8A),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FamilyTreePage(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildMenuCard(
                    context,
                    title: 'پیشنهاد ثبت / ویرایش عضو',
                    subtitle: 'فرم ثبت مشخصات فردی، سرشاخه و وضعیت حیات',
                    icon: Icons.person_add_alt_1_rounded,
                    color: const Color(0xFF0D9488),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MemberSuggestionPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withOpacity(0.12),
                child: Icon(icon, color: color, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 18, color: Color(0xFF94A3B8)),
            ],
          ),
        ),
      ),
    );
  }

  static void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Row(
            children: [
              Icon(Icons.help_rounded, color: Color(0xFF1E3A8A)),
              SizedBox(width: 8),
              Text('راهنمای شجره‌نامه'),
            ],
          ),
          content: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '• مشاهده اعضا و جست‌وجو:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('از منوی نخست می‌توانید فهرست تمام نیاکان و فرزندان را ببینید و با نوار جستجو نام فرد مورد نظر را بیابید.'),
                SizedBox(height: 10),
                Text(
                  '• پیشنهاد و تکمیل مشخصات:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('از بخش دوم می‌توانید فرد جدید را به همراه والد/سرشاخه، همسر و وضعیت حیات ثبت نموده و متن آماده را ارسال کنید.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('متوجه شدم'),
            ),
          ],
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
  final _birthController = TextEditingController();
  final _deathController = TextEditingController();
  final _spouseController = TextEditingController();
  final _descController = TextEditingController();

  bool _isAlive = true;
  String? _selectedParent;

  final List<String> _availableParents = [
    'نامشخص / ریشه اصلی',
    'مرحوم حاج غلامحسین حسینی (کاشی)',
    'مرحومه حاجیه خانم معصومه کاشی',
    'مرحوم حاج اکبر حسینی کاشی',
    'مرحومه حاجیه صغری حسینی کاشی',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _birthController.dispose();
    _deathController.dispose();
    _spouseController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final summary = StringBuffer();
      summary.writeln('📋 پیشنهاد ثبت اطلاعات جدید در شجره‌نامه:');
      summary.writeln('👤 نام و نام خانوادگی: ${_nameController.text.trim()}');
      summary.writeln('🌿 والد / سرشاخه: ${_selectedParent ?? "تعیین نشده"}');
      summary.writeln('🌱 وضعیت حیات: ${_isAlive ? "در قید حیات" : "درگذشته"}');
      if (_birthController.text.isNotEmpty) {
        summary.writeln('📅 تاریخ تولد: ${_birthController.text.trim()}');
      }
      if (!_isAlive && _deathController.text.isNotEmpty) {
        summary.writeln('🕊 تاریخ وفات: ${_deathController.text.trim()}');
      }
      if (_spouseController.text.isNotEmpty) {
        summary.writeln('💍 نام همسر: ${_spouseController.text.trim()}');
      }
      if (_descController.text.isNotEmpty) {
        summary.writeln('📝 توضیحات: ${_descController.text.trim()}');
      }

      showDialog(
        context: context,
        builder: (ctx) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text('متن آماده پیشنهاد'),
            content: SingleChildScrollView(
              child: Text(summary.toString()),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: summary.toString()));
                  Navigator.pop(ctx);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('متن با موفقیت در کلیپ‌بورد کپی شد.')),
                  );
                },
                child: const Text('کپی کردن متن'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text('بستن'),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('پیشنهاد ثبت یا اصلاح عضو'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'نام و نام خانوادگی *',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (val) =>
                      (val == null || val.trim().isEmpty) ? 'لطفاً نام را وارد کنید' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedParent,
                  decoration: const InputDecoration(
                    labelText: 'والد / سرشاخه مرتبط',
                    prefixIcon: Icon(Icons.account_tree),
                    border: OutlineInputBorder(),
                  ),
                  items: _availableParents.map((parent) {
                    return DropdownMenuItem(
                      value: parent,
                      child: Text(parent, style: const TextStyle(fontSize: 13)),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _selectedParent = val),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('وضعیت حیات:'),
                      Row(
                        children: [
                          ChoiceChip(
                            label: const Text('در قید حیات'),
                            selected: _isAlive,
                            onSelected: (val) => setState(() => _isAlive = true),
                          ),
                          const SizedBox(width: 8),
                          ChoiceChip(
                            label: const Text('درگذشته'),
                            selected: !_isAlive,
                            onSelected: (val) => setState(() => _isAlive = false),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _birthController,
                  decoration: const InputDecoration(
                    labelText: 'تاریخ تولد (مثال: ۱۳۴۵/۰۱/۱۵)',
                    prefixIcon: Icon(Icons.cake),
                    border: OutlineInputBorder(),
                  ),
                ),
                if (!_isAlive) ...[
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _deathController,
                    decoration: const InputDecoration(
                      labelText: 'تاریخ وفات (مثال: ۱۴۰۰/۰۵/۲۰)',
                      prefixIcon: Icon(Icons.bed),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                TextFormField(
                  controller: _spouseController,
                  decoration: const InputDecoration(
                    labelText: 'نام همسر',
                    prefixIcon: Icon(Icons.favorite_border),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'توضیحات و فرزندان',
                    prefixIcon: Icon(Icons.notes),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.send_rounded),
                  label: const Text('تولید و کپی متن مشخصات'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D9488),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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

class FamilyTreePage extends StatefulWidget {
  const FamilyTreePage({super.key});

  @override
  State<FamilyTreePage> createState() => _FamilyTreePageState();
}

class _FamilyTreePageState extends State<FamilyTreePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  late final List<FamilyMember> _allMembers;

  @override
  void initState() {
    super.initState();
    _allMembers = [
      FamilyMember(
        name: 'مرحوم حاج غلامحسین حسینی (کاشی)',
        birthDate: '۱۲۸۰',
        deathDate: '۱۳۵۵',
        spouse: 'مرحومه حاجیه خانم معصومه کاشی',
        description: 'بزرگ خاندان کاشی و پدر پدری',
      ),
      FamilyMember(
        name: 'مرحومه حاجیه خانم معصومه کاشی',
        birthDate: '۱۲۸۸',
        deathDate: '۱۳۶۳',
        spouse: 'مرحوم حاج غلامحسین حسینی (کاشی)',
        description: 'مادر بزرگ پدری خاندان',
      ),
      FamilyMember(
        name: 'مرحوم حاج اکبر حسینی کاشی',
        birthDate: '۱۳۰۸',
        deathDate: '۱۳۸۱',
        spouse: 'مرحومه حاجیه صغری حسینی کاشی',
        description: 'پدر خانواده و فرزند حاج غلامحسین',
      ),
      FamilyMember(
        name: 'مرحومه حاجیه صغری حسینی کاشی',
        birthDate: '۱۳۱۲',
        deathDate: '۱۳۹۲',
        spouse: 'مرحوم حاج اکبر حسینی کاشی',
        description: 'مادر مهربان و فداکار خانواده',
      ),
      FamilyMember(
        name: 'حسن حسینی',
        birthDate: '۱۳۳۵',
        spouse: 'فاطمه رسولی',
        description: 'فرزند ارشد خانواده - شاخه حسن',
      ),
      FamilyMember(
        name: 'حسین حسینی',
        birthDate: '۱۳۳۸',
        spouse: 'زهرا موسوی',
        description: 'فرزند خانواده - شاخه حسین',
      ),
      FamilyMember(
        name: 'علی حسینی',
        birthDate: '۱۳۴۲',
        spouse: 'مریم احمدی',
        description: 'فرزند خانواده - شاخه علی',
      ),
      FamilyMember(
        name: 'صغرا حسینی',
        birthDate: '۱۳۴۵',
        spouse: 'رضا کریمی',
        description: 'فرزند خانواده',
      ),
      FamilyMember(
        name: 'معصومه حسینی',
        birthDate: '۱۳۴۹',
        spouse: 'محمد رضایی',
        description: 'فرزند خانواده',
      ),
      FamilyMember(
        name: 'فاطمه حسینی',
        birthDate: '۱۳۵۴',
        spouse: 'علی تهرانی',
        description: 'فرزند خانواده',
      ),
      FamilyMember(
        name: 'حمید حسینی',
        birthDate: '۱۳۵۹/۰۴/۱۵',
        spouse: 'منصوره رسولی',
        description: 'فرزند خانواده - پدر امیررضا، ریحانه، امیرعباس و زینب',
      ),
    ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMembers = _allMembers.where((m) {
      final query = _searchQuery.trim().toLowerCase();
      if (query.isEmpty) return true;
      final nameMatches = m.name.toLowerCase().contains(query);
      final descMatches = (m.description ?? '').toLowerCase().contains(query);
      final spouseMatches = (m.spouse ?? '').toLowerCase().contains(query);
      return nameMatches || descMatches || spouseMatches;
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('شجره‌نامه و اعضای خاندان'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _searchQuery = val),
                decoration: InputDecoration(
                  hintText: 'جستجوی نام، همسر یا نسبت...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
            Expanded(
              child: filteredMembers.isEmpty
                  ? const Center(
                      child: Text(
                        'عضوی با این مشخصات یافت نشد.',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      itemCount: filteredMembers.length,
                      itemBuilder: (context, index) {
                        final member = filteredMembers[index];
                        final isDeceased = member.deathDate != null && member.deathDate!.isNotEmpty;
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: isDeceased
                                  ? Colors.grey.shade300
                                  : const Color(0xFF1E3A8A).withOpacity(0.15),
                              child: Icon(
                                isDeceased ? Icons.bed : Icons.person,
                                color: isDeceased ? Colors.grey.shade700 : const Color(0xFF1E3A8A),
                              ),
                            ),
                            title: Text(
                              member.name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${member.spouse != null ? "همسر: ${member.spouse} | " : ""}${member.description ?? ""}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: const Icon(Icons.chevron_left),
                            onTap: () => _showMemberDetails(context, member),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMemberDetails(BuildContext context, FamilyMember member) {
    showDialog(
      context: context,
      builder: (ctx) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(member.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (member.birthDate != null)
                Text('📅 تاریخ تولد: ${member.birthDate}'),
              if (member.deathDate != null && member.deathDate!.isNotEmpty)
                Text('🕊 تاریخ وفات: ${member.deathDate}'),
              if (member.spouse != null && member.spouse!.isNotEmpty)
                Text('💍 نام همسر: ${member.spouse}'),
              if (member.description != null && member.description!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text('📝 توضیحات: ${member.description}'),
              ],
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('بستن'),
            ),
          ],
        ),
      ),
    );
  }
}
