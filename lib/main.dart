import 'package:aura_blend/models/product.dart';
import 'package:aura_blend/services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aura_blend/firebase_options.dart';
import 'package:aura_blend/themes/theme_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xffb6d0f3),
  ));

  runApp(
    MultiProvider(
      providers: [
        //! theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //! restaurant provider
        ChangeNotifierProvider(create: (context) => Product()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aura Blend',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthGate(),
    );
  }
}
