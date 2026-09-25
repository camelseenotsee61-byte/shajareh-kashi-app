class FamilyMember {
  final String? id;
  final String name;
  final String? parentId;
  final String? parentName;
  final bool isAlive;
  final String? birthDate;
  final String? deathDate;
  final String? spouse;
  final String? description;

  const FamilyMember({
    this.id,
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
