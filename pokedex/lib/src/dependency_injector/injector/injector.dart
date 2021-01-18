import 'package:kiwi/kiwi.dart';

/// Abstração do Injetor de Dependências
class Injector {
  static final Injector _singleton = Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  E resolve<E>([String name]) {
    return KiwiContainer().resolve<E>(name);
  }

  void registerSingleton<I, E extends I>(
    InjectorFactory<I> _factory, {
    String name,
  }) {
    assert(_factory != null, 'Factory must not be null');
    KiwiContainer().registerSingleton((_) => _factory(Injector()), name: name);
  }

  void registerFactory<I, E extends I>(
    InjectorFactory<I> _factory, {
    String name,
  }) {
    assert(_factory != null, 'Factory must not be null');
    KiwiContainer().registerFactory((_) => _factory(Injector()), name: name);
  }
}

typedef E InjectorFactory<E>(Injector i);

abstract class DependencyInjector {
  Injector injector = Injector();
  void registerAll();
}
