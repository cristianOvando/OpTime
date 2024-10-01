import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const MyBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Construyendo MyBottomNavBar');
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.schedule, size: 28), 
          label: 'Horario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum, size: 28), 
          label: 'Foro',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 28),
          label: 'ChatBot',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, size: 28), 
          label: 'Calendario',
        ),
      ],
      selectedLabelStyle: const TextStyle(fontSize: 14), 
      unselectedLabelStyle: const TextStyle(fontSize: 12), 
      type: BottomNavigationBarType.fixed, 
    );
  }
}
