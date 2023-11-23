import 'package:flutter/material.dart';
import 'package:vinoch_id/models/produklist.dart';

class CartItem {
  final Produk product; // Memanggil data dari Produk List
  int quantity; // Menambahkan kuantitas ke CartItem

  CartItem(this.product, this.quantity);
}

class Cart {
  final List<CartItem> items = []; // Menggunakan CartItem alih-alih Produk
}

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;

  void addItemToCart(Produk product, int quantity) {
    bool itemExists = false;

// Apabila ada item yang sama bertambah maka quantity item tersebut yang bertambah
    for (var item in _cart.items) {
      if (item.product.judul == product.judul) {
        item.quantity += quantity;
        itemExists = true;
        break;
      }
    }
// Jika tidak ada maka item baru akan bertambah dengan quantity default
    if (!itemExists) {
      _cart.items.add(CartItem(product, quantity));
    }

    notifyListeners();
  }

  void removeItem(String itemJudul) {
    _cart.items.removeWhere((item) => item.product.judul == itemJudul);
    notifyListeners();
  }

// Fungsi untuk mengetahui apakah item kosong atau tidak
  bool get isEmpty => _cart.items.isEmpty;
}
