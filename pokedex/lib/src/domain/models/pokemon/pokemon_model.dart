import 'package:pokedex/export.dart';

class PokemonModel {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<TypeInfoModel> typesInfo;
  final List<StatInfoModel> statsInfo;
  final String url;

  PokemonModel({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.typesInfo,
    this.statsInfo,
    this.url,
  });

  String get displayName => name.replaceFirst(name[0], name[0].toUpperCase());

  String get idFromUrl {
    if (url == null) return null;
    final urlSplitted = url.split('/');
    return urlSplitted[urlSplitted.length - 2];
  }

  String get urlSvgImage =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/${idFromUrl ?? this.id}.svg';

  String get urlPngImage =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${idFromUrl ?? this.id}.png';

  PokemonModel copyWith({
    int id,
    String name,
    int weight,
    int height,
    List<TypeInfoModel> typesInfo,
    List<StatInfoModel> statsInfo,
    String url,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      typesInfo: typesInfo ?? this.typesInfo,
      statsInfo: statsInfo ?? this.statsInfo,
      url: url ?? this.url,
    );
  }
}
