import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  // list of item on sale
  final List _shopItems = [
    ["orchid sky", "18.00", "assets/images/orchid-flower-sky.jpg"],
    ["Carnation", "31.00", "assets/images/Carnation.jpg"],
    ["Taisuco Koohdan", "49.00", "assets/images/Taisuco Koohdan.jpg"],
    ["orchid phalaenopsis", "28.00", "assets/images/orchid phalaenopsis.jpg"],
  ];
  get shopItems => _shopItems;
}
