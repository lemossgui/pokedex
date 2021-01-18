import 'package:pokedex/export.dart';

class PokemonModel {
  final int id;
  final String name;
  final int weight;
  final int height;
  final List<TypeModel> types;
  final List<StatModel> stats;
  final String url;

  PokemonModel({
    this.id,
    this.name,
    this.weight,
    this.height,
    this.types,
    this.stats,
    this.url,
  });

  String get displayName => name.replaceFirst(name[0], name[0].toUpperCase());

  String get idFromUrl {
    if (url == null) return null;
    final urlSplitted = url.split('/');
    return urlSplitted[urlSplitted.length - 2];
  }

  String get urlImage =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$idFromUrl.svg';

  PokemonModel copyWith({
    int id,
    String name,
    int weight,
    int height,
    List<TypeModel> types,
    List<StatModel> stats,
    String url,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      types: types ?? this.types,
      stats: stats ?? this.stats,
      url: url ?? this.url,
    );
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PokemonModel(
      id: map['id'],
      name: map['name'],
      weight: map['weight'],
      height: map['height'],
      // types:
      //     List<TypeModel>.from(map['types']?.map((x) => TypeModel.fromMap(x))),
      // stats:
      //     List<StatModel>.from(map['stats']?.map((x) => StatModel.fromMap(x))),
      url: map['url'],
    );
  }
}
