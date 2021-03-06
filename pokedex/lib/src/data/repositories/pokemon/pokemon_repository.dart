import 'package:pokedex/export.dart';

abstract class PokemonRepository {
  Future<List<PokemonModel>> findAll({int offset = 0, int limit = 20});
  Future<PokemonModel> findByUrl(String url);
}
