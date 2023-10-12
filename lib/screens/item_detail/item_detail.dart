import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/blocs/blocs.dart';
import 'package:fooddelivery/blocs/cart/cart_event.dart';
import 'package:fooddelivery/config/app_router.dart';
import 'package:fooddelivery/models/models.dart';

class ItemDetail extends StatefulWidget {
  final MenuItemModel item;

  const ItemDetail({super.key, required this.item});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  int quantity = 1;

  late CartBloc _cartBloc;

  @override
  void initState() {
    super.initState();
    _cartBloc = BlocProvider.of<CartBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
    _cartBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  //todo: go to cart page
                  _cartBloc.add(
                    AddToCartEvent(quantity: quantity, menuItem: widget.item),
                  );
                  Future.delayed(const Duration(seconds: 1), (){
                    Navigator.pop(context);
                    Navigator.pushNamed(context, AppRouter.cart);
                  });
                },
                child: Text(
                  'Add to Cart',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.2),
              alignment: Alignment.center,
              child: const Text('Image item here'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                widget.item.name,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                widget.item.description,
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                '#${widget.item.category}',
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Text(
                '\$ ${widget.item.price}',
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  quantity > 0
                      ? IconButton(
                          icon: Icon(
                            Icons.do_not_disturb_on,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 36,
                          ),
                          onPressed: () {
                            setState(() {
                              if (quantity > 0) {
                                quantity--;
                              } else {
                                quantity = 0;
                              }
                            });
                          })
                      : const SizedBox(width: 36 + 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      quantity.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 36,
                    ),
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
