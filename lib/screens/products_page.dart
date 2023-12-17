// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:htppapp/api/category_api.dart';
import 'package:htppapp/api/products_api.dart';
import 'package:htppapp/models/product_model.dart';
import 'package:htppapp/providers/cart_provider.dart';
import 'package:htppapp/utilities/show_alert.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<Product> products = [];
  List<Widget> productList = [];
  List<Widget> categories = [];

  ProductAPI productAPI = ProductAPI();
  CategoryAPI categoryAPI = CategoryAPI();

  @override
  void initState() {
    getCategoriesFromApi();
    getProductsFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ürünler"),
      ),
      body: Column(
        children: <Widget>[
          categoriesList(context),
          Expanded(
            child: productsList(context),
          ),
        ],
      ),
    );
  }

  productsList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: productList),
    );
  }

  categoriesList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: categories),
    );
  }

  void getProductsFromApi() {
    ProductAPI().getProducts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
        createProductList();
      });
    });
  }

  List<Widget> createProductList() {
    for (int i = 0; i < products.length; i++) {
      productList.add(productCard(products[i]));
    }
    return productList;
  }

  Widget productCard(Product product) {
    return Card(
      child: ListTile(
        onTap: () {
          showAlert(context,
              title: product.title, message: product.description);
        },
        leading: Image.network(
          "${product.image}",
          width: 50,
          height: 50,
        ),
        title: Text("${product.title}"),
        subtitle: Text("${product.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.add_shopping_cart_outlined),
          onPressed: () {
            setState(() {
              addToCart(product);
            });
          },
        ),
      ),
    );
  }

  void addToCart(Product product) {
    context.read<CartProvider>().addToCart(product);
  }

  void getCategoriesFromApi() {
    categoryAPI.getCategories().then((response) {
      setState(() {
        if (response.statusCode == 200) {
          String jsonString = response.body;
          List<dynamic> list = json.decode(jsonString);

          categories = list.map((category) {
            if (category is String) {
              return OutlinedButton(
                  onPressed: () {
                    getProductsByCategory(category);
                  },
                  child: Text(category));
            } else {
              print('Kategori string değil');
              return const SizedBox.shrink();
            }
          }).toList();
        } else {
          print("Kategoriler alınamadı. Hata kodu: ${response.statusCode}");
        }
      });
    }).then((value) => {
          categories.insert(
              0,
              OutlinedButton(
                  onPressed: () {
                    productList = [];
                    getProductsFromApi();
                  },
                  child: const Text("Tümü")))
        });
  }

  void getProductsByCategory(String category) {
    categoryAPI.getProductsbyCategory(category).then((response) {
      setState(() {
        productList = [];
        Iterable list = json.decode(response.body);
        products = list.map((product) => Product.fromJson(product)).toList();
        createProductList();
      });
    });
  }
}
