import 'package:flutter/material.dart';
import 'package:htppapp/models/product_model.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  List<Product> products = [];
  List<Widget> productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Profilim"),
        ),
        body: buildPage());
  }

  buildPage() {
    return const Column(
      children: [
        SizedBox(
          height: 30,
        ),
        CircleAvatar(
          radius: 50,
          backgroundImage:
              NetworkImage("https://randomuser.me/api/portraits/men/0.jpg"),
        ),
        Center(
          child: Text(
            "Mark Fucker",
            style: TextStyle(fontSize: 24),
          ),
        ),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("Kullanıcı Adı"),
            subtitle: Text("@markfucker")),
        ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("dragojlo.serbedzija@example.com")),
        ListTile(
            leading: Icon(Icons.phone),
            title: Text("Telefon"),
            subtitle: Text("+010-0905-320")),
        ListTile(
            leading: Icon(Icons.person),
            title: Text("Doğum Tarihi"),
            subtitle: Text("10/01/1991")),
      ],
    );
  }
}
