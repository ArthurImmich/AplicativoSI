import 'package:aplicativosi/router/delegate.router.dart';
import 'package:aplicativosi/router/pages.router.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  late Delegate _delegate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _delegate = Router.of(context).routerDelegate as Delegate;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 46.0),
                      child: Image.asset(
                        'assets/logo/logo.png',
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Matrícula / CPF"),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Senha"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () => launch(
                              'https://portal.ufsm.br/usuario/esqueciSenha.html'),
                          child: Text(
                            "Esqueceu a senha?",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _delegate.replace(homePageConfig),
                      child: const Text(
                        "Login",
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 42),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
