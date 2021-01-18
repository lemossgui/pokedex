abstract class StrategyInit {
  Iterable<InitAction> get functionsToExecute;
}

typedef void InitAction();
