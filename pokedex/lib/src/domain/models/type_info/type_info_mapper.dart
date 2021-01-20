import 'package:meta/meta.dart';
import 'package:pokedex/export.dart';

class TypeInfoMapper extends JsonSerial<TypeInfoModel> {
  final TypeMapper _typeMapper;

  TypeInfoMapper({
    @required TypeMapper typeMapper,
  }) : _typeMapper = typeMapper;

  @override
  Map<String, dynamic> mapFromModel(TypeInfoModel model) {
    if (model == null) return null;

    return {
      'type': _typeMapper.mapFromModel(model.type),
    };
  }

  @override
  TypeInfoModel mapToModel(Map<String, dynamic> map) {
    if (map == null) return null;

    return TypeInfoModel(
      type: _typeMapper.mapToModel(map['type']),
    );
  }
}
