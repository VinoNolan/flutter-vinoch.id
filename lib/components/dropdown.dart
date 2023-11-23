import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropdown extends StatelessWidget {
  final String hint;
  final String validatorHint;
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;

  const MyDropdown(
      {Key? key,
      required this.selectedValue,
      required this.items,
      required this.onChanged,
      required this.hint,
      required this.validatorHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: Colors.grey[100],
        filled: true,
      ),
      hint: Text(
        hint,
        style: const TextStyle(fontSize: 14),
      ),
      value: selectedValue,
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return validatorHint;
        }
        return null;
      },
      onChanged: onChanged,
      onSaved: (value) {
        // Lakukan sesuatu ketika item terpilih berubah.
        // Anda juga perlu mendefinisikan pilihankota sebelumnya.
        // pilihankota = value.toString();
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
