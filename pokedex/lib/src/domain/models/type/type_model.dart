class TypeModel {
  final String name;

  TypeModel({
    this.name,
  });

  String get displayName => name.replaceFirst(name[0], name[0].toUpperCase());

  TypeModel copyWith({
    String name,
  }) {
    return TypeModel(
      name: name ?? this.name,
    );
  }
}
