part of 'item_detail_bloc.dart';

abstract class ItemDetailEvent{}

class ItemDetailInitialEven extends ItemDetailEvent{
  final int quantity;

  ItemDetailInitialEven({required this.quantity});
}
