import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:vinoch_id/components/my_button.dart';
import 'package:vinoch_id/components/my_textfield.dart';
import 'package:vinoch_id/pages/forgot_password.dart';
import 'package:vinoch_id/pages/homepage.dart';
import 'package:vinoch_id/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Text Controller
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/images/bgauth.png'), fit: BoxFit.cover)),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
// logo
              Lottie.asset('lib/lotties/login.json', height: 250),
// Tulisan text
              Text(
                'LOGIN',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 20,
              ),
// email Textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              const SizedBox(
                height: 10,
              ),
// Password Textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 10,
              ),

// forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: ForgotPasswordPage(),
                                type: PageTransitionType.fade));
                      },
                      child: Text(
                        'Lupa Password?',
                        style: GoogleFonts.lato(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 35,
              ),
// sign in button
              MyButton(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const Homepage(),
                          type: PageTransitionType.fade));
                },
                text: 'Login',
              ),
              const SizedBox(
                height: 20,
              ),
// Garis Divider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .8,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Mau Login Pakai Google?',
                        style: GoogleFonts.lato(),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: .5,
                      color: Colors.grey[400],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SignInButton(
                buttonType: ButtonType.google,
                onPressed: () {},
                elevation: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Belum Punya Akun?',
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
                              child: RegisterPage(),
                              type: PageTransitionType.fade));
                    },
                    child: Text(
                      'Register',
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
