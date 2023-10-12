import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/models/models.dart';

import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final List<ItemSelected> cartItems = [];

  CartBloc() : super(CartInitial()) {
    on((event, emit) {
      if (event is AddToCartEvent) {
        cartItems.add(ItemSelected(
          item: event.menuItem,
          quantity: event.quantity,
        ));
        emit(CartLoaded(cartItems: List.from(cartItems)));
      } else if (event is UpdateCartItemEvent) {
        final index =
            cartItems.indexWhere((item) => item.item.id == event.menuItem.id);
        if (index >= 0) {
          cartItems[index] = ItemSelected(
            item: event.menuItem,
            quantity: event.quantity,
          );
          emit(CartLoaded(cartItems: List.from(cartItems)));
        }
      } else if (event is RemoveFromCartEvent) {
        cartItems.removeWhere((item) => item.item.id == event.menuItem.id);
        emit(CartLoaded(cartItems: List.from(cartItems)));
      }
    });
  }
}
