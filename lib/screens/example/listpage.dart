import 'package:flutter/material.dart';
import 'package:sample_project/themes/app_colors.dart';

import 'listdetail.dart';

class CookiePage extends StatelessWidget {
  const CookiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('pink salwar', '\$3.99',
                    'lib/assets/images/style.jpg', false, false, context),
                _buildCard('Torn jean', '\$5.99', 'lib/assets/images/style.jpg',
                    true, false, context),
                _buildCard('Women Sweatshirt', '\$1.99',
                    'lib/assets/images/style.jpg', false, true, context),
                _buildCard('Western top', '\$2.99',
                    'lib/assets/images/style.jpg', false, false, context)
              ],
            ),
          ),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CookieDetail(
                      assetPath: imgPath,
                      cookieprice: price,
                      cookiename: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? const Icon(Icons.favorite,
                                    color: Appcolors.appPink)
                                : const Icon(Icons.favorite_border,
                                    color: Appcolors.appPink)
                          ])),
                  Hero(
                      tag:
                          "https://images.unsplash.com/photo-1488716820095-cbe80883c496?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      child: Container(
                        height: 75.0,
                        width: 75.0,
                        // decoration: BoxDecoration(
                        //     image: DecorationImage(
                        //         image: AssetImage(imgPath),
                        //         fit: BoxFit.contain)
                        //         )
                        child: Image.network(
                          "https://images.unsplash.com/photo-1488716820095-cbe80883c496?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d29tYW58ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                          fit: BoxFit.cover,
                        ),
                      )),
                  const SizedBox(height: 7.0),
                  Text(price,
                      style: const TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: const TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          color: const Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              const Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              const Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              const Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              const Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              const Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}
