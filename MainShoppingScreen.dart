// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/product_provider/ProductsPrvider.dart';
import '../widgets/GridProductItem.dart';
import 'cart_screen.dart';
import 'order_screen.dart';

class MainShoppingScreen extends StatefulWidget {
  static const id = '/MainShoppingScreen';

  const MainShoppingScreen({Key? key}) : super(key: key);

  @override
  State<MainShoppingScreen> createState() => _MainShoppingScreenState();
}

class _MainShoppingScreenState extends State<MainShoppingScreen> {
  bool showFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.pink,
          onPressed: () {
            Navigator.of(context).pushNamed(OrdersScreen.id);
          },
          label: Text('My Orders'),
        ),
        appBar: AppBar(
          title: Text("Grocery Shop"),
          actions: [
            PopupMenuButton(
              onSelected: (int selectedVal) {
                setState(() {
                  showFav = selectedVal == 0;
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  PopupMenuItem(child: Text('Filter by favorite'), value: 0),
                  PopupMenuItem(child: Text('Remove filters'), value: 1),
                ];
              },
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.id);
              },
              icon: Icon(Icons.shopping_cart_checkout),
            ),
          ],
        ),
        body: ProductsGrid(isFav: showFav),
      ),
    );
  }
}

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key? key,
    required this.isFav,
  }) : super(key: key);

  final bool isFav;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final availProducts =
        isFav ? productData.favoriteProducts : productData.availProducts;

    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: availProducts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: availProducts[index],
          child: GridProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 30,
      ),
    );
  }
}
