import 'package:meta/meta.dart';
import 'package:pokedex/export.dart';

class PokemonMapper extends JsonSerial<PokemonModel> {
  final TypeMapper _typeMapper;
  final StatMapper _statMapper;

  PokemonMapper({
    @required TypeMapper typeMapper,
    @required StatMapper statMapper,
  })  : _typeMapper = typeMapper,
        _statMapper = statMapper;

  @override
  Map<String, dynamic> mapFromModel(PokemonModel model) {
    if (model == null) return null;

    return <String, dynamic>{
      'id': model.id,
      'name': model.name,
      'weight': model.weight,
      'height': model.height,
      'types': _typeMapper.mapFromListModel(model.types),
      'stats': _statMapper.mapFromListModel(model.stats),
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
      types: _typeMapper.mapToListModel(map['types']),
      stats: _statMapper.mapToListModel(map['stats']),
      url: map['url'],
    );
  }
}
