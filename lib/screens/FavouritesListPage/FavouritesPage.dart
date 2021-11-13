// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sample_project/screens/ProductListPage/product_controller.dart';
import 'package:sample_project/themes/app_colors.dart';

class FavouritesPage extends GetView<ProductController> {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController item = Get.find();
    return Column(
      children: [
        Expanded(
          child: Obx(() {
            if (item.isLoading.value == false) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  shrinkWrap: true,
                  primary: true,
                  //  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: item.produList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        buildGridTile(
                          item.produList[index].title.toString(),
                          item.produList[index].price.toString(),
                          item.produList[index].image.toString(),
                          item.produList[index].id.toString(),
                          //  item.getSingleProduct(item.produList[index].id.toString(),)
                        )
                      ],
                    );
                  });
            }
          }),
        )
      ],
    );
  }

  Widget buildGridTile(
    String name,
    String price,
    String imgPath,
    String id,
  ) {
    return InkWell(
      onTap: () {
        // Get.toNamed('/singleproductlistpage');
        // controller.getSingleProduct(id);
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
                        price,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.favorite_border_rounded,
                        color: Appcolors.appPink,
                      )
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
