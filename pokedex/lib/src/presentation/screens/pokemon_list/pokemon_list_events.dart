import 'package:pokedex/export.dart';

abstract class PokemonListEvents extends Events {}

class LoadPokemons extends PokemonListEvents {}

class NavigateToPokemonDetails extends PokemonListEvents {
  final String url;

  NavigateToPokemonDetails(this.url);
}
