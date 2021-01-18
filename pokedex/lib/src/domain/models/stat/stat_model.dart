import 'dart:convert';

class StatModel {
  final String name;
  final int baseStat;

  StatModel({
    this.name,
    this.baseStat,
  });

  StatModel copyWith({
    String name,
    int baseStat,
  }) {
    return StatModel(
      name: name ?? this.name,
      baseStat: baseStat ?? this.baseStat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'base_stat': baseStat,
    };
  }

  factory StatModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return StatModel(
      name: map['name'],
      baseStat: map['base_stat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatModel.fromJson(String source) =>
      StatModel.fromMap(json.decode(source));

  @override
  String toString() => 'StatModel(name: $name, baseStat: $baseStat)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is StatModel && o.name == name && o.baseStat == baseStat;
  }

  @override
  int get hashCode => name.hashCode ^ baseStat.hashCode;
}
