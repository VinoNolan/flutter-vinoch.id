import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DetailScreenJasa extends StatefulWidget {
  final String judul, imagePath, deskripsi;
  final double harga;
  const DetailScreenJasa(
      {super.key,
      required this.deskripsi,
      required this.imagePath,
      required this.judul,
      required this.harga});

  @override
  State<DetailScreenJasa> createState() => _DetailScreenJasaState();
}

class _DetailScreenJasaState extends State<DetailScreenJasa> {
  @override
  Widget build(BuildContext context) {
    final NumberFormat formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    final String hargaFormatted = formatCurrency.format(widget.harga);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
// GAMBAR JASA
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.imagePath), fit: BoxFit.cover)),
        ),

// DESKRIPSI JASA DLL
        Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // JUDUL JASA
              Text(
                widget.judul,
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    'Start From',
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    hargaFormatted,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontSize: 20),
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                color: Color.fromRGBO(100, 153, 233, 1),
              ),
              const SizedBox(
                height: 10,
              ),
              //DESKRIPSI
              Text(
                'DESKRIPSI',
                style:
                    GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.deskripsi,
                style: GoogleFonts.lato(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
