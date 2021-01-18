import 'dart:convert';

class TypeModel {
  final String name;

  TypeModel({
    this.name,
  });

  TypeModel copyWith({
    String name,
  }) {
    return TypeModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TypeModel(
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) =>
      TypeModel.fromMap(json.decode(source));

  @override
  String toString() => 'TypeModel(name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TypeModel && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
