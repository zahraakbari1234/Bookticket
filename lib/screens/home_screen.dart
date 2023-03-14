import 'package:booktickets/screens/hotel_screen.dart';
import 'package:booktickets/screens/ticket_view.dart';
import 'package:booktickets/utils/app_info_list.dart';
import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:booktickets/widgets/double_text_widget.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding:  EdgeInsets.only(left: AppLayout.getHeight(10), right: AppLayout.getHeight(10)),//puts space around all the widgets in the page cause all are in
            //this column and in this container
            child: Column(
              children: [
                const Gap(40),
                /*
                 first top part
                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good Morning',
                          style: Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          'Book Tickets',
                          style: Styles.headLineStyle1,
                        ),
                      ],
                    ),
                    Container(
                      height: AppLayout.getHeight(50),
                      width: AppLayout.getWidth(50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/img_1.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(25),
                /*
                search part
                 */
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(10)),
                    color: const Color(0xfff4f6fd),
                  ),
                  padding:  EdgeInsets.symmetric(horizontal: AppLayout.getHeight(12) , vertical: AppLayout.getWidth(12)),
                  child: Row(
                    children: [
                      const Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Colors.grey,
                      ),
                      Text(
                        'Search',
                        style: Styles.headLineStyle4,
                      )
                    ],
                  ),
                ),
                const Gap(40),
                /*
                third text part
                 */
                 Container(
                     padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(8)),
                     child: const AppDoubleTextWidget(bigtext: 'Upcoming Flights', smalltext: 'View all',)),
              ],
            ),
          ),
          const Gap(15),
          /*
          ticket info part
           */
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.only(left: AppLayout.getHeight(20)),
            child: Row(
              children: ticketList.map((singleticket) => TicketView(ticket: singleticket,)).toList(),
            ),
          ),
          const Gap(15),
          /*
            text above hotel
            */
          Container(
            padding:  EdgeInsets.symmetric(horizontal: AppLayout.getHeight(20)),
            child: const AppDoubleTextWidget(bigtext: 'Hotels', smalltext: 'View all',),
          ),
          const Gap(15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:  EdgeInsets.only(left: AppLayout.getHeight(20)),
            child: Row(
              /*
              میره داخل لیست هتل ها و برای هرکدام به صورت جداگانه با توجه به مشخصات داخل لیست یکبار تابع Hotelscreen را اجرا میکند.
               */
              children: hotelList.map((singlehotel) => HotelScreen(hotel: singlehotel)).toList(),
            ),
          ),

        ],
      ),
    );
  }
}
