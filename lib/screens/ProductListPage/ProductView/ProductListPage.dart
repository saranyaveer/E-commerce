// ignore_for_file: file_names

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:sample_project/repository/products_repository.dart';

import 'package:sample_project/screens/ProductListPage/product_controller.dart';
import 'package:sample_project/themes/app_colors.dart';

class CookiePage extends GetView<ProductController> {
  const CookiePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   final item = controller.produList;
    ProductController item = Get.find();
    final searchController = TextEditingController();
    bool isFavourite = false;

    return Scaffold(
        extendBody: true,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // const SizedBox(height: 5.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // const SizedBox(height: 15.0),
                    Expanded(
                      child: Card(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Obx(() {
                          if (item.isLoading.value == false) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return TextFormField(
                              controller: searchController,
                              onChanged: (value) {
                                controller.getSearchData(searchController.text);
                                //item.searchText.value = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search_rounded,
                                      color: Appcolors.appPink,
                                    )),
                                border: InputBorder.none,
                              ),
                              // onChanged: onSearchTextChanged,
                            );
                          }
                        }),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Card(
                      color: Appcolors.appPink,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10.0),
              SizedBox(
                  height: 40,
                  child: Obx(() {
                    final selected = controller.selectedIndex;

                    if (item.isLoading.value == false) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: item.categoriesListRX.length,
                          itemBuilder: (context, index) {
                            return Container(
                              //  padding: const EdgeInsets.all(4),
                              margin: const EdgeInsets.only(
                                  top: 1, bottom: 1, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 3.0,
                                        blurRadius: 5.0)
                                  ],
                                  color: Appcolors.appPink),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: TextButton(
                                      onPressed: () {
                                        selected.value = index;
                                        if (item.categoriesListRX[index]
                                                .toString() ==
                                            "All") {
                                          controller.getMoviessLists();
                                        } else {
                                          // selected.value = index;
                                          controller.getProductCategories(
                                              categoryParams: item
                                                  .categoriesListRX[index]
                                                  .toString());
                                        }
                                      },
                                      child: Text(
                                        item.categoriesListRX[index].toString(),
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                    //})
                                    ),
                              ),
                            );
                          });
                    }
                  })),
              const SizedBox(height: 10.0),
              Container(child: buildAdvertismentPlace()),
              const SizedBox(height: 10.0),
              Expanded(
                child: Obx(() {
                  // final fav= controller
                  if (item.isLoading.value == false) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return GridView.builder(
                        shrinkWrap: true,
                        primary: true,
                        //  physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: item.produList.length,
                        itemBuilder: (context, index) {
                          void onpressed() {
                            item.isFavourite.value = !item.isFavourite.value;
                          }

                          return Column(
                            children: [
                              // buildGridTile(
                              //     item.produList[index].title.toString(),
                              //     item.produList[index].price.toString(),
                              //     item.produList[index].image.toString(),
                              //     item.produList[index].id.toString(),
                              //     item.isFavourite.value
                              //     //  item.getSingleProduct(item.produList[index].id.toString(),)
                              //     )
                              InkWell(
                                onTap: () {
                                  Get.toNamed('/singleproductlistpage');
                                  controller.getSingleProduct(
                                      item.produList[index].id.toString());
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => const SingleProductViewPage()));
                                },
                                child: Container(
                                  height: 250,
                                  margin: const EdgeInsets.only(
                                      top: 0, bottom: 10, left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.transparent, //Appcolors.appPink,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 3.0,
                                          blurRadius: 5.0)
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          //  alignment: Alignment.topRight,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.transparent,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                item.produList[index].image
                                                    .toString(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              item.produList[index].title
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "\$ " +
                                                      item.produList[index]
                                                          .price
                                                          .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  width: 15,
                                                ),
                                                Obx(() {
                                                  return IconButton(
                                                      onPressed: () {
                                                        final heart = controller
                                                            .favIconList;
                                                        if (controller
                                                            .favIconList
                                                            .contains(item
                                                                .produList[
                                                                    index]
                                                                .id)) {
                                                          heart.remove(item
                                                              .produList[index]
                                                              .id);
                                                          ProductRepository()
                                                              .deleteFavProductList(
                                                                  item
                                                                      .produList[
                                                                          index]
                                                                      .id!);
                                                          //  controller.removeFavProduct(id as int);
                                                          // ProductRepository()
                                                          //     .deleteFavProductList(id as int);
                                                        } else {
                                                          heart.add(item
                                                              .produList[index]
                                                              .id);
                                                          ProductRepository()
                                                              .saveFavourite(item
                                                                  .produList[
                                                                      index]
                                                                  .id!);
                                                          //  controller.addFavouriteProduct(id as int);
                                                          //ProductRepository().saveFavourite(id as int);
                                                        }
                                                        // final isfav = controller.isFavourite.value;
                                                        // controller.isFavourite.value = !value;

                                                        //   setState(() => pressAttention = !pressAttention;
                                                      },
                                                      icon: controller
                                                              .favIconList
                                                              .contains(item
                                                                  .produList[
                                                                      index]
                                                                  .id)
                                                          ? const Icon(
                                                              Icons.favorite,
                                                              color: Appcolors
                                                                  .appPink,
                                                            )
                                                          : const Icon(
                                                              Icons
                                                                  .favorite_border_rounded,
                                                              color: Appcolors
                                                                  .appPink,
                                                            ));
                                                })
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                }),
              ),
            ],
          ),
        ));
    // bottomNavigationBar: BottomNavigatorWidget());
  }

  Widget buildAdvertismentPlace() {
    return CarouselSlider(
      items: [
        cSliderScreen(
            "https://media.istockphoto.com/photos/huge-savings-sign-lettering-picture-id477840035?b=1&k=20&m=477840035&s=170667a&w=0&h=c4WBJEPLm2XnwLHHMQKVH_KonS-yHMs9UpURJoWg_mw="),
        cSliderScreen(
            "https://media.istockphoto.com/photos/off-sales-promotion-on-retail-shop-display-window-black-friday-mega-picture-id1171892996?b=1&k=20&m=1171892996&s=170667a&w=0&h=iN02iLYOT9-8eDpYuZNxNDvJ2JG0Yg8Uwc8WxeW1EDE="),
        cSliderScreen(
            "https://media.istockphoto.com/photos/big-sale-picture-id1264709940?b=1&k=20&m=1264709940&s=170667a&w=0&h=hTypz3AFByosLM8w694Kug-LiwNMYJIBoPYsklaD5uc="),
        cSliderScreen(
            "https://images.unsplash.com/photo-1607469256872-48074e807b0a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lmdHN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
        cSliderScreen(
            "https://images.unsplash.com/photo-1567967455389-e432b1ca1404?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGRyZXNzZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
      ],

      //Slider Container properties
      options: CarouselOptions(
        height: 170.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.easeOutSine,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 10),
        viewportFraction: 1,
      ),
    );
  }

  Widget cSliderScreen(String imgUrl) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
              //color: Appcolors.shadowColor,
              color: Color.fromRGBO(255, 146, 146, 0.2),
              //Colors.blue.withOpacity(0.2),
              offset: Offset(0, 20),
              blurRadius: 4,
              spreadRadius: -10)
        ],
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildCategoryTab(String text, int index, String categoryParameter) {
    return Container(
      //  padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 1, bottom: 1, left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ],
          color: Appcolors.appPink),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextButton(
              onPressed: () {
                controller.selectedIndex.value = index;
                // selected.value = index;
                controller.getProductCategories(
                    categoryParams:
                        categoryParameter); // item.categoryList[index].toString());
              },
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            )
            //})
            ),
      ),
    );
  }

  Widget buildGridTile(
      String name, String price, String imgPath, String id, bool value
      // void Function() function
      ) {
    return InkWell(
      onTap: () {
        Get.toNamed('/singleproductlistpage');
        controller.getSingleProduct(id);
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => const SingleProductViewPage()));
      },
      child: Container(
        height: 250,
        margin: const EdgeInsets.only(top: 0, bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.transparent, //Appcolors.appPink,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                //  alignment: Alignment.topRight,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imgPath,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ " + price,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Obx(() {
                        return IconButton(
                            onPressed: () {
                              final heart = controller.favIconList;
                              if (controller.favIconList.contains(id)) {
                                heart.remove(id);
                                ProductRepository()
                                    .deleteFavProductList(id as int);
                                //  controller.removeFavProduct(id as int);
                                // ProductRepository()
                                //     .deleteFavProductList(id as int);
                              } else {
                                heart.add(id);
                                ProductRepository().saveFavourite(id as int);
                                //  controller.addFavouriteProduct(id as int);
                                //ProductRepository().saveFavourite(id as int);
                              }
                              // final isfav = controller.isFavourite.value;
                              // controller.isFavourite.value = !value;

                              //   setState(() => pressAttention = !pressAttention;
                            },
                            icon: controller.favIconList.contains(id)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Appcolors.appPink,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    color: Appcolors.appPink,
                                  ));
                      })
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
