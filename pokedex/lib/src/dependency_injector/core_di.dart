import 'package:pokedex/export.dart';
import 'package:pokedex/src/dependency_injector/pokemon_di.dart';

class CoreDI extends DependencyInjector {
  @override
  void registerAll() {
    PokemonDI().registerAll();
  }
}
