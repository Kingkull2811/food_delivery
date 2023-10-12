import 'package:equatable/equatable.dart';

class MenuItemModel extends Equatable {
  final int id;
  final String name;
  final String category;
  final String description;
  final double price;

  MenuItemModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name,category, description, price];


  static List<MenuItemModel> menuItems = [
    MenuItemModel(
      id: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItemModel(
      id: 2,
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItemModel(
      id: 3,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItemModel(
      id: 4,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItemModel(
      id: 5,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItemModel(
      id: 6,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItemModel(
      id: 7,
      name: 'Coca Cola',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItemModel(
      id: 8,
      name: 'Water',
      category: 'Drink',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItemModel(
      id: 9,
      name: 'Caesar Salad',
      category: 'Salad',
      description: 'A fresh drink',
      price: 1.99,
    ),
    MenuItemModel(
      id: 10,
      name: 'CheeseBurger',
      category: 'Burger',
      description: 'A burger with Cheese',
      price: 9.99,
    ),
    MenuItemModel(
      id: 11,
      name: 'Chocolate Cake',
      category: 'Lesser',
      description: 'A cake with chocolate',
      price: 9.99,
    )
  ];
}
