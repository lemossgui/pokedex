import 'package:flutter/material.dart';
import 'package:pokedex/export.dart';
import 'package:pokedex/src/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StartApplicationWidget(
        child: _buildMainContent,
        strategyInit: strategyInit,
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return PokemonListPage.create(context);
  }

  StrategyInitImpl get strategyInit => StrategyInitImpl(CoreDI().registerAll);
}
