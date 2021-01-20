import 'package:pokedex/export.dart';

class StatInfoModel {
  final int baseStat;
  final StatModel stat;

  StatInfoModel({
    this.baseStat,
    this.stat,
  });

  StatInfoModel copyWith({
    int baseStat,
    StatModel stat,
  }) {
    return StatInfoModel(
      baseStat: baseStat ?? this.baseStat,
      stat: stat ?? this.stat,
    );
  }
}
