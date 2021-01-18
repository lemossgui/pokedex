import 'package:pokedex/export.dart';

abstract class PokemonDetailsEvents extends Events {}

class LoadPokemon extends PokemonDetailsEvents {
  final String url;

  LoadPokemon(this.url);
}
