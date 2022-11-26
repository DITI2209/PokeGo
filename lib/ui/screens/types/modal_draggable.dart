import 'package:flutter/material.dart';
import 'package:pokego/configs/colors.dart';
import 'package:pokego/configs/images.dart';
import 'package:pokego/ui/screens/types/modal_contents.dart';

class ModalDraggable extends StatelessWidget {
  const ModalDraggable({
    Key? key,
    required this.width,
    required this.index,
  }) : super(key: key);

  final double width;
  final int index;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.25,
        maxChildSize: 0.92,
        expand: false,
        builder: (b, s) {
          return Container(
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
            child: Stack(
              children: [
                Align(
                  child: Image(
                    image: AppImages.pokeball,
                    width: width / 2,
                    height: width / 2,
                    color: AppColors.black.withOpacity(0.1),
                  ),
                ),
                ModalContents(index: index, width: width, scroller: s), 
              ],
            ),
          );
        });
  }
}
