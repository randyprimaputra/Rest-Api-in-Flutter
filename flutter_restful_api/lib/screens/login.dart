import 'package:flutter/material.dart';
import 'package:flutter_restful_api/screens/home.dart';
import 'package:flutter_restful_api/services/api_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController nameController =
      TextEditingController(text: "mor_2314");
  TextEditingController passwordController =
      TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Shop"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  final getToken = await ApiServices()
                      .userLogin(nameController.text, passwordController.text);

                  if (getToken['token'] != null) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Success ! your token id is ${getToken['token']}"),
                        backgroundColor: Colors.green));
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Username / Password Incorrect"),
                        backgroundColor: Colors.red));
                  }
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
