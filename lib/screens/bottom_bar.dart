import 'package:booktickets/screens/search_screen.dart';
import 'package:booktickets/screens/ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _selectedIndex  = 0;

  static final List<Widget> _widgetOption = <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const Text('profile')

  ];
  void _onItemTapped(int index){ //change _selectedIndex according to the icon selected on navigation 0-1-2-3
    setState(() {
      _selectedIndex  = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption[_selectedIndex],//selected index changes to change the class in above list
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        //flutter choose the index automatically when item chosen
          onTap: _onItemTapped,//change the index according to the chosen icon
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: const Color(0xFF526480),
          type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_home_regular),//should add realted package to use fluent_icons
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
              label: 'Search'),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_ticket_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
              label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: 'Profile'),

        ],

      ),
    );
  }
}
