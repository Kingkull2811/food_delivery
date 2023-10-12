import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';
import '../../blocs/cart/cart_event.dart';
import '../../blocs/cart/cart_state.dart';
import '../../models/models.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;

  @override
  void initState() {
    super.initState();
    cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  void dispose() {
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {

          return Scaffold(
            appBar: AppBar(
              title: Text(
                'My Cart',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.redAccent),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        shape: const RoundedRectangleBorder(),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                      child: const Text('Buy now'),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) =>
                    cartItemView(item: state.cartItems[index]),
              ),
            ),
          );
        }
        else {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'My Cart',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
            ),
            body: const Center(
                child: Text('Cart is empty, pls add item to here')),
          );
        }
      },
    );
  }

  Widget cartItemView({required ItemSelected item}) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 50,
        width: 50,
        color: Colors.grey.withOpacity(0.2),
        alignment: Alignment.center,
        child: Text('Image here'),
      ),
      title: Text(
        item.item.name,
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          '\$ ${item.item.price}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.do_not_disturb_on,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              final updatedQuantity = item.quantity - 1;
              if (updatedQuantity > 0) {
                BlocProvider.of<CartBloc>(context).add(
                  UpdateCartItemEvent(
                    menuItem: item.item,
                    quantity: updatedQuantity,
                  ),
                );
              } else {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveFromCartEvent(menuItem: item.item));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              item.quantity.toString(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () {
              BlocProvider.of<CartBloc>(context).add(UpdateCartItemEvent(
                menuItem: item.item,
                quantity: item.quantity + 1,
              ));
            },
          ),
          if (item.quantity > 0)
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () {
                BlocProvider.of<CartBloc>(context)
                    .add(RemoveFromCartEvent(menuItem: item.item));
              },
            ),
        ],
      ),
    );
  }
}
