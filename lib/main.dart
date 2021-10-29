import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart';
import 'package:sample_project/providers/products_provider.dart';
import 'package:sample_project/repository/products_repository.dart';
import 'package:sample_project/routes/routes.dart';
import 'package:sample_project/screens/Splash/splash.dart';
import 'package:sample_project/screens/example/bottombar.dart';
import 'package:sample_project/screens/example/listpage.dart';
import 'package:sample_project/widgets/container_widget.dart';
import 'package:google_fonts/google_fonts.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.widgets_rounded,
            color: Color.fromRGBO(255, 146, 146, 1),
          ),
          onPressed: () {},
        ),
        title: const Text('Profile',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 20.0,
              color: Color(0xFF545D68),
            )),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person_pin, color: Appcolors.appPink),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 2, bottom: 15, left: 15, right: 15),
        children: <Widget>[
          const SizedBox(height: 15.0),
          Card(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.search),
              title: TextFormField(
                //  controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
                // onChanged: onSearchTextChanged,
              ),
              trailing: IconButton(
                splashRadius: 23,
                //iconSize: 15,
                splashColor: Appcolors.shadowColor, tooltip: "filter",
                icon: const Icon(
                  Icons.format_list_bulleted_rounded,
                  color: Appcolors.appPink,
                ),
                onPressed: () {
                  // controller.clear();
                  //  onSearchTextChanged('');
                },
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Center(
            child: Container(
              height: 150,
              // width: 350,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    transform: GradientRotation(38.4 / 2),
                    colors: [
                      Appcolors.appPink,
                      Appcolors.tabBarColor,
                      Appcolors.appPink
                    ]),
                color: const Color.fromRGBO(255, 146, 146, 1),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(255, 146, 146, 0.2),
                      //Colors.blue.withOpacity(0.2),
                      offset: Offset(0, 20),
                      blurRadius: 3,
                      spreadRadius: -10)
                ],
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: Appcolors.tabBarColor,
              ),

              /// indicatorColor: Appcolors.appPink,
              labelColor: const Color.fromRGBO(255, 146, 146, 1),
              isScrollable: true,
              labelPadding: const EdgeInsets.only(left: 40, right: 40),
              unselectedLabelColor: const Color(0xFFCDCDCD),
              tabs: [
                Tab(child: Containers().customContainer("All")),
                Tab(child: Containers().customContainer("Popular")),
                Tab(child: Containers().customContainer("Recent")),
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: const [
                CookiePage(),
                CookiePage(),
                CookiePage(),
              ]))
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor:
      //       const Color.fromRGBO(255, 146, 146, 1), //const Color(0xFFF17532),
      //   child: const Icon(Icons.fastfood),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomBar(),
    );
  }
}
