// این مدل، الگوی هر فرد در شجره‌نامه است
class FamilyMember {
  final String name;
  final String? birthDate; // علامت سوال یعنی این فیلد می‌تونه خالی هم باشه
  final String? deathDate;
  final String? spouse;
  final String? description;

  FamilyMember({
    required this.name,
    this.birthDate,
    this.deathDate,
    this.spouse,
    this.description,
  });
}

