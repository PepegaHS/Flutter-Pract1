import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/template_catalog_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const FigmaTemplatesApp());
}

class FigmaTemplatesApp extends StatelessWidget {
  const FigmaTemplatesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Figma Templates',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF546BF5),
          primary: const Color(0xFF546BF5),
          surface: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const TemplateCatalogScreen(),
    );
  }
}
