import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class JasaTile extends StatelessWidget {
  final String judul, imagePath;
  final double harga;
  final VoidCallback? onTap;
  const JasaTile(
      {super.key,
      required this.judul,
      required this.imagePath,
      required this.harga,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    final String hargaFormatted = formatCurrency.format(harga);
    return GestureDetector(
      onTap: onTap,
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                height: 60,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Start From',
                        style: GoogleFonts.lato(
                            color: Colors.blue[600],
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        hargaFormatted,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 18),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
