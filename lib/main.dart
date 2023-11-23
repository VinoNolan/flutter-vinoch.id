import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vinoch_id/models/cartprovider.dart';
import 'package:vinoch_id/models/riwayatpemesananprovider.dart';
import 'package:vinoch_id/pages/splash.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CartProvider()), // Inisialisasi CartProvider
        ChangeNotifierProvider(
            create: (context) => OrderProvider()), // Inisialisasi CartProvider
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vinoch.ID',
      home: SplashPage(),
    );
  }
}
