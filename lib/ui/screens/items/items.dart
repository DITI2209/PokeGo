import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokego/configs/durations.dart';
import 'package:pokego/configs/images.dart';
import 'package:pokego/core/extensions/animation.dart';
import 'package:pokego/states/item/item_bloc.dart';
import 'package:pokego/states/item/item_event.dart';
import 'package:pokego/states/item/item_selector.dart';
import 'package:pokego/states/item/item_state.dart';
import 'package:pokego/ui/modals/generation_modal.dart';
import 'package:pokego/ui/modals/search_modal.dart';
import 'package:pokego/ui/widgets/animated_overlay.dart';
import 'package:pokego/ui/widgets/fab.dart';
import 'package:pokego/ui/widgets/main_app_bar.dart';
import 'package:pokego/ui/widgets/pokeball_background.dart';
import 'package:pokego/ui/widgets/pokemon_refresh_control.dart';

import 'widgets/item_card.dart';
part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen();

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _ItemGrid(),
        ],
      ),
    );
  }
}
