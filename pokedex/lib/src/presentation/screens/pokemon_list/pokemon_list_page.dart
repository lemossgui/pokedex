import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/export.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {
  static Widget create(BuildContext context) {
    return Provider<PokemonListBloc>(
      create: (_) => Injector().resolve<PokemonListBloc>(),
      dispose: (_, value) => value.dispose(),
      child: PokemonListPage(),
    );
  }

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  /// Bloc
  PokemonListBloc get _bloc => Provider.of(context, listen: false);
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc.event(LoadPokemons());
    _scrollController = ScrollController();
    _scrollController.addListener(_listenScrollController);
  }

  /// Escuta o scroll
  void _listenScrollController() {
    // Caso esteja no fim da lista, manda carregar mais pokémons
    if (_scrollController.position.atEdge) {
      _bloc.event(LoadPokemons());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: StreamBuilder<List<PokemonModel>>(
        stream: _bloc.pokemons,
        builder: (_, snapshot) {
          final pokemons = snapshot.data;
          return snapshot.hasData
              ? ListView.separated(
                  controller: _scrollController,
                  itemBuilder: (_, index) => pokemons.length > index
                      ? _buildPokemonCard(pokemons[index])
                      : _buildBottomLoader(),
                  separatorBuilder: (_, index) => const SizedBox(height: 8.0),
                  itemCount: pokemons.length + 1,
                )
              : LinearProgressIndicator();
        },
      ),
    );
  }

  Widget _buildPokemonCard(PokemonModel pokemon) {
    return GestureDetector(
      onTap: () => _navigateToPokemonDetails(pokemon.url),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Text(pokemon.displayName),
              SvgPicture.network(
                pokemon.urlImage,
                width: MediaQuery.of(context).size.width * 0.12,
                placeholderBuilder: (BuildContext context) => Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.width * 0.12,
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomLoader() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _navigateToPokemonDetails(String url) {
    Navigator.of(context).pushNamed<void>(
      PokemonDetailsPage.route,
      arguments: url,
    );
  }
}
