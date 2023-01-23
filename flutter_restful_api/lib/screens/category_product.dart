import 'package:flutter/material.dart';
import 'package:flutter_restful_api/services/api_service.dart';

import 'product_detail.dart';

class CategoryProduct extends StatelessWidget {
  final String categoryName;
  const CategoryProduct(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiServices().getProductByCategory(categoryName),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 30,
                    ),
                    subtitle:
                        Text("Price - \$ ${snapshot.data[index]['price']}"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                            snapshot.data[index]['id'],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
