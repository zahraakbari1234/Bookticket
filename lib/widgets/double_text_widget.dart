import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDoubleTextWidget extends StatelessWidget {
  final String bigtext;
  final String smalltext;
  const AppDoubleTextWidget({Key? key, required this.bigtext, required this.smalltext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigtext,
          style: Styles.headLineStyle2,
        ),
        InkWell(//to click on a text
          onTap: (){
            print('tapped');
          },
          child: Text(
            smalltext,
            style: Styles.textStyle.copyWith( color: Styles.primaryColor),//copywith replace its argument with the textStyle argument
          ),
        )
      ],
    );
  }
}
