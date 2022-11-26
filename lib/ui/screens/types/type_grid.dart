import 'package:flutter/material.dart';
import 'package:pokego/configs/types.dart';

import 'modal_sheet.dart';

class TypeEffectGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Builder(builder: (context) {
      return CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) => ModalSheet(
                  width: w,
                  index: index,
                ),
                childCount: types.length,
              ),
            ),
          ),
        ],
      );
    });
  }
}
