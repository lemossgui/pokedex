import 'package:pokedex/export.dart';
import 'package:rxdart/rxdart.dart';

class PokemonDetailsBloc extends BaseBloc<PokemonDetailsEvents> {
  final PokemonRepository _pokemonRepository;

  PokemonDetailsBloc({
    PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  final _pokemonController = BehaviorSubject<PokemonModel>();
  Function(PokemonModel) get _onPokemonChange => _pokemonController.sink.add;
  Stream<PokemonModel> get pokemon => _pokemonController.stream;

  @override
  void handleEvent(PokemonDetailsEvents event) {
    if (event is LoadPokemon) {
      _loadPokemon(event.url);
    }
  }

  void _loadPokemon(String url) {
    doOnlineAction(action: () async {
      _pokemonRepository.findByUrl(url).then(_onPokemonChange);
    });
  }

  @override
  void dispose() {
    _pokemonController.drain<dynamic>();
    _pokemonController.close();
    super.dispose();
  }
}
