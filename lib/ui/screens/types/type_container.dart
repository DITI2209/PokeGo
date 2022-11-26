import 'package:flutter/material.dart';
import 'package:pokego/configs/colors.dart';
import 'package:pokego/configs/types.dart';
import 'package:pokego/core/utils.dart';
import 'package:pokego/ui/screens/types/type_entities/type_constants.dart';

import 'bold_texts.dart';

class TypeDisplayContainer extends StatelessWidget {
  const TypeDisplayContainer(
      {Key? key,
      required this.index,
      required this.path,
      required this.value,
      required this.width,
      required this.height,
      required this.typeList,
      required this.j})
      : super(key: key);

  final int index;
  final int? j;
  final String path;
  final List<String> typeList;
  final dynamic value;
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var col = Colors.black;
    var text = '';
    void assigner() {
      if (path == "name") {
        col = types[index].color;
        text = getEnumValue(types[index].type).toUpperCase();
      } else if (j != null) {
        col = types[typeIndices[typeList[j!].toLowerCase()]!].color;
        text = getEnumValue(types[typeIndices[typeList[j!].toLowerCase()]!].type).toUpperCase();
      }
    }

    assigner();
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 5, right: 5),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          border: Border.all(color: AppColors.black.withAlpha(100)),
          boxShadow: [
            (width != 75)
                ? BoxShadow(
                    color: AppColors.grey,
                    blurRadius: 25.0, 
                    spreadRadius: 7.0, 
                    offset: Offset(
                      15.0, 
                      5.0, 
                    ),
                  )
                : BoxShadow()
          ],
          color: col,
        ),
        child: BoldText(text: text));
  }
}
