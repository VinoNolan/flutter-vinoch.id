// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vinoch_id/pages/login_page.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  // controller to keep track of which page we're on
  PageController controlpage = PageController();
  // keep track of if we are on the last page
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/images/bgonboard.png'),
                fit: BoxFit.cover)),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: [
            PageView(
              controller: controlpage,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
              ],
            ),

            // dot indicators
            Container(
              alignment: const Alignment(0, .25),
              child: SmoothPageIndicator(
                controller: controlpage,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotWidth: 14,
                    dotHeight: 9,
                    activeDotColor: const Color.fromRGBO(72, 219, 251, 1.0),
                    dotColor: Colors.grey.shade300),
              ),
            ),

            // Pengkondisian 2 Button untuk screen 1 sampai 3
            onLastPage
                ?
                // Kondisi 2 Button untuk Screen 3
                Container(
                    alignment: const Alignment(0, 0.85),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LoginPage()));
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 30, right: 30),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(100, 153, 233, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20)),
                              ),
                            ))
                      ],
                    ))
                :
                // Kondisi 2 Button untuk Screen 1 dan 2
                Container(
                    alignment: const Alignment(0, 0.90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              controlpage.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 7, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(100, 153, 233, 1.0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Next',
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                              ),
                            )),
                        GestureDetector(
                            onTap: () {
                              controlpage.jumpToPage(2);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                  top: 7, bottom: 7, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                'Skip',
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromRGBO(100, 153, 233, 1.0),
                                        fontSize: 16)),
                              ),
                            )),
                      ],
                    )),
          ],
        ),
      ),
    ));
  }
}

// Halaman Screen Pertama
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('lib/lotties/onboard1.json', height: 290),
        const SizedBox(
          height: 100,
        ),
        Text(
          'Haloo!',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Selamat Datang di Vinoch.ID Tempat Penjualan License App dan Penyediaan Jasa Termurah dan Terpercaya',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )),
        ),
      ],
    );
  }
}

// Halaman Screen Kedua
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('lib/lotties/onboard2.json', height: 300),
        const SizedBox(
          height: 50,
        ),
        Text(
          'Fast Respon',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Admin Kami Selalu Stand By Buat Kamu, Transaksi mu Jadi Lancar',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )),
        ),
      ],
    );
  }
}

// Halaman Screen Ketiga
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset('lib/lotties/onboard3.json'),
        const SizedBox(
          height: 100,
        ),
        Text(
          'Penasaran?',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          )),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Yuk! Liat-Liat Dulu Aja Siapa Tahu Cocok hehe...',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
            color: Colors.black26,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          )),
        ),
      ],
    );
  }
}
