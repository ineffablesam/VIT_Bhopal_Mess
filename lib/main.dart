import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vit_mess/provider/theme_provider.dart';
import 'package:vit_mess/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider themeProvider = ThemeProvider();
  await themeProvider.initializeTheme();
  runApp(
    ChangeNotifierProvider<ThemeProvider>.value(
      value: themeProvider,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          home: const HomeScreen(),
        );
      },
    );
  }
}
