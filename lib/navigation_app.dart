import 'package:flutter/material.dart';
import 'package:htppapp/screens/cart_page.dart';
import 'package:htppapp/screens/products_page.dart';
import 'package:htppapp/screens/user_profile_page.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});
  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar(),
      body: const <Widget>[
        ProductsPage(),
        CartPage(),
        UserProfilePage(),
      ][currentPageIndex],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: "Ürünler",
            backgroundColor: Color.fromARGB(255, 234, 18, 2)),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: "Sepetim",
            backgroundColor: Color.fromARGB(255, 31, 219, 138)),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
            backgroundColor: Color.fromARGB(255, 237, 30, 252)),
      ],
      currentIndex: currentPageIndex,
      selectedItemColor: const Color.fromARGB(255, 44, 77, 184),
      onTap: _onItemTapped,
      type: BottomNavigationBarType.shifting,
    );
  }

  void _onItemTapped(int index) => setState(() => currentPageIndex = index);



}
