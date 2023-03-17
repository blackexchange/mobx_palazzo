import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_palazzo/pages/components/components.dart';
import '../../stores/stores.dart';
import '../../pages/login/login.dart';

class SignUpPage extends StatelessWidget {
  SignUpStore signUpStore = SignUpStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Registro'),
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
              padding: const EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(
                      builder: (_) {
                        return ErrorBox(signUpStore.error);
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) => TextField(
                        decoration: InputDecoration(
                            enabled: !signUpStore.isLoading,
                            isDense: true,
                            label: const Text('Nome'),
                            border: const OutlineInputBorder(),
                            errorText: signUpStore.nameError),
                        autocorrect: false,
                        onChanged: signUpStore.setName,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !signUpStore.isLoading,
                            isDense: true,
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                            errorText: signUpStore.emailError),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        onChanged: signUpStore.setEmail,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !signUpStore.isLoading,
                            isDense: true,
                            label: Text('Telefone'),
                            border: OutlineInputBorder(),
                            errorText: signUpStore.telefoneError),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        onChanged: signUpStore.setTelefone,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                            enabled: !signUpStore.isLoading,
                            isDense: true,
                            label: Text('Senha'),
                            border: OutlineInputBorder(),
                            errorText: signUpStore.senhaError),
                        obscureText: true,
                        onChanged: signUpStore.setSenha,
                      );
                    }),
                    SizedBox(
                      height: 16,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                          decoration: InputDecoration(
                              enabled: !signUpStore.isLoading,
                              isDense: true,
                              label: Text('Confirme a Senha'),
                              border: OutlineInputBorder(),
                              errorText: signUpStore.confirmaSenhaError),
                          obscureText: true,
                          onChanged: signUpStore.setConfirmaSenha);
                    }),
                    SizedBox(
                      height: 32,
                    ),
                    Observer(builder: (context) {
                      return ElevatedButton(
                          onPressed: signUpStore.signUpPressed,
                          child: signUpStore.isLoading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('REGISTRAR'));
                    }),
                    Divider(
                      color: Theme.of(context).primaryColorLight,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: Navigator.of(context).pop,
                        child: Text(
                          'Já tenho uma conta. ENTRAR',
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
