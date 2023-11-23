import 'package:animated_floating_buttons/widgets/animated_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vinoch_id/components/checkouttile.dart';
import 'package:vinoch_id/components/dropdown.dart';
import 'package:vinoch_id/components/mytextfieldcheckout.dart';
import 'package:vinoch_id/components/txtarea.dart';
import 'package:vinoch_id/models/cartprovider.dart';
import 'package:vinoch_id/models/riwayatpemesananprovider.dart';
import 'package:vinoch_id/pages/homepage.dart';
import 'package:vinoch_id/pages/riwayatpemesanan.dart';
import 'package:vinoch_id/pages/tatatransaksipage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  //FLOATING BUTTON BUTTON 1
  Widget tatacara() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            PageTransition(
                child: const TatacaraPage(), type: PageTransitionType.fade));
      },
      heroTag: "btn1",
      tooltip: 'First button',
      child: const Icon(Icons.announcement_rounded),
    );
  }

  //FLOATING BUTTON BUTTON 2
  Widget proses() {
    return FloatingActionButton(
      onPressed: () {
        _checkout();
      },
      heroTag: "btn2",
      tooltip: 'First button',
      child: const Icon(Icons.shopping_cart_checkout_rounded),
    );
  }

  //FLOATING BUTTON BUTTON 3
  Widget hubungiadmin() {
    return FloatingActionButton(
      onPressed: () {
        launchUrl(Uri.parse('https://wa.me/6281586557363'));
      },
      heroTag: "btn3",
      tooltip: 'Second button',
      child: const Icon(Icons.admin_panel_settings),
    );
  }

//MATERIAL DROPDOWN KOTA
  List<String> kota = ['Boyolali', 'Surakarta', 'Klaten']; // Set daftar Kota
  String? pilihankota; // Set nilai awal untuk jika kota dipilih maka akan apa
  bool fungsikotabyl = false; // untuk mengontrol pilihankota
  bool fungsikotaskt = false; // untuk mengontrol pilihankota
  bool fungsikotaklt = false; // untuk mengontrol pilihankota
//MATERIAL DROPDOWN KECAMATAN
  List<String> kecamatanbyl = [
    'Boyolali',
    'Teras',
    'Banyudono'
  ]; // Set daftar Kecamatan di Boyolali
  String?
      pilihankecbyl; // Set nilai awal untuk jika kecamatan dipilih maka akan apa
  bool fungsikecbyl = false; // untuk mengontrol pilihankec

  List<String> kecamatansrk = [
    'Jebres',
    'Laweyan',
    'Banjarsari'
  ]; // Set daftar Kecamatan di Surakarta
  String?
      pilihankecsrk; // Set nilai awal untuk jika kecamatan dipilih maka akan apa
  bool fungsikecsrk = false; // untuk mengontrol pilihankec

  List<String> kecamatanklt = [
    'Klaten',
    'Polanharjo',
    'Karangdowo'
  ]; // Set daftar Kecamatan di Klaten
  String?
      pilihankecklt; // Set nilai awal untuk jika kecamatan dipilih maka akan apa
  bool fungsikecklt = false; // untuk mengontrol pilihankec
//MATERIAL DROPDOWN TIPE PEMBAYARAN
  List<String> tipepembayaran = [
    'Bank Transfer',
    'Dana',
    'Gopay'
  ]; // Set daftar Kota
  String?
      pilihanpembayaran; // Set nilai awal untuk jika kota dipilih maka akan apa
  bool fungsitipebank = false; // untuk mengontrol pilihankota
  bool fungsitipedana = false; // untuk mengontrol pilihankota
  bool fungsitipegopay = false; // untuk mengontrol pilihankota

// CONTROLLER
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

//FUNGSI UNTUK MENGIRIM DATA KE MODEL DATA RIWAYAT PEMESANAN

  void _checkout() {
    final orderProvider = Provider.of<OrderProvider>(context, listen: false);

    Order order = Order(
      nama: nameController.text,
      email: emailController.text,
      noHandphone: phoneController.text,
      kota: pilihankota ?? '',
      kecamatan: pilihankecbyl ?? '',
      alamat: alamatController.text,
      tipePembayaran: pilihanpembayaran ?? '',
      catatan: catatanController.text,
    );

    orderProvider.addOrder(order);

    // Setelah menyimpan pesanan, Anda dapat melakukan navigasi ke halaman lain atau melakukan tindakan lain sesuai kebutuhan.
    alertberhasil();
  }

// ALERT BERHASIL PROSES
  void alertberhasil() {
    Alert(
        context: context,
        style: alertStyle,
        type: AlertType.success,
        title: 'Pembelian Tercatat',
        desc: 'Jangan Lupa Kirim Bukti Transfer',
        buttons: [
          DialogButton(
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: const RiwayatPemesanan(),
                    type: PageTransitionType.fade)),
            color: Colors.blue,
            child: const Text('Lanjut?'),
          ),
          DialogButton(
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                    child: const Homepage(), type: PageTransitionType.fade)),
            color: Colors.blue,
            child: const Text('Homepage'),
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
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(
        context); // membuat variabel cartProvider yang terhubung dengan CARTPROVIDER/ CART MODEL
    double totalHarga =
        0.0; // MEMBUAT VARIABEL totalHarga 0 agar bisa dimanipulasi
    for (var cartItem in cartProvider.cart.items) {
      // MEMBUAT VARIABEL cartItem yang terhubung dengan cartprovider.cart.items
      totalHarga += (cartItem.product.harga *
          cartItem
              .quantity); // MEMBUAT OPERASI untuk Total harga MAKANYA DIBUAT totalHarga untuk menampung hasil dari harga*quantity biar manggilnya gampang
    }
    return Scaffold(
// FLOATING BUTTON
      floatingActionButton: AnimatedFloatingActionButton(
          fabButtons: [tatacara(), hubungiadmin(), proses()],
          animatedIconData: AnimatedIcons.menu_close),
      backgroundColor: const Color.fromRGBO(238, 237, 237, 1),
// APPBAR
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(100, 153, 223, 1),
        centerTitle: true,
        title: Text(
          'Checkout',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
// PEMBUNGKUS CONTAINER PUTIH
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// BIODATA
                  Text(
                    'BIODATA',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
// COMPONENT TEXT FIELD
                  TxtFieldCheckout(
                      controller: nameController,
                      hintText: 'Nama',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  TxtFieldCheckout(
                      controller: emailController,
                      hintText: 'Email Aktif',
                      obscureText: false),
                  const SizedBox(
                    height: 10,
                  ),
                  TxtFieldCheckout(
                    controller: phoneController,
                    hintText: 'No.Hp dengan Awalan 62 pengganti 0',
                    obscureText: false,
                    keyboardType: TextInputType.phone,
                  ),
// ALAMAT
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ALAMAT',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
// DROPDOWN
                  MyDropdown(
                    hint: 'Silahkan Pilih Kota',
                    validatorHint: 'Silahkan Pilih Kota Dulu',
                    selectedValue: pilihankota,
                    items: kota,
                    onChanged: (value) {
                      setState(() {
                        pilihankota = value;
                        if (value == 'Boyolali') {
                          fungsikotabyl = true;
                        } else {
                          fungsikotabyl = false;
                        }

                        if (value == 'Surakarta') {
                          fungsikotaskt = true;
                        } else {
                          fungsikotaskt = false;
                        }

                        if (value == 'Klaten') {
                          fungsikotaklt = true;
                        } else {
                          fungsikotaklt = false;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (fungsikotabyl)
                    MyDropdown(
                        selectedValue: pilihankecbyl,
                        items: kecamatanbyl,
                        onChanged: (value) {
                          setState(() {
                            pilihankecbyl = value;
                          });
                        },
                        hint: 'Silahkan Pilih Kecamatan',
                        validatorHint: 'Silahkan Pilih Kecamatan Dulu'),

                  if (fungsikotaskt)
                    MyDropdown(
                        selectedValue: pilihankecsrk,
                        items: kecamatansrk,
                        onChanged: (value) {
                          setState(() {
                            pilihankecsrk = value;
                          });
                        },
                        hint: 'Silahkan Pilih Kecamatan',
                        validatorHint: 'Silahkan Pilih Kecamatan Dulu'),

                  if (fungsikotaklt)
                    MyDropdown(
                        selectedValue: pilihankecklt,
                        items: kecamatanklt,
                        onChanged: (value) {
                          setState(() {
                            pilihankecklt = value;
                          });
                        },
                        hint: 'Silahkan Pilih Kecamatan',
                        validatorHint: 'Silahkan Pilih Kecamatan Dulu'),
                  const SizedBox(
                    height: 10,
                  ),
                  MytxtArea(
                      hint:
                          'Kelurahan, Kode Pos, Rt, Rw, No.rumah, dan Keterangan pendukung lain',
                      controller: alamatController)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
// DATA PRODUK DARI CART
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cartProvider.cart.items.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cart.items[index];
                final quantity = cartItem.quantity;
                return CheckoutTile(
                    judul: cartItem.product.judul,
                    harga: cartItem.product.harga,
                    quantity: quantity.toString());
              },
            ),
// TEMPAT MENAMPILKAN TOTAL HARGA
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 20, left: 20, top: 15, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Harga:',
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    // AGAR BISA DIBLOCK DAN DICOPY
                    SelectableText(
                      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                          .format(totalHarga),
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
// TEMPAT MENAMPILKAN DROPDOWN TIPE PEMBAYARAN
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIPE PEMBAYARAN',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
// DROPDOWN TIPE PEMBAYARAN
                  MyDropdown(
                      selectedValue: pilihanpembayaran,
                      items: tipepembayaran,
                      onChanged: (value) {
                        setState(() {
                          pilihanpembayaran = value;

                          if (value == 'Bank Transfer') {
                            fungsitipebank = true;
                          } else {
                            fungsitipebank = false;
                          }

                          if (value == 'Dana') {
                            fungsitipedana = true;
                          } else {
                            fungsitipedana = false;
                          }

                          if (value == 'Gopay') {
                            fungsitipegopay = true;
                          } else {
                            fungsitipegopay = false;
                          }
                        });
                      },
                      hint: 'Tipe Pembayaran',
                      validatorHint: 'Silahkan Pilih Tipe Pembayaran Dulu'),
                  const SizedBox(
                    height: 15,
                  ),
// JIKA FUNGSITIPEBANK TRUE MAKA AKAN KELUAR ROW TRANSFER BCA MANDIRI
                  if (fungsitipebank)
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Transfer BCA         :',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SelectableText(
                              '1234567890',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              'Transfer Mandiri :',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SelectableText(
                              '1234567890',
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
// JIKA FUNGSITIPEBANK TRUE MAKA AKAN KELUAR ROW DANA
                  if (fungsitipedana)
                    Row(
                      children: [
                        Text(
                          'Dana :',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(
                          '081543352242',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
// JIKA FUNGSITIPEBANK TRUE MAKA AKAN KELUAR ROW GOPAY
                  if (fungsitipegopay)
                    Row(
                      children: [
                        Text(
                          'Gopay :',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SelectableText(
                          '081543352242',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
// TEMPAT MENAMPILKAN CATATAN
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Catatan',
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MytxtArea(
                      hint: 'Ada catatan khusus?',
                      controller: catatanController)
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
