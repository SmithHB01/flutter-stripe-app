import 'package:flutter/material.dart';

import 'package:stripe_app/pages/pages.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff284879),
        scaffoldBackgroundColor: const Color(0xff21232A)
      ),
      title: 'Stripe App',
      initialRoute: 'home',
      routes: {
        'home': ( _ ) => const HomePage(),
        'pago_completo': ( _ ) => const PagoCompletoPage(),
      },
      
    );
  }
}