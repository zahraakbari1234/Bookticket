import 'package:booktickets/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TicketTabs extends StatelessWidget {
  final String left_text;
  final String right_text;
  const TicketTabs({Key? key, required this.left_text, required this.right_text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      padding: const EdgeInsets.all(3.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((AppLayout.getHeight(50)),),
        color: const Color(0xfff4f6fd),
      ),
      child: Row(
        children: [
          /*
                airline ticket text
                 */
          Container(
            width: size.width*0.44,
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7),),
            decoration: BoxDecoration(
              /*
                      فقط یک طرفش گرد میشه
                       */
              borderRadius: BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50))),
              color:  Colors.white,
            ),
            child:  Center(child: Text(left_text)),
          ),
          /*
                hotels
                 */
          Container(
            width: size.width*0.42,
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7),),
            decoration: BoxDecoration(
              /*
                      فقط یک طرفش گرد میشه
                       */
              borderRadius: BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50))),
              color:  Colors.transparent,
            ),
            child:  Center(child: Text(right_text)),
          ),
        ],
      ),
    );
  }
}
