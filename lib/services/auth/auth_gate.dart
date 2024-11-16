import 'package:aura_blend/components/buttom_navigation_bar.dart';
import 'package:aura_blend/pages/perfume_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aura_blend/pages/most_selling_page.dart';
import 'package:aura_blend/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //! user is logged in
          if (snapshot.hasData) {
            return const BottomNavBarExample();
          }
          //! user is not logged in
          else {
            return const BottomNavBarExample();
          }
        },
      ),
    );
  }
}
