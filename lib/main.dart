import 'package:flutter/material.dart';
import 'package:optime/pages/calendar_Page.dart';
import 'package:optime/pages/chatBot_Page.dart';
import 'package:optime/pages/forum_Page.dart';
import 'package:optime/pages/home_page.dart';
import 'package:optime/pages/login_page.dart';
import 'package:optime/pages/register_page.dart';
import 'package:optime/pages/schedule_Page.dart';
import 'package:optime/pages/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
      '/': (context) => LoginPage(),
      '/Register': (context) => RegisterPage(),
      '/Home': (context) => const HomePage(),
      '/Settings': (context) => const SettingsPage(),
      '/Schedule': (context) => const SchedulePage(),
      '/Forum':(context) => const ForumPage(),
      '/Chatbot': (context) => const ChatbotPage(),
      '/Calendar': (context) => const CalendarPage(),
    },
    );
  }
} 