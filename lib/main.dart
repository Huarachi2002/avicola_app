import 'package:avicola/features/auth/presentacion/providers/login_form_provider.dart';
import 'package:provider/provider.dart';
import 'config/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginFormProvider(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: AppTheme().getTheme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
