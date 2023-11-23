import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CheckoutTile extends StatefulWidget {
  final String judul;
  final String quantity;
  final double harga;

  const CheckoutTile(
      {Key? key,
      required this.judul,
      required this.quantity,
      required this.harga})
      : super(key: key);

  @override
  State<CheckoutTile> createState() => _CheckoutTileState();
}

class _CheckoutTileState extends State<CheckoutTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.judul,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromRGBO(100, 153, 223, 1)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ')
                      .format(widget.harga),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold, color: Colors.green),
                )
              ],
            ),

            // QUANTITY
            Text(widget.quantity.toString()),
          ],
        ),
      ),
    );
  }
}
