class FamilyMember {
  final String id;
  final String name;
  final String? parentId; // شناسه سرشاخه یا والد
  final String? parentName; // نام والد
  final bool isAlive; // در قید حیات یا درگذشته
  final String? birthDate;
  final String? deathDate;
  final String? spouse;
  final String? description;

  const FamilyMember({
    required this.id,
    required this.name,
    this.parentId,
    this.parentName,
    this.isAlive = true,
    this.birthDate,
    this.deathDate,
    this.spouse,
    this.description,
  });
}
