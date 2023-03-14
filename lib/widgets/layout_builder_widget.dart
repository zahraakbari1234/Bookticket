import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLayoutBuilder extends StatelessWidget {
  final bool? isColor;
  final int sections;
  final double width;
  //this.width = 3 این یعنی اگر هیچی ننوشتیم مقدارش 3 است
  const AppLayoutBuilder({Key? key, this.isColor, required this.sections,  this.width = 3}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context,
          BoxConstraints constraints) {
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: List.generate(
            (constraints.constrainWidth() / sections).floor(),
                (index) => SizedBox(
                  width: width,
                  height: 1,
                  child: DecoratedBox(decoration: BoxDecoration(
                    color: isColor == null
                        ? Colors.white
                        : Colors.grey.shade300,
                  ),),
                ),
          ),
        );
      },
    );
  }
}
