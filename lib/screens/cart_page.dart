import 'package:flutter/material.dart';
import 'package:htppapp/models/product_model.dart';
import 'package:htppapp/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> myCart = [];

  @override
  void initState() {
    getProductToCart();
    super.initState();
  }

  getProductToCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sepetim"),
        ),
        body: buildPage());
  }

  buildPage() {
    return Center(
      child: showUserCart(),
    );
  }

  Consumer showUserCart() {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        // Sepetteki ürünleri görüntüle
        Map<Product, int> cartItems = cartProvider.getCartWithQuantity;
        if (cartItems.isEmpty) {
          return const Text("Sepetinizde ürün bulunmamaktadır.");
        }
        return ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            Product product = cartItems.keys.toList()[index];
            int quantity = cartItems[product]!;
            return productCard(product, quantity);
          },
        );
      },
    );
  }

  Widget productCard(Product product, int quantity) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Image.network(
              "${product.image}",
              width: 50,
              height: 50,
            ),
            title: Text("${product.title}"),
            subtitle: Text("${product.price}"),
            trailing: IconButton(
              icon: const Icon(Icons.remove_shopping_cart_outlined),
              onPressed: () {
                setState(() {
                  deleteFromCart(product);
                });
              },
            ),
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      increaseFromCart(product);
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text("$quantity"),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      decreaseFromCart(product);
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void decreaseFromCart(Product product) {
    context.read<CartProvider>().removeFromCart(product);
  }

  void increaseFromCart(Product product) {
    context.read<CartProvider>().addToCart(product);
  }

  void deleteFromCart(Product product) {
    context.read<CartProvider>().deleteItemfromCart(product);
  }
}
