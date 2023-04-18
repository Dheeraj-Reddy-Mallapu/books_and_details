import 'package:books_and_details/screens/books_and_details.dart';
import 'package:books_and_details/screens/favourites.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'color_scheme.dart/color_schemes.g.dart';
import 'color_scheme.dart/custom_color.g.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';
import 'services/google_signin.dart';
import 'widget_tree.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: ((ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }

        return ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: GetMaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: lightScheme,
              extensions: [lightCustomColors],
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: darkScheme,
              extensions: [darkCustomColors],
            ),
            home: const WidgetTree(),
            getPages: [
              GetPage(name: '/HomeScreen', page: () => const HomeScreen()),
              GetPage(name: '/BooksAndDetails', page: () => const BooksAnsDetails()),
              GetPage(name: '/Favourites', page: () => const Favourites()),
            ],
          ),
        );
      }),
    );
  }
}
