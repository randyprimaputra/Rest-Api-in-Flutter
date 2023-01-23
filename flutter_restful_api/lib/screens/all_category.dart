import 'package:flutter/material.dart';
import 'package:flutter_restful_api/screens/category_product.dart';
import 'package:flutter_restful_api/services/api_service.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: ApiServices().getAllCategory(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CategoryProduct(snapshot.data[index])));
                      },
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          padding: const EdgeInsets.all(40),
                          child: Center(
                            child: Text(
                              snapshot.data[index].toString().toUpperCase(),
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
