import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/export.dart';
import 'package:provider/provider.dart';

class PokemonDetailsPage extends StatefulWidget {
  final String url;

  const PokemonDetailsPage(this.url);

  static const route = 'pokemon_details';

  static Widget create(BuildContext context) {
    final url = ModalRoute.of(context).settings.arguments;
    return Provider<PokemonDetailsBloc>(
      create: (_) => Injector().resolve<PokemonDetailsBloc>(),
      dispose: (_, value) => value.dispose(),
      child: PokemonDetailsPage(url),
    );
  }

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  /// Bloc
  PokemonDetailsBloc get _bloc => Provider.of(context, listen: false);

  /// Url
  String get _url => widget.url;

  @override
  void initState() {
    super.initState();
    _bloc.event(LoadPokemon(_url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<PokemonModel>(
          stream: _bloc.pokemon,
          builder: (_, snapshot) {
            final pokemon = snapshot.data;
            return snapshot.hasData
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.network(
                          pokemon.urlSvgImage,
                          width: MediaQuery.of(context).size.width * 0.5,
                          placeholderBuilder: (BuildContext context) =>
                              Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.width * 0.5,
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          pokemon.displayName,
                          style: TextStyle(fontSize: 32.0),
                        ),
                      ],
                    ),
                  )
                : LinearProgressIndicator();
          }),
    );
  }
}
