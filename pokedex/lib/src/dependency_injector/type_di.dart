import 'package:pokedex/export.dart';

class TypeDI extends DependencyInjector {
  @override
  void registerAll() {
    injector.registerFactory(
      (i) => TypeMapper(),
    );
  }
}
