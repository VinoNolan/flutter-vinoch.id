import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vinoch_id/models/userlist.dart';
import 'package:vinoch_id/pages/keranjangpage.dart';
import 'package:vinoch_id/pages/login_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoch_id/pages/tatatransaksipage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
//ALERT
  void alertlogout() {
    Alert(
        context: context,
        style: alertStyle,
        type: AlertType.warning,
        title: 'Kamu Yakin?',
        desc: 'Kamu Keluar ke Halaman Login',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: LoginPage(), type: PageTransitionType.fade)),
            color: Colors.red,
            child: const Text('Yakin'),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.green,
            child: const Text('Tidak'),
          ),
        ]).show();
  }

// STYLE UNTUK ALERT
  var alertStyle = AlertStyle(
    alertElevation: 10,
    overlayColor: Colors.black.withOpacity(.8),
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: true,
    descStyle: GoogleFonts.lato(fontSize: 15),
    descTextAlign: TextAlign.center,
    animationDuration: const Duration(milliseconds: 600),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20),
    alertAlignment: Alignment.center,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// Warna Background Scaffold
      backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 30,
            )),
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 19),
              onPressed: () => alertlogout(),
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
//Container tempat profile
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(100, 153, 233, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            width: double.infinity,
            height: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(datauser[0].imageProfile),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        datauser[0].username,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      datauser[0].email,
                      style:
                          GoogleFonts.lato(color: Colors.white, fontSize: 16),
                    )
                  ],
                )
              ],
            ),
          ),
//MENU
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                  child: Divider(
                thickness: 2,
                color: Color.fromRGBO(100, 153, 233, 1),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'OPSI PILIHAN',
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const Expanded(
                  child: Divider(
                thickness: 2,
                color: Color.fromRGBO(100, 153, 233, 1),
              ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
// BOX MENU
          Container(
            height: 280,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 40,
                    color: Color.fromRGBO(100, 153, 233, 1),
                  ),
                  title: Text(
                    'Keranjang',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: const Color.fromRGBO(100, 153, 233, 1)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const KeranjangPage(),
                            type: PageTransitionType.fade));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag,
                    size: 40,
                    color: Color.fromRGBO(100, 153, 233, 1),
                  ),
                  title: Text(
                    'Riwayat Pemesanan',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: const Color.fromRGBO(100, 153, 233, 1)),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.admin_panel_settings,
                    size: 40,
                    color: Color.fromRGBO(100, 153, 233, 1),
                  ),
                  title: Text(
                    'Hubungi Admin',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: const Color.fromRGBO(100, 153, 233, 1)),
                  ),
                  onTap: () {
                    launchUrl(Uri.parse('https://wa.me/6281586557363'));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.announcement_rounded,
                    size: 40,
                    color: Color.fromRGBO(100, 153, 233, 1),
                  ),
                  title: Text(
                    'Cara Transaksi',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: const Color.fromRGBO(100, 153, 233, 1)),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const TatacaraPage(),
                            type: PageTransitionType.fade));
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 110,
          ),
// Made With Love
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made with love by  ',
                style: GoogleFonts.lato(color: Colors.grey),
              ),
              InkWell(
                onTap: () => launchUrl(
                    Uri.parse('https://www.instagram.com/vinonlr/?hl=id')),
                child: Text(
                  'Vinoch.Id Dev',
                  style: GoogleFonts.lato(color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
