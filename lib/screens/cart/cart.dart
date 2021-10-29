import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_project/screens/cart/cart_controller.dart';
import 'package:sample_project/themes/app_colors.dart';

class CartPage extends GetView<CartController> {
  CartPage({Key? key}) : super(key: key);
  var cartData;
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
        )
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
        child: Container(
          height: height,
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
                                Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.remove)),
                                        ),
                                        Flexible(child: Text(quantity)),
                                        Flexible(
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.add)),
                                        )
                                      ],
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: Container(
                    //     padding: EdgeInsets.all(10.0),
                    //     child: CircleAvatar(
                    //       radius: 25,
                    //       backgroundColor: Appcolors.appPink,
                    //       child: Icon(
                    //         Icons.check,
                    //         color: Appcolors.appPink,
                    //       ),
                    //     ),
                    //   ),
                    // )
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
        //  appBar: buildAppBar(),
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Obx(() {
            if (item.isLoading.value == false) {
              return const Center(child: CircularProgressIndicator());
            } else {
              double orderAmount = 0;
              return ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  itemCount: item.productCartList.length,
                  itemBuilder: (context, index) {
                    // item.totalAmount.value =
                    //     (item.productCartList[index].price! +
                    //         item.totalAmount.value);
                    return buildSignleBag(
                        item.productCartList[index].image.toString(),
                        item.productCartList[index].title.toString(),
                        item.productCartList[index].price.toString(),
                        item.productCartList[index].category.toString(),
                        item.cartList.value[0].products[index].quantity
                            .toString(),
                        height / 6,
                        width,
                        orderAmount);
                    //  Text(item.cartList[index].userId.toString());
                  });
            }
          }),
        ),
        Flexible(
            child: Container(
                height: height / 8,
                width: width, //- 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Column(
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
                        Flexible(
                            child: Text(
                                "\$ " + item.totalAmount.value.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)))
                      ],
                    )),
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
                          onPressed: () {},
                          child: const Text(
                            "Buy Now",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))
      ],
    )));
  }
}
