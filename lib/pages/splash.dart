import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vinoch_id/pages/Onboard_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Memberikan waktu delay untuk splash page dan diarahkan ke halaman onboard
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) =>
            const OnboardPage(), // Ganti dengan halaman utama Anda
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Lapisan pertama: Gambar latar belakang
          Container(
            decoration:
                const BoxDecoration(color: Color.fromRGBO(238, 237, 237, 1)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/logoUtama.png',
                  height: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
