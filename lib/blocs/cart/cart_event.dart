import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final MenuItemModel menuItem;
  final int quantity;

  const AddToCartEvent({
    required this.menuItem,
    required this.quantity,
  });
}

class UpdateCartItemEvent extends CartEvent {
  final MenuItemModel menuItem;
  final int quantity;

  const UpdateCartItemEvent({
    required this.menuItem,
    required this.quantity,
  });
}

class RemoveFromCartEvent extends CartEvent {
  final MenuItemModel menuItem;

  const RemoveFromCartEvent({required this.menuItem});
}
