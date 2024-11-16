import 'package:flutter/material.dart';
import 'package:aura_blend/components/my_drawer_tile.dart';
import 'package:aura_blend/pages/settings_page.dart';
import 'package:aura_blend/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //! app logo
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Image.asset(
              "assets/images/aura_blend.png",
              height: 180.0,
              width: 180.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //! home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          //! settings list tile
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          //! logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.settings,
            onTap: logout,
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
