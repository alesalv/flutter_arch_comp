import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/pokemon_controller.dart';
import '../../models/data/pokemon.dart';

class ActionsFabsRow extends StatelessWidget {
  const ActionsFabsRow({required this.read, Key? key}) : super(key: key);
  final Reader read;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: "buttonCreate",
            child: const Icon(Icons.add),
            onPressed: () =>
                read(pokemonControllerProvider).create(const Pokemon())),
        const SizedBox(width: 16),
        FloatingActionButton(
            heroTag: "buttonDelete",
            child: const Icon(Icons.remove),
            onPressed: () =>
                read(pokemonControllerProvider).delete(const Pokemon().id)),
        const SizedBox(width: 16),
        FloatingActionButton(
            heroTag: "buttonRefresh",
            child: const Icon(Icons.refresh),
            onPressed: () => read(pokemonControllerProvider).refresh()),
      ],
    );
  }
}
