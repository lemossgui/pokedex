import 'package:pokedex/export.dart';

class TypeInfoModel {
  final TypeModel type;

  TypeInfoModel({
    this.type,
  });

  TypeInfoModel copyWith({
    TypeModel type,
  }) {
    return TypeInfoModel(
      type: type ?? this.type,
    );
  }
}
