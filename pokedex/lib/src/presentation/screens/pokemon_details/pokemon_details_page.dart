import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
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
    return StreamBuilder<PokemonModel>(
      stream: _bloc.pokemon,
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          final pokemon = snapshot.data;
          final imageProvider = NetworkImage(pokemon.urlPngImage);
          return FutureBuilder<Color>(
            future: getDominantColorFromImage(imageProvider),
            builder: (_, snapshot) {
              final cardColor = snapshot.data ?? backgroundLightColor;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: cardColor,
                  iconTheme: IconThemeData(color: secondaryLightColor),
                ),
                body: SingleChildScrollView(
                  child: Stack(
                    overflow: Overflow.clip,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height - 100.0,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.transparent,
                      ),
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.4,
                        padding: const EdgeInsets.all(32.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              cardColor,
                              cardColor.withOpacity(0.3),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              pokemon.displayName,
                              style: Fonts.display1
                                  .copyWithBold()
                                  .copyWithSecondaryTextColor(),
                            ),
                            const SizedBox(height: 4.0),
                            SeparatedRow(
                              children: <Widget>[
                                ...pokemon.typesInfo
                                    .map(
                                      (typeInfo) => Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4.0,
                                          horizontal: 8.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: backgroundLightColor,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Text(
                                          typeInfo?.type?.displayName ?? '-',
                                          style: Fonts.body1
                                              .copyWithPrimaryColor(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.35,
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 96.0, left: 32.0, right: 32.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: backgroundLightColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.0),
                              topRight: Radius.circular(32.0),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: pokemon.statsInfo
                                .map(
                                  (statInfo) => Column(
                                    children: <Widget>[
                                      Text(
                                        statInfo.stat.displayName,
                                        style: Fonts.title,
                                      ),
                                      const SizedBox(height: 4.0),
                                      LinearPercentIndicator(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        lineHeight: 16.0,
                                        percent: statInfo.baseStat / 100,
                                        backgroundColor: backgroundDarkColor,
                                        progressColor: primaryLightColor,
                                      ),
                                      const SizedBox(height: 8.0),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.18,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: SvgPicture.network(
                            pokemon.urlSvgImage,
                            width: MediaQuery.of(context).size.width * 0.5,
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.5,
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Material(
            child: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
