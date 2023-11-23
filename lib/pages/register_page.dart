import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vinoch_id/components/my_textfield.dart';
import 'package:vinoch_id/components/my_button.dart';
import 'package:vinoch_id/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  // Text Field Controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
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
                Lottie.asset('lib/lotties/login.json', height: 250),
                // Register
                Text(
                  'REGISTER',
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
                // Text Field
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                    controller: confirmController,
                    hintText: 'Confirm Password',
                    obscureText: false),
                const SizedBox(
                  height: 20,
                ),
                // Button Register
                MyButton(onTap: () {}, text: 'Register'),
                const SizedBox(
                  height: 30,
                ),
                // Teks Sudah Punya Akun? Login
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
      ),
    );
  }
}
