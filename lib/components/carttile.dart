import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import 'package:provider/provider.dart';
import 'package:vinoch_id/models/cartprovider.dart';
import 'package:vinoch_id/pages/checkoutpage.dart';

class CartTile extends StatefulWidget {
  const CartTile({
    Key? key,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
// MENGATUR FORMAT HARGA
  final NumberFormat formatCurrency =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(
        context); // Membuat variabel cartProvider yang terhubung dengan CartProvider
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
// MEMBUAT FUNGSI PENGKODISIAN JIKA HALAMAN KOSONG
        if (cartProvider.cart.items.isEmpty)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'lib/lotties/emptycart.json',
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Kosong, Tidak ada produk sama sekali nih',
                  style: GoogleFonts.lato(color: Colors.grey[500]),
                )
              ],
            ),
          )
        else
//KONDISI JIKA HALAMAN TIDAK KOSONG
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartProvider.cart.items.length,
            itemBuilder: (context, index) {
              final cartItem = cartProvider.cart.items[index];
              final quantity = cartItem.quantity;

              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.product.judul,
                            style:
                                GoogleFonts.lato(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            formatCurrency
                                .format(cartItem.product.harga * quantity),
                            style: GoogleFonts.lato(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (quantity > 1) {
                              cartItem
                                  .quantity--; // Mengurangi kuantitas produk
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline_rounded,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
// QUANTITY
                      Text(quantity.toString()), // Menampilkan kuantitas
                      IconButton(
                        onPressed: () {
                          setState(() {
                            cartItem.quantity++; // Menambah kuantitas produk
                          });
                        },
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          size: 20,
                          color: Colors.green,
                        ),
                      ),
// HAPUS PRODUK
                      IconButton(
                        onPressed: () {
                          cartProvider.removeItem(cartItem.product.judul);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        const SizedBox(
          height: 20,
        ),
// PENGKODISIAN UNTUK TOMBOL JIKA TIDAK KOSONG MAKA AKAN MUNCUL
        if (cartProvider.cart.items.isNotEmpty)
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const CheckoutPage(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            child: Text(
              'CHECKOUT',
              style: GoogleFonts.lato(fontWeight: FontWeight.bold),
            ),
          )
      ],
    );
  }
}
