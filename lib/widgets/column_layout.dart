import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstext;
  final String secondtext;
  final bool? isColor;
  const AppColumnLayout({Key? key, required this.firstext, required this.secondtext, required this.alignment, this.isColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstext,
          style: isColor == null ? Styles.headLineStyle3.copyWith(color: Colors.white) : Styles.headLineStyle3,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(secondtext,
          style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white): Styles.headLineStyle4,
        )
      ],
    );
  }
}
