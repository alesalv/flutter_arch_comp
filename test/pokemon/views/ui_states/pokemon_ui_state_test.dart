import 'package:flutter_arch_comp/src/pokemon/models/data/fake_pokemon.dart';
import 'package:flutter_arch_comp/src/pokemon/models/data/pokemon.dart';
import 'package:flutter_arch_comp/src/pokemon/views/ui_states/pokemon_ui_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PokemonUiState immutability', () {
    test('should not allow to remove pokemon directly', () {
      final mutableList = _getFakePokemonList();

      final pokemonUiState = PokemonUiState(pokemon: mutableList);

      expect(mutableList.length, 2);
      expect(pokemonUiState.pokemon.length, 2);

      expect(() => pokemonUiState.pokemon.removeAt(0), throwsUnsupportedError);
    });

    test('should not change when mutable pokemon list is changed', () {
      final mutableList = _getFakePokemonList();

      final pokemonUiState = PokemonUiState(pokemon: mutableList);

      expect(mutableList.length, 2);
      expect(pokemonUiState.pokemon.length, 2);

      mutableList.removeAt(0);

      expect(mutableList.length, 1);
      expect(pokemonUiState.pokemon.length, 2);
    });

    test('should not allow to add pokemon directly', () {
      final pokemonUiState = PokemonUiState(pokemon: []);

      expect(pokemonUiState.pokemon.length, 0);
      expect(() => pokemonUiState.pokemon.add(const PokemonItemUiState()),
          throwsUnsupportedError);
    });
  });
}

_getFakePokemonList() {
  return [
    PokemonItemUiState.fromPokemon(
        Pokemon.fromPokemonApiModel(kFakePokemon[0])),
    PokemonItemUiState.fromPokemon(
        Pokemon.fromPokemonApiModel(kFakePokemon[1])),
  ];
}
