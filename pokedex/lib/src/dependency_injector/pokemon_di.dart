import 'package:pokedex/export.dart';

class PokemonDI extends DependencyInjector {
  @override
  void registerAll() {
    injector.registerFactory<PokemonRepository, PokemonDataRepository>(
      (c) => PokemonDataRepository(),
    );

    injector.registerFactory(
      (c) => PokemonListBloc(
        pokemonRepository: c.resolve(),
      ),
    );

    injector.registerFactory(
      (c) => PokemonDetailsBloc(
        pokemonRepository: c.resolve(),
      ),
    );
  }
}
