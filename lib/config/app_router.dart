import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/blocs/blocs.dart';
import 'package:fooddelivery/models/models.dart';
import '../screens/screens.dart';

class AppRouter {
  static const main = '/';
  static const menu = '/menu';
  static const itemDetail = '/menu/itemDetail';
  static const cart = '/menu/cart';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
          settings: const RouteSettings(name: main),
        );
      case menu:
        return MaterialPageRoute(
          builder: (_) => const MenuScreen(),
          settings: const RouteSettings(name: menu),
        );
      case cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
          settings: const RouteSettings(name: cart),
        );
      case itemDetail:
        return MaterialPageRoute(
          builder: (_) => ItemDetail(item: settings.arguments as MenuItemModel),
          settings: const RouteSettings(name: itemDetail),
        );
      // case VoucherScreen.routeName:
      //   return VoucherScreen.route();
      // case DeliveryTimeScreen.routeName:
      //   return DeliveryTimeScreen.route();
      // case EditBasketScreen.routeName:
      //   return EditBasketScreen.route();
      // case RestaurantDetailsScreen.routeName:
      //   return RestaurantDetailsScreen.route(
      //       restaurant: settings.arguments as Restaurant);
      // case RestaurantListingScreen.routeName:
      //   return RestaurantListingScreen.route(
      //       restaurants: settings.arguments as List<Restaurant>);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
