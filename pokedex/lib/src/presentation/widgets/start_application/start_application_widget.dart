import 'package:flutter/material.dart';
import 'package:pokedex/export.dart';

class StartApplicationWidget extends StatefulWidget {
  final BuilderChild child;
  final StrategyInit strategyInit;

  const StartApplicationWidget({
    this.child,
    this.strategyInit,
  })  : assert(child != null),
        assert(strategyInit != null);

  @override
  _StartApplicationWidgetState createState() => _StartApplicationWidgetState();
}

class _StartApplicationWidgetState extends State<StartApplicationWidget>
    with WidgetsBindingObserver {
  Widget get child => widget.child(context);
  StrategyInit get strategyInit => widget.strategyInit;

  @override
  void initState() {
    _initFunctions();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {}

  void _initFunctions() {
    strategyInit.functionsToExecute.forEach(
      (f) => f(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

typedef BuilderChild = Widget Function(BuildContext context);
