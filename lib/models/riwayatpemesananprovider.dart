import 'package:flutter/material.dart';

class Order {
  final String nama;
  final String email;
  final String noHandphone;
  final String kota;
  final String kecamatan;
  final String alamat;
  final String tipePembayaran;
  final String catatan;

  Order({
    required this.nama,
    required this.email,
    required this.noHandphone,
    required this.kota,
    required this.kecamatan,
    required this.alamat,
    required this.tipePembayaran,
    required this.catatan,
  });
}

class OrderProvider with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }
}
