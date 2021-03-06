import 'package:pokedex/export.dart';

class StatMapper extends JsonSerial<StatModel> {
  @override
  Map<String, dynamic> mapFromModel(StatModel model) {
    if (model == null) return null;

    return {
      'name': model.name,
    };
  }

  @override
  StatModel mapToModel(Map<String, dynamic> map) {
    if (map == null) return null;

    return StatModel(
      name: map['name'],
    );
  }
}
