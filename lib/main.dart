import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/products_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/routes/routes.dart';
import 'package:sample_project/screens/Splash/splash.dart';
import 'themes/app_colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductsProvider(
          client: Client(), productRepository: ProductRepository()),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'BalsamiqSans',

          ///textTheme: GoogleFonts.pacificoTextTheme(),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Appcolors.themeColor,
              ),
        ),
        debugShowCheckedModeBanner: false,
        home: const MySplash(),
        initialRoute: '/',
        getPages: Routes.routes,
      ),
    );
  }
}
