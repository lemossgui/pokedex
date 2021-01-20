import 'package:pokedex/export.dart';

class StatDI extends DependencyInjector {
  @override
  void registerAll() {
    injector.registerFactory(
      (i) => StatInfoMapper(
        statMapper: i.resolve(),
      ),
    );

    injector.registerFactory(
      (i) => StatMapper(),
    );
  }
}
