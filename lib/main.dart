import 'package:flutter/material.dart';
import 'package:optime/pages/Calendar_Page.dart';
import 'package:optime/pages/ChatBot_Page.dart';
import 'package:optime/pages/Forum_Page.dart';
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