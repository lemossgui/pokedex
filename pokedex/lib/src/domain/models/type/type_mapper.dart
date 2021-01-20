import 'package:pokedex/export.dart';

class TypeMapper extends JsonSerial<TypeModel> {
  @override
  Map<String, dynamic> mapFromModel(TypeModel model) {
    if (model == null) return null;

    return <String, dynamic>{
      'name': model.name,
    };
  }

  @override
  TypeModel mapToModel(Map<String, dynamic> map) {
    if (map == null) return null;

    return TypeModel(
      name: map['name'],
    );
  }
}
