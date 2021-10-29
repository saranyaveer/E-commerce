import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG Slider"),
      ),
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                //   margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/woman-going-shopping-in-the-city-picture-id1286350786?b=1&k=20&m=1286350786&s=170667a&w=0&h=PXKFWcXgLbdeSZFgY3RhniLUJ3tbYOAi_drWFRL-uM4="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                //  margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/cute-baby-girl-with-barefoot-jumping-on-pink-background-picture-id1268132702?b=1&k=20&m=1268132702&s=170667a&w=0&h=E1uFmItgeyaumOsz5wszjnCEcL2ifM3I3v3ihJnu3oI="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                //  margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/what-you-wear-should-make-you-feel-free-and-comfortable-picture-id1297633356?b=1&k=20&m=1297633356&s=170667a&w=0&h=JqUBNLHnDv9SXcULeGmSL3RHVFn1fOGwdsVJbGtFg0o="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                //  margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://media.istockphoto.com/photos/beautiful-woman-running-on-the-field-picture-id1287398466?b=1&k=20&m=1287398466&s=170667a&w=0&h=iQxwC29SbZxlGdWutJ1iID_--RynNLs6VbWZY6O6o-c="),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                //  margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1567967455389-e432b1ca1404?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGRyZXNzZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.easeOutSine,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 10),
              viewportFraction: 1,
            ),
          ),
        ],
      ),
    );
  }
}
