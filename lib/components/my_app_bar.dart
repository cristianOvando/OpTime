import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, 
      centerTitle: true, 
      title: const Text(
        'OpTime',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        PopupMenuButton<int>(
          onSelected: (value) {
            switch (value) {
              case 0:
                Navigator.pushNamed(context, '/Settings');
                break;
              case 1:
                _signOut(context);
                break;
            }
          },
          icon: const Icon(Icons.menu), 
          itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
            const PopupMenuItem<int>(
              value: 0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('lib/images/User.jpg'), 
                ),
                title: Text('Configuración'),
              ),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.red),
                title: Text(
                  'Cerrar sesión',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Función para cerrar sesión
  void _signOut(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false); 
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}