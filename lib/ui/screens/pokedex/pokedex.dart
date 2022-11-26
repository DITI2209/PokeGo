import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokego/configs/durations.dart';
import 'package:pokego/configs/images.dart';
import 'package:pokego/core/extensions/animation.dart';
import 'package:pokego/domain/entities/pokemon.dart';
import 'package:pokego/routes.dart';
import 'package:pokego/states/pokemon/pokemon_bloc.dart';
import 'package:pokego/states/pokemon/pokemon_event.dart';
import 'package:pokego/states/pokemon/pokemon_selector.dart';
import 'package:pokego/states/pokemon/pokemon_state.dart';
import 'package:pokego/ui/modals/generation_modal.dart';
import 'package:pokego/ui/modals/search_modal.dart';
import 'package:pokego/ui/widgets/pokemon_card.dart';
import 'package:pokego/ui/widgets/animated_overlay.dart';
import 'package:pokego/ui/widgets/fab.dart';
import 'package:pokego/ui/widgets/main_app_bar.dart';
import 'package:pokego/ui/widgets/pokeball_background.dart';
import 'package:pokego/ui/widgets/pokemon_refresh_control.dart';

part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokegoScreen extends StatefulWidget {
  const PokegoScreen();

  @override
  State<StatefulWidget> createState() => _PokegoScreenState();
}

class _PokegoScreenState extends State<PokegoScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _PokemonGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
