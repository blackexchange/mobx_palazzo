import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_palazzo/pages/components/components.dart';
import '../../stores/stores.dart';

import '../signup/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SignInStore signInStore = SignInStore();

  final AuthStore authStore = GetIt.I<AuthStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    when((_) => authStore.userAuth != null, () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  //mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Observer(
                      builder: (_) {
                        return ErrorBox(signInStore.error);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text('Acessar com e-mail'),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !signInStore.isLoading,
                            isDense: true,
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                            errorText: signInStore.emailError),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: signInStore.setEmail,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !signInStore.isLoading,
                            isDense: true,
                            label: Text('Senha'),
                            border: OutlineInputBorder(),
                            errorText: signInStore.senhaError),
                        obscureText: true,
                        onChanged: signInStore.setSenha,
                      );
                    }),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueci a senha',
                        ),
                      ),
                    ),
                    Observer(builder: (_) {
                      return ElevatedButton(
                          onPressed: signInStore.signInPressed,
                          child: Text('ENTRAR'));
                    }),
                    Divider(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => SignUpPage()));
                        },
                        child: Text(
                          'CADASTRE-SE',
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
