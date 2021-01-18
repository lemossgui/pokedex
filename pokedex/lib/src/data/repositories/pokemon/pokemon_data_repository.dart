import 'dart:convert';
import 'package:pokedex/export.dart';
import 'package:http/http.dart' as http;

class PokemonDataRepository implements PokemonRepository {
  final String _endpoint = 'pokemon';

  @override
  Future<List<PokemonModel>> findAll({int offset = 0, int limit = 10}) async {
    final url = '$baseUrlApi/$_endpoint?offset=$offset&limit=$limit';
    return http.get(url).then((response) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return (responseJson['results'] as List)
          .map((e) => PokemonModel.fromMap(e))
          .toList();
    });
  }

  @override
  Future<PokemonModel> findByUrl(String url) {
    return http.get(url).then((response) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return PokemonModel.fromMap(responseJson);
    });
  }
}
