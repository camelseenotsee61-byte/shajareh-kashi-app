class FamilyMember {
  final String name;
  final String? birthDate;
  final String? deathDate;
  final String? spouse;
  final String? description;
  final bool isAlive;
  final String? photoPath;

  FamilyMember({
    required this.name,
    this.birthDate,
    this.deathDate,
    this.spouse,
    this.description,
    this.isAlive = true,
    this.photoPath,
  });
}
