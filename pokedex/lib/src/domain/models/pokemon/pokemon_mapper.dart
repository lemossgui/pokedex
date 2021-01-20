import 'package:meta/meta.dart';
import 'package:pokedex/export.dart';

class PokemonMapper extends JsonSerial<PokemonModel> {
  final TypeInfoMapper _typeInfoMapper;
  final StatInfoMapper _statInfoMapper;

  PokemonMapper({
    @required TypeInfoMapper typeInfoMapper,
    @required StatInfoMapper statInfoMapper,
  })  : _typeInfoMapper = typeInfoMapper,
        _statInfoMapper = statInfoMapper;

  @override
  Map<String, dynamic> mapFromModel(PokemonModel model) {
    if (model == null) return null;

    return <String, dynamic>{
      'id': model.id,
      'name': model.name,
      'weight': model.weight,
      'height': model.height,
      'types': _typeInfoMapper.mapFromListModel(model.typesInfo),
      'stats': _statInfoMapper.mapFromListModel(model.statsInfo),
      'url': model.url,
    };
  }

  @override
  PokemonModel mapToModel(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonModel(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      height: map['height'],
      typesInfo: _typeInfoMapper.mapToListModel(map['types']),
      statsInfo: _statInfoMapper.mapToListModel(map['stats']),
      url: map['url'],
    );
  }
}
