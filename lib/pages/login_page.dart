import 'package:flutter/material.dart';
import 'package:lab10/services/auth_service.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                // print(_email.toString());
                AuthService.registerUser(_email.text, _password.text)
                    .then((value) {
                  print("succes");
                  Navigator.pop(context);
                });
              },
              child: Text('Login'),
            ),
          ]),
        ));
  }
}
