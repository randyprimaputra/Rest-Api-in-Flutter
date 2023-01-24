import 'package:flutter/material.dart';
import 'package:flutter_restful_api/services/api_service.dart';

class ProductDetail extends StatelessWidget {
  final int id;
  const ProductDetail(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ApiServices().getSingleProduct(id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      snapshot.data['title'],
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Text(
                        "\$ ${snapshot.data['price']}",
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chip(
                          label: Text(
                            snapshot.data['category'].toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                          backgroundColor: Colors.blueGrey,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Descrption Product",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          snapshot.data['description'],
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() async {
          await ApiServices().updateCart(1, id);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Product added to Cart")));
        }),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
