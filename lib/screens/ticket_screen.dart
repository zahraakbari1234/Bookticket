import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/widgets/column_layout.dart';
import 'package:booktickets/widgets/layout_builder_widget.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';
class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20) , vertical:  AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text('Tickets',style: Styles.headLineStyle2),
              Gap(AppLayout.getHeight(20)),
              const TicketTabs(left_text: 'Upcoming', right_text: 'Previous'),
              Gap(AppLayout.getHeight(20)),
              /*
              ticket part
               */
              Container(
                  padding: EdgeInsets.only(left: AppLayout.getHeight(15),),
                  child: TicketView(ticket: ticketList[0], isColor:true),
              ),
              const SizedBox(
                height: 1,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15),vertical: AppLayout.getHeight(20)),
                margin: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                color: Colors.white,
                child: Column(
                  children: [
                    /*
                    second text part
                     */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                          AppColumnLayout( firstext: 'Flutter DB', secondtext: 'Passenger', alignment : CrossAxisAlignment.start,isColor:true),
                          AppColumnLayout(firstext: '12345 67899', secondtext: 'passport', alignment: CrossAxisAlignment.end,isColor:true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 15,isColor:true , width: 5),
                    Gap(AppLayout.getHeight(20)),
                    /*
                    third text part
                     */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppColumnLayout( firstext: '3435 547577', secondtext: 'Number of E-ticket', alignment : CrossAxisAlignment.start,isColor:true),
                        AppColumnLayout(firstext: 'B2SG28', secondtext: 'Booking Code', alignment: CrossAxisAlignment.end,isColor:true),
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    const AppLayoutBuilder(sections: 15,isColor:true , width: 5),
                    Gap(AppLayout.getHeight(20)),
                    /*
                    forth text part_VISA part
                     */
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset("images/visa.png" , scale: 11),
                                const Text('***2462'),
                              ]

                            ),
                            Gap(AppLayout.getHeight(5)),
                            Text('Payment method' , style: Styles.headLineStyle4,),
                          ],
                        ),
                        const AppColumnLayout(firstext: '\$249.99', secondtext: 'price', alignment: CrossAxisAlignment.end,isColor:true),
                      ],
                    ),
                  ],
                ),
              ),
              /*
              barcode
               */
              const SizedBox(
                height: 1,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(21),
                    bottomRight: Radius.circular(21),
                  )
                ),
                margin: const EdgeInsets.only(left: 15 , right: 15),
                padding: const EdgeInsets.only(top: 15 , bottom: 15),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      data: 'http//github.com/zahraakbari1234',
                      barcode: Barcode.code128(),
                      drawText: false,
                      color: Styles.textColor ,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              top: AppLayout.getHeight(295),
              left: AppLayout.getHeight(22),
              child: Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(3)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Styles.textColor , width: 2),
                  ),
                  child:CircleAvatar(
                    maxRadius: 4,
                    backgroundColor: Styles.textColor,
                  )
              ),
          ),
          Positioned(
            bottom: AppLayout.getHeight(295),
            right: AppLayout.getHeight(22),
            child: Container(
                padding: EdgeInsets.all(AppLayout.getHeight(3)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Styles.textColor , width: 2),
                ),
                child:CircleAvatar(
                  maxRadius: 4,
                  backgroundColor: Styles.textColor,
                )
            ),
          )

        ],
      )
    );
  }
}
