import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/thick_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  /*
  برای صفحه سوم چون این تیکت قراره سفید بشه میگیم اگر iscolor==null شد تیکت سفید بشه و نوشته ها تغییر کنه
   */
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 167),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(15)),
        child: Column(
          children: [
            /*
              showing the blue part of the ticket
            */
            Container(
              decoration: BoxDecoration(
                color: isColor == null ? const Color(0xff526799) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppLayout.getHeight(21)),
                  topRight: Radius.circular(AppLayout.getHeight(21)),
                ),
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        ticket['from']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                      Expanded(child: Container()),
                      ThickContainer(isColor: isColor == null ? null : true),
                      Expanded(
                        child: Stack(//overlap two widgets
                            children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child:
                             AppLayoutBuilder(sections: 6,isColor: isColor == null ? null : true)
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(
                                Icons.local_airport_rounded,
                                color: isColor == null
                                    ? Colors.white
                                    : Color(0xff8accf7),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      ThickContainer(isColor: isColor == null ? null : true),
                      Expanded(child: Container()),
                      Text(
                        ticket['to']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      )
                    ],
                  ),
                  const Gap(1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['from']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                        ),
                      ),
                      Text(
                        ticket['flying_time'],
                        style: isColor == null
                            ? Styles.headLineStyle3
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle3,
                      ),
                      SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(
                          ticket['to']['name'],
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /*
              showing the orange part of the ticket
            */
            Container(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  /*
                  half circle left
                   */
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                  /*
                  - - - - - - - - - - - - - - - - - - -
                   */
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(AppLayout.getHeight(12)),
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            /*
                          using layoutbuilder to use - - -  in different screen sizes beautifully
                          constraints.constrainWidth()/15
                           */
                            children: List.generate(
                                (constraints.constrainWidth() / 15).floor(),
                                (index) => SizedBox(
                                      width: AppLayout.getWidth(5),
                                      height: AppLayout.getHeight(1),
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: isColor == null
                                              ? Colors.white
                                              : Colors.grey.shade200,
                                        ),
                                      ),
                                    )),
                          );
                        },
                      ),
                    ),
                  ),
                  /*
                  half circle right
                   */
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /*
            bottom part of the orange ticket
             */
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                        AppLayout.getHeight(isColor == null ? 21 : 0)),
                    bottomLeft: Radius.circular(
                        AppLayout.getHeight(isColor == null ? 21 : 0)),
                  )),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 14, right: 14, left: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      AppColumnLayout(
                        firstext: ticket['date'],
                        secondtext: 'Date',
                        alignment: CrossAxisAlignment.start,
                        //اولین isColor برای کلاس TicketView   و  دومین isColor برای کلاس AppColumnLayout
                        isColor: isColor  ==  null ? null : true,
                      ),
                      AppColumnLayout(
                        firstext: ticket['departure_time'],
                        secondtext: 'Departure time',
                        alignment: CrossAxisAlignment.center,
                        //اولین isColor برای کلاس TicketView   و  دومین isColor برای کلاس AppColumnLayout
                        isColor: isColor  ==  null ? null : true,
                      ),
                      AppColumnLayout(
                        firstext: ticket['number'].toString(),
                        secondtext: 'Number',
                        alignment: CrossAxisAlignment.end,
                        //اولین isColor برای کلاس TicketView   و  دومین isColor برای کلاس AppColumnLayout
                        isColor: isColor  ==  null ? null : true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
