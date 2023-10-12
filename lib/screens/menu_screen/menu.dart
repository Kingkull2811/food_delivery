import 'package:flutter/material.dart';
import 'package:fooddelivery/config/app_router.dart';

import '../../models/models.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Menu Item',
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: false,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
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
                  Navigator.pushNamed(context, AppRouter.cart);
                },
                child: Text(
                  'Go to Cart',
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
          children: [
            Padding(padding: const EdgeInsets.all(20),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width-40,
              color: Colors.grey.withOpacity(0.2),
              alignment: Alignment.center,
              child: const Text('Shop information here'),
            ),),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: MenuItemModel.menuItems.length,
              itemBuilder: (context, index) {
                return _buildProducts(MenuItemModel.menuItems[index], context, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProducts(
    MenuItemModel itemModel,
    BuildContext context,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, AppRouter.itemDetail,
                arguments: itemModel);
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                child: const Text('Image here'),
                color: Colors.grey.withOpacity(0.2),
              ),
              title: Text(
                itemModel.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              subtitle: Text(
                itemModel.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      '\$${itemModel.price}',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      //todo: add action
                      Navigator.pushNamed(context, AppRouter.itemDetail,
                          arguments: itemModel);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(height: 0.5, color: Colors.grey.withOpacity(0.3)),
      ],
    );
  }
}
