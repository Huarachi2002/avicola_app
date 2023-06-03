import 'dart:async';

import 'package:avicola/features/auth/presentacion/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:avicola/features/shared/shared.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const name = "login-screen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          body: GeometricalBackground(
              child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            // Icon Banner
            const Icon(
              Icons.account_circle_sharp,
              color: Colors.white,
              size: 100,
            ),
            const SizedBox(height: 80),

            Container(
              height: size.height - 260, // 80 los dos sizebox y 100 el ícono
              width: double.infinity,
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(100)),
              ),
              child: const _LoginForm(),
            )
          ],
        ),
      ))),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final login_provider = context.read<LoginFormProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Form(
        key: login_provider.formKey,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text('Login', style: textStyles.titleLarge),
            const SizedBox(height: 90),

            CustomTextFormField(
              label: 'Usuario',
              keyboardType: TextInputType.text,
              onChanged: (valor) {
                login_provider.user = valor;
              },
              validator: (value) {
                if (login_provider.user.isEmpty) {
                  return "Ingrese nombre de usaurio";
                }
                return null;
              },
            ),
            const SizedBox(height: 30),

            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (valor) => login_provider.password = valor,
              validator: (value) {
                if (login_provider.password.isEmpty) {
                  return "Ingrese la contraseña";
                }
                return null;
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomFilledButton(
                  text: 'Ingresar',
                  buttonColor: Colors.black,
                  onPressed: () {
                    if (login_provider.isValidForm()) {
                      context.go('/home');
                    } else {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            Timer(Duration(seconds: 3), () {
                              Navigator.of(context).pop();
                            });
                            return AlertDialog(
                              title: const Text('Usuario Invalidado'),
                              icon: const Icon(Icons.cancel_outlined),
                              // content: const Text(
                              //     'Ex sit ea est in. Aliqua cillum amet tempor id officia tempor adipisicing amet commodo aliqua. Ut eiusmod cillum nulla sit ut non minim laboris cupidatat exercitation minim magna pariatur est. Nisi aute ea id enim sint occaecat aute adipisicing duis qui nisi. Nulla cillum nulla eiusmod enim magna sint eu dolor occaecat cupidatat.'),
                              // actions: [
                              // TextButton(
                              //     onPressed: () => context.pop(),
                              //     child: const Text('Cancelar')),
                              // FilledButton(
                              //     onPressed: () => context.pop(),
                              //     child: const Text('Aceptar')),
                              // ],
                            );
                          });
                    }
                  },
                )),

            const Spacer(flex: 2),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Text('¿No tienes cuenta?'),
            //     TextButton(
            //       onPressed: ()=> context.push('/register'),
            //       child: const Text('Crea una aquí')
            //     )
            //   ],
            // ),

            // const Spacer( flex: 1),
          ],
        ),
      ),
    );
  }
}
