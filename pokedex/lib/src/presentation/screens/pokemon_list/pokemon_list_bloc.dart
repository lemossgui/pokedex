import 'package:flutter/material.dart';
import 'package:pokedex/export.dart';
import 'package:rxdart/rxdart.dart';

class PokemonListBloc extends BaseBloc<PokemonListEvents> {
  final PokemonRepository _pokemonRepository;

  PokemonListBloc({
    PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final _pokemonsController = BehaviorSubject<List<PokemonModel>>();
  Function(List<PokemonModel>) get _onPokemonsChange =>
      _pokemonsController.sink.add;
  Stream<List<PokemonModel>> get pokemons => _pokemonsController.stream;
  List<PokemonModel> get _pokemons => _pokemonsController.value ?? [];

  @override
  void handleEvent(PokemonListEvents event) {
    if (event is LoadPokemons) {
      _listPokemons();
    }
  }

  /// Quantidade de pokémon pulado por get
  int _pokemonListOffset = 0;

  /// Quantidade de pokémon por get
  int _pokemonListLimit = 20;

  void _listPokemons() {
    doOnlineAction(action: () async {
      _pokemonRepository
          .findAll(
        offset: _pokemonListOffset,
        limit: _pokemonListLimit,
      )
          .then((remoteList) {
        // Adiciona 20 para "passar de página"
        _pokemonListOffset += 20;
        // Soma as duas listas e remove duplicatas
        final newList = (_pokemons + remoteList).toSet().toList();
        _onPokemonsChange(newList);
      });
    });
  }

  @override
  void dispose() {
    _pokemonsController.drain<dynamic>();
    _pokemonsController.close();
    super.dispose();
  }
}
