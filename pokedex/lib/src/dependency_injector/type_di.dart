import 'package:pokedex/export.dart';

class TypeDI extends DependencyInjector {
  @override
  void registerAll() {
    injector.registerFactory(
      (i) => TypeInfoMapper(
        typeMapper: i.resolve(),
      ),
    );

    injector.registerFactory(
      (i) => TypeMapper(),
    );
  }
}
