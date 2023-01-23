import 'package:flutter/material.dart';
import 'package:flutter_restful_api/services/api_service.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiServices().getCart('1'),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                    future: ApiServices()
                        .getSingleProduct(products[index]['productId']),
                    builder: (context, AsyncSnapshot asyncSnapshot) {
                      if (asyncSnapshot.hasData) {
                        return ListTile(
                          title: Text(asyncSnapshot.data['title']),
                        );
                      }
                      return const LinearProgressIndicator();
                    });
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
