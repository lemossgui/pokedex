import 'package:meta/meta.dart';
import 'package:pokedex/export.dart';

class StatInfoMapper extends JsonSerial<StatInfoModel> {
  final StatMapper _statMapper;

  StatInfoMapper({
    @required StatMapper statMapper,
  }) : _statMapper = statMapper;

  @override
  Map<String, dynamic> mapFromModel(StatInfoModel model) {
    if (model == null) return null;

    return {
      'base_stat': model.baseStat,
      'stat': _statMapper.mapFromModel(model.stat),
    };
  }

  @override
  StatInfoModel mapToModel(Map<String, dynamic> map) {
    if (map == null) return null;

    return StatInfoModel(
      baseStat: map['base_stat'],
      stat: _statMapper.mapToModel(map['stat']),
    );
  }
}
