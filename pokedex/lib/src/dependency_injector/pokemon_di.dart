import 'package:pokedex/export.dart';

class PokemonDI extends DependencyInjector {
  @override
  void registerAll() {
    injector.registerFactory<PokemonRepository, PokemonDataRepository>(
      (i) => PokemonDataRepository(
        pokemonMapper: i.resolve(),
      ),
    );

    injector.registerFactory(
      (i) => PokemonMapper(
        typeMapper: i.resolve(),
        statMapper: i.resolve(),
      ),
    );

    injector.registerFactory(
      (i) => PokemonListBloc(
        pokemonRepository: i.resolve(),
      ),
    );

    injector.registerFactory(
      (i) => PokemonDetailsBloc(
        pokemonRepository: i.resolve(),
      ),
    );
  }
}
