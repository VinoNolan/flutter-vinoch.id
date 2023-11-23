import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoch_id/models/cartprovider.dart';
import 'package:vinoch_id/models/riwayatpemesananprovider.dart';
import 'package:vinoch_id/pages/homepage.dart';

class RiwayatPemesanan extends StatefulWidget {
  const RiwayatPemesanan({super.key});

  @override
  State<RiwayatPemesanan> createState() => _RiwayatPemesananState();
}

class _RiwayatPemesananState extends State<RiwayatPemesanan> {
  //FLOATING BUTTON BUTTON 1
  Widget hubungiadmin() {
    return FloatingActionButton(
      onPressed: () {
        launchUrl(Uri.parse('https://wa.me/6281586557363'));
      },
      heroTag: "btn1",
      tooltip: 'First button',
      child: const Icon(Icons.announcement_rounded),
    );
  }

  //FLOATING BUTTON BUTTON 2
  Widget homepage() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                child: const Homepage(), type: PageTransitionType.fade));
      },
      heroTag: "btn2",
      tooltip: 'First button',
      child: const Icon(Icons.home_filled),
    );
  }

  @override
  Widget build(BuildContext context) {
// MEMANGGIL DATA CART
    final cartProvider = Provider.of<CartProvider>(context);
// MEMANGGIL DATA CHECKOUT
    final orderProvider = Provider.of<OrderProvider>(context);

//
    String judul = '';
    for (var cartItem in cartProvider.cart.items) {
      judul = cartItem.product.judul;
    }
    double harga = 0.0;
    for (var cartItem in cartProvider.cart.items) {
      harga = cartItem.product.harga;
    }
    int quantity = 0;
    for (var cartItem in cartProvider.cart.items) {
      quantity = cartItem.quantity;
    }

// MEMBUAT SISTEM TOTAL HARGA
    double totalHarga = harga *
        quantity; // MEMBUAT VARIABEL totalHarga 0 agar bisa dimanipulasi

    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
// FLOATING BUTTON
      floatingActionButton: AnimatedFloatingActionButton(
          fabButtons: [homepage(), hubungiadmin()],
          animatedIconData: AnimatedIcons.menu_close),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Riwayat Pemesanan',
          style: GoogleFonts.lato(),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_rounded,
                size: 30,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orderProvider.orders.length,
                  itemBuilder: (context, index) {
                    final order = orderProvider.orders[index];
                    return Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                judul,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color:
                                        const Color.fromRGBO(100, 153, 223, 1)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    NumberFormat.currency(
                                            locale: 'id_ID', symbol: 'Rp ')
                                        .format(harga),
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Text(quantity.toString())
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Harga : ',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SelectableText(
                                    NumberFormat.currency(
                                            locale: 'id_ID', symbol: 'Rp ')
                                        .format(totalHarga),
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                        fontSize: 18),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'DATA PEMESAN :',
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // TARUH DATA NAMA EMAIL DAN NO HANDPHONE
                              // for (var order in orderProvider.orders)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SelectableText(
                                    'Nama : ${order.nama}',
                                    style: GoogleFonts.lato(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SelectableText('Email : ${order.email}',
                                      style: GoogleFonts.lato(fontSize: 16)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SelectableText(
                                      'No.Handphone : ${order.noHandphone}',
                                      style: GoogleFonts.lato(fontSize: 16)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text('ALAMAT : ',
                                      style: GoogleFonts.lato(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SelectableText(
                                    'Asal Kota : ${order.kota}',
                                    style: GoogleFonts.lato(fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SelectableText(
                                      'Kecamatan : ${order.kecamatan}',
                                      style: GoogleFonts.lato(fontSize: 16)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SelectableText('Alamat Lengkap :',
                                      style: GoogleFonts.lato(fontSize: 16)),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black, // Warna border
                                        width: 1.5, // Lebar border
                                      ),
                                    ),
                                    child: SelectableText(
                                      order.alamat,
                                      maxLines: 5,
                                      style: GoogleFonts.lato(fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'TIPE PEMBAYARAN',
                                    style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Transfer ${order.tipePembayaran}',
                                    style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Catatan',
                                    style: GoogleFonts.lato(fontSize: 16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black, // Warna border
                                        width: 1.5, // Lebar border
                                      ),
                                    ),
                                    child: SelectableText(
                                      order.catatan,
                                      maxLines: 5,
                                      style: GoogleFonts.lato(fontSize: 16),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
