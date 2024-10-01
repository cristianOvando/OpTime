import 'package:flutter/material.dart';
import 'package:optime/components/my_app_bar.dart';
import 'package:optime/components/my_bottom_nav_bar.dart';
import 'package:optime/pages/schedule_page.dart';
import 'package:optime/pages/forum_page.dart';
import 'package:optime/pages/chatbot_page.dart';
import 'package:optime/pages/calendar_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SchedulePage(),
    const ForumPage(),
    const ChatbotPage(),
    const CalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: MyBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
