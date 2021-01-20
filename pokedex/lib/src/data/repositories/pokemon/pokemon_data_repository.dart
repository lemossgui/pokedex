import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:pokedex/export.dart';
import 'package:http/http.dart' as http;

class PokemonDataRepository implements PokemonRepository {
  final PokemonMapper _pokemonMapper;

  PokemonDataRepository({
    @required PokemonMapper pokemonMapper,
  }) : _pokemonMapper = pokemonMapper;

  final String _endpoint = 'pokemon';

  @override
  Future<List<PokemonModel>> findAll({int offset = 0, int limit = 20}) async {
    final url = '$baseUrlApi/$_endpoint?offset=$offset&limit=$limit';
    return http.get(url).then((response) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return _pokemonMapper
          .mapToListModel(responseJson['results'] as List<dynamic>);
    });
  }

  @override
  Future<PokemonModel> findByUrl(String url) {
    return http.get(url).then((response) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return _pokemonMapper.mapToModel(responseJson);
    });
  }
}
