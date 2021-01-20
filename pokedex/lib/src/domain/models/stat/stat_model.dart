class StatModel {
  final String name;

  StatModel({
    this.name,
  });

  String get displayName => name.replaceFirst(name[0], name[0].toUpperCase());

  StatModel copyWith({
    String name,
  }) {
    return StatModel(
      name: name ?? this.name,
    );
  }
}
