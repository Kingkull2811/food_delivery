import 'package:fooddelivery/models/models.dart';

class ItemSelected {
  int quantity;
  final MenuItemModel item;

  ItemSelected({this.quantity = 1, required this.item});
}
