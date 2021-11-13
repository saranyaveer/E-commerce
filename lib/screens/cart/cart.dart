import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/screens/cart/cart_controller.dart';
import 'package:sample_project/themes/app_colors.dart';

class CartPage extends GetView<CartController> {
  const CartPage({Key? key}) : super(key: key);
  //var cartData;
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "lib/assets/images/cart.jpg",
            color: Appcolors.appPink,
            width: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "lib/assets/images/cart.jpg",
            color: Appcolors.appPink,
            width: 30,
          ),
        ),
      ],
    );
  }

  Widget buildSignleBag(String img, String title, String price, String category,
      String quantity, double height, double width, double amount) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: 180, //height,
          child: Column(
            children: [
              Expanded(
                // flex: 2,
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0.2,
                                  blurRadius: 5.0)
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                img,
                                // "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                              ),
                              // ""),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Appcolors.appPink,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              category,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Appcolors.appPink,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Text(
                                    "\$: " + price,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Appcolors.appPink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: IconButton(
                                              onPressed: () {
                                                //  minus = !minus;
                                                //  controller.quantitySum--;
                                              },
                                              icon: const Icon(Icons.remove)),
                                        ),
                                        Flexible(
                                            child: Text(quantity
                                                // controller
                                                //   .quantitySum
                                                //   .toString()
                                                )),
                                        Flexible(
                                          child: IconButton(
                                              onPressed: () {
                                                //controller.quantitySum++;
                                                //  add = !add;
                                              },
                                              icon: const Icon(Icons.add)),
                                        )
                                      ],
                                    )

                                    // controller.quantitySum =
                                    //     controller.quantitySum +
                                    //         (int.parse(quantity));

                                    )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    CartController item = Get.find();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Obx(() {
            // for (var item in onlyCartDetails[0].products) {
            //   totalAmount = totalAmount + (item.quantity * );
            // }
            if (item.isLoading.value == false) {
              return const Center(child: CircularProgressIndicator());
            } else {
              double orderAmount = 0;
              return ListView.builder(
                  itemCount: item.productCartList.length,
                  itemBuilder: (context, index) {
                    var quantity;
                    //=  controller.quantitySum +item.cartList.value[0].products[index].quantity;
                    return Card(
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: height / 5,
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 0.2,
                                          blurRadius: 5.0)
                                    ],
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        item.productCartList[index].image
                                            .toString(),
                                        // "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"
                                      ),
                                      // ""),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    item.productCartList[index].title
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Appcolors.appPink,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    item.productCartList[index].category
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Appcolors.appPink,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "\$: " +
                                            item.productCartList[index].price
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Appcolors.appPink,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Obx(() {
                                        // bool add = false;
                                        // bool minus = false;
                                        // controller.quantitySum =
                                        //     controller.quantitySum +
                                        //         (int.parse(quantity));
                                        if (controller.isLoading.value ==
                                            false) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else {
                                          return Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    var quantityMinus = item
                                                        .productCartitems
                                                        .value[0]
                                                        .products[index]
                                                        .quantity;
                                                    quantityMinus--;
                                                    controller.productCartitems
                                                        .update((val) {
                                                      val![0]
                                                              .products[index]
                                                              .quantity =
                                                          quantityMinus;
                                                    });
                                                    //  controller.ProductCartitems.

                                                    // item.quantitySum.value = item
                                                    //     .ProductCartitems
                                                    //     .value[0]
                                                    //     .products[index]
                                                    //     .quantity--;
                                                    //  minus = !minus;
                                                    //  controller.quantitySum--;
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove)),
                                              Text(item
                                                      .productCartitems
                                                      .value[0]
                                                      .products[index]
                                                      .quantity
                                                      .toString()

                                                  // item.cartList.value[0]
                                                  //       .products[index].quantity
                                                  //       .toString()
                                                  // controller
                                                  //   .quantitySum
                                                  //   .toString()
                                                  ),
                                              IconButton(
                                                  onPressed: () {
                                                    var quantityMinus = item
                                                        .productCartitems
                                                        .value[0]
                                                        .products[index]
                                                        .quantity;
                                                    quantityMinus++;
                                                    controller.productCartitems
                                                        .update((val) {
                                                      val![0]
                                                              .products[index]
                                                              .quantity =
                                                          quantityMinus;
                                                    });

                                                    // item.quantitySum.value = item
                                                    //     .ProductCartitems
                                                    //     .value[0]
                                                    //     .products[index]
                                                    //     .quantity++;
                                                    //controller.quantitySum++;
                                                    //  add = !add;
                                                  },
                                                  icon: const Icon(Icons.add))
                                            ],
                                          );
                                        }
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

                    //  buildSignleBag(
                    //     item.productCartList[index].image.toString(),
                    //     item.productCartList[index].title.toString(),
                    //     item.productCartList[index].price.toString(),
                    //     item.productCartList[index].category.toString(),
                    //     item.cartList.value[0].products[index].quantity
                    //         .toString(),
                    //     height / 6,
                    //     width,
                    //     orderAmount);
                  });
            }
          }),
        ),
        SizedBox(
            height: height / 8,
            width: width, //- 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Obx(() {
                  if (item.isLoading.value == false) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Flexible(
                              child: Text(
                                "TOTAL AMOUNT:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        Flexible(child: Obx(() {
                          final ress = controller.productCartList();
                          final productCart = controller.productCartitems();
                          var totalAmounts = 0.0;
                          for (var item in ress) {
                            for (var items in productCart) {
                              for (var prod in items.products) {
                                if (item.id == prod.productId) {
                                  totalAmounts += (item.price! * prod.quantity);

                                  controller.totalAmount.value = totalAmounts;
                                }
                              }
                            }
                            // totalAmounts += (item.price!);
                            // totalAmount.value = totalAmounts;
                          }
                          // bool add = false;
                          // bool minus = false;
                          // controller.quantitySum =
                          //     controller.quantitySum +
                          //         (int.parse(quantity));
                          if (controller.isLoading.value == false) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return Text(
                                "\$ " + controller.totalAmount.value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15));
                          }
                        }))
                      ],
                    );
                  }
                })),
                Container(
                  padding: const EdgeInsets.all(4),
                  margin: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3.0,
                            blurRadius: 5.0)
                      ],
                      color: Colors.pinkAccent),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed('/payment');
                        // Flushbar(
                        //   duration: const Duration(seconds: 3),
                        //   margin: const EdgeInsets.all(8),
                        //   padding: const EdgeInsets.all(10),
                        //   // borderRadius: 8,
                        //   backgroundGradient: LinearGradient(
                        //     colors: [
                        //       Colors.green.shade800,
                        //       Colors.greenAccent.shade700
                        //     ],
                        //     stops: const [0.6, 1],
                        //   ),
                        //   boxShadows: const [
                        //     BoxShadow(
                        //       color: Colors.black45,
                        //       offset: Offset(3, 3),
                        //       blurRadius: 3,
                        //     ),
                        //   ],
                        //   // All of the previous Flushbars could be dismissed by swiping down
                        //   // now we want to swipe to the sides
                        //   dismissDirection:
                        //       FlushbarDismissDirection.HORIZONTAL,
                        //   // The default curve is Curves.easeOut
                        //   forwardAnimationCurve:
                        //       Curves.fastLinearToSlowEaseIn,
                        //   title: 'This is a customized Snackar',
                        //   message: 'Try it now ',
                        // );
                      },
                      child: const Text(
                        "Pay Now",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ))
      ],
    ));
  }
}
