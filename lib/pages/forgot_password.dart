import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vinoch_id/components/my_button.dart';
import 'package:vinoch_id/components/my_textfield.dart';
import 'package:vinoch_id/pages/login_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
// Field Controller
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Pasang Background Image
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/bgauth.png'), fit: BoxFit.cover)),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
// Logo
              Lottie.asset('lib/lotties/forgot.json', height: 250),
// Teks Forgot Password
              const SizedBox(
                height: 25,
              ),
              Text(
                'FORGOT PASSWORD',
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.grey[700])),
              ),
              const SizedBox(
                height: 20,
              ),
// Textfield
              MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
// Button Send
              MyButton(onTap: () {}, text: 'Send'),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sudah Punya Akun?',
                    style: GoogleFonts.lato(),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: LoginPage(),
                              type: PageTransitionType.fade));
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(color: Colors.blue)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
