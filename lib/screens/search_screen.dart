import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/double_text_widget.dart';
import 'package:booktickets/widgets/ticket_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:booktickets/widgets/icon_text_widget.dart';

class SearchScreen extends StatelessWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size  = AppLayout.getSize(context);
    return  Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20), vertical: AppLayout.getHeight(20)),
        children: [
          Gap(AppLayout.getHeight(40)),
          Text('What are\nyou looking for?',
          style: Styles.headLineStyle1.copyWith(fontSize: AppLayout.getWidth(35)),
          ),
          Gap(AppLayout.getHeight(40)),
          /*
          ticket tab
          Fittedbox can be here to fit everything to the screen if there is any problem
           */
          const TicketTabs(left_text: 'Airline Tickets', right_text: 'Hotels'),
          Gap(AppLayout.getHeight(25)),
          const IconTextWidget(icon: Icons.flight_takeoff_rounded, text: 'Departure'),
          Gap(AppLayout.getHeight(15)),
          const IconTextWidget(icon: Icons.flight_land_rounded, text: 'Arrival'),
          Gap(AppLayout.getHeight(25)),
          /*
          find ticket button
           */
          InkWell(
            onTap: ()
            {
              print('find tickets');
            },
            child: Container(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15) , vertical: AppLayout.getWidth(18)),
            decoration: BoxDecoration(
            color: const Color(0xd91130ce),
            borderRadius: BorderRadius.circular(AppLayout.getWidth(10))
            ),
            child: Center(
              child: Text('find tickets',
              style: Styles.textStyle.copyWith(color: Colors.white),
              ),
            ),
            ),
          ),
          Gap(AppLayout.getHeight(40)),
          /*
          upcoming flight text
           */
          Container(
              padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(8)),
              child: const AppDoubleTextWidget(bigtext: 'Upcoming Flights', smalltext: 'View all',)),
          Gap(AppLayout.getHeight(15)),
          /*
          below images last part
           */
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /*
              WHITE BOX
               */
              Container(
                padding: EdgeInsets.symmetric(horizontal:AppLayout.getHeight(15), vertical: AppLayout.getHeight(15) ),
                height: AppLayout.getHeight(425),
                width: size.width*0.42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      height: AppLayout.getHeight(190),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                            image: AssetImage(
                              'images/sit.jpg'
                            )

                        )
                      ),
                    ),
                    Gap(AppLayout.getHeight(12)),
                    Text(
                      '20% discount on the early booking of this flight, dont miss.',
                      style: Styles.headLineStyle2,
                    ),
                  ],
                ),
              ),
              /*
              green and red box
               */
              Column(
                children: [
                  /*
                  GREEN BOX
                   */
                  Stack(
                    children: [
                      Container(
                        height: AppLayout.getWidth(200),
                        width: size.width*0.44,
                        decoration: BoxDecoration(
                          color: const Color(0xff3ab8b8),
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                        ),
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15), horizontal: AppLayout.getWidth(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Discount\nfor survey',
                              style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold,color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            Gap(AppLayout.getHeight(10)),
                            Text(
                              'Take the survey about our services and get discount',
                              style: Styles.headLineStyle2.copyWith(fontSize:18,fontWeight: FontWeight.w500,color: Colors.white),
                            ),
                          ],
                        ),

                      ),
                      Positioned(
                        right: -50,
                        top: -50,
                        child: Container(
                          padding: EdgeInsets.all(AppLayout.getHeight(30)),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 18 , color: const Color(0xff189999)),
                          ),
                        ),
                      )
                    ],
                  ),
                   Gap(AppLayout.getHeight(15)),
                  Container(
                    height: AppLayout.getHeight(210),
                    width: size.width*0.44,
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15) , vertical: AppLayout.getHeight(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                      color: const Color(0xffec6545),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Take Love',
                          style: Styles.headLineStyle2.copyWith(color: Colors.white, fontWeight: FontWeight.bold ),
                            textAlign: TextAlign.center,
                        ),
                        Gap(AppLayout.getHeight(5)),
                        RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: '😍',
                                  style: TextStyle(fontSize: 28)
                                ),
                                TextSpan(
                                    text: '🥰',
                                    style: TextStyle(fontSize: 40)
                                ),
                                TextSpan(
                                    text: '😘',
                                    style: TextStyle(fontSize: 28)
                                )
                              ]
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

