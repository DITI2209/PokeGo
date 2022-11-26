import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokego/ui/screens/types/type_grid.dart';
import 'package:pokego/ui/widgets/main_app_bar.dart';
import 'package:pokego/ui/widgets/pokeball_background.dart';

class TypeEffectScreen extends StatelessWidget {
  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      MainSliverAppBar(
        title: 'Type Effects',
        context: context,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: NestedScrollView(
        headerSliverBuilder: _buildHeader,
        body: TypeEffectGrid(),
      ),
    );
  }
}
