import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoch_id/components/jasatile.dart';
import 'package:vinoch_id/components/produktile.dart';

import 'package:vinoch_id/models/maplist.dart';
import 'package:vinoch_id/models/produklist.dart';
import 'package:vinoch_id/models/userlist.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:vinoch_id/pages/detailpage.dart';
import 'package:vinoch_id/pages/katalogjasa.dart';
import 'package:vinoch_id/pages/katalogproduk.dart';
import 'package:vinoch_id/pages/keranjangpage.dart';
import 'package:vinoch_id/pages/login_page.dart';
import 'package:vinoch_id/pages/profile.dart';
import 'package:vinoch_id/pages/riwayatpemesanan.dart';
import 'package:vinoch_id/pages/tatatransaksipage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController heroController = PageController();

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
        backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Vinoch.ID',
            style: GoogleFonts.lato(),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(100, 153, 233, 1),
        ),
//DRAWER
        drawer: Drawer(
          elevation: 5,
          shadowColor: Colors.white,
          width: 225,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(150))),
          child: Container(
            color: const Color.fromRGBO(100, 153, 233, 1),
            child: ListView(
              children: [
// TEMPAT PROFIL
                DrawerHeader(
                    child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const ProfilePage(),
                                type: PageTransitionType.fade));
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage(datauser[0].imageProfile),
                        radius: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      datauser[0].username,
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(datauser[0].email,
                        style: GoogleFonts.lato(color: Colors.white))
                  ],
                )),
                const SizedBox(
                  height: 5,
                ),
//MENU LIST
                const Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Keranjang',
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
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
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Riwayat Pemesanan',
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const RiwayatPemesanan(),
                            type: PageTransitionType.fade));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.admin_panel_settings,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Hubungi Admin',
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
                  ),
                  onTap: () =>
                      launchUrl(Uri.parse('https://wa.me/6281586557363')),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.announcement_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Cara Transaksi',
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const TatacaraPage(),
                            type: PageTransitionType.fade));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Logout',
                    style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
                  ),
                  onTap: () => alertlogout(),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
// Scroll Hero
              Container(
                margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
                height: 150,
                // Gunakan ClipRRect untuk sudut bulat
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Sesuaikan dengan sudut yang Anda inginkan
                  child: Stack(
                    children: [
                      PageView(
                        controller: heroController,
                        children: heroImage.keys.map((key) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(heroImage[key]!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 13.0),
                          child: SmoothPageIndicator(
                            controller: heroController,
                            count: heroImage.length,
                            effect: WormEffect(
                                activeDotColor:
                                    const Color.fromRGBO(100, 153, 233, 1),
                                dotColor: Colors.grey.shade300,
                                dotWidth: 13,
                                dotHeight: 8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
// SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black54),
                          borderRadius: BorderRadius.circular(20)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
// MENU LIST PRODUK
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Produk',
                      style: GoogleFonts.lato(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const KatalogProduk(),
                                type: PageTransitionType.fade));
                      },
                      child: Text(
                        'Selengkapnya...',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(100, 153, 233, 1)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: List.generate(produkkatalog.length, (index) {
                    if (index >= 0 && index <= 3) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: 15.0), // Spasi antar produk
                        child: ProdukTile(
                          judul: produkkatalog[index].judul,
                          harga: produkkatalog[index].harga,
                          imagePath: produkkatalog[index].imagePath,
                          width: 180,
                          heightImage: 140,
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: DetailProduk(
                                      produk: produkkatalog[index],
                                    ),
                                    type: PageTransitionType.fade));
                          },
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
// MENU LIST JASA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tawaran Jasa',
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const KatalogJasa(),
                                type: PageTransitionType.fade));
                      },
                      child: Text(
                        'Selengkapnya...',
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(100, 153, 233, 1)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    produkkatalog.length,
                    (index) {
                      if (index > 3 && index <= 7) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: JasaTile(
                              judul: produkkatalog[index].judul,
                              imagePath: produkkatalog[index].imagePath,
                              harga: produkkatalog[index].harga,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: DetailProduk(
                                            produk: produkkatalog[index]),
                                        type: PageTransitionType.fade));
                              },
                            ));
                      } else {
                        return const SizedBox(); // Widget kosong untuk indeks di luar 5-7
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
