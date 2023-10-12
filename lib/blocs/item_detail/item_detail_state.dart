// part of 'item_detail_bloc.dart';


import 'package:equatable/equatable.dart';

import '../../models/models.dart';

class ItemDetailState extends Equatable{
  final int quantity;
  final MenuItemModel menuItem;

  const ItemDetailState({required this.quantity, required this.menuItem});

  @override
  List<Object?> get props => [quantity, menuItem];


}