import 'package:flutter/material.dart';
import 'package:lab10/pages/login_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String groupSimple = '';
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _email,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                hintText: "please enter email",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            TextFormField(
              controller: _password,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                labelText: "password",
                hintText: "please enter password",
                hintStyle: TextStyle(color: Colors.amber),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_email.text);
                  print(_password.text);
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ));
              },
              child: Text('Register'),
            ),
          ]),
        ));
  }
}
