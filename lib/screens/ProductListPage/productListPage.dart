// // ignore_for_file: file_names

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sample_project/screens/ProductListPage/product_controller.dart';

// class UserListGetX extends GetView<ProductController> {
//   const UserListGetX({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Movies with GetX"),
//       ),
//       body: Column(
//         children: [
//           Obx(() {
//             final status = controller.pageStatus;
//             if (status == PageStatus.error) {
//               return Center(
//                 child: Column(
//                   children: [
//                     Text(controller.errorMessage!),
//                     ElevatedButton(
//                         onPressed: () {},

//                         /// controller.getMovieLists,
//                         child: const Text(
//                             "Again press the button to get correct url"))
//                   ],
//                 ),
//               );
//             }
//             return const SizedBox(
//               width: 10,
//               height: 10,
//             );
//           }),
//           Expanded(
//             child: Obx(() {
//               final status = controller.pageStatus;
//               if (status == PageStatus.none) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Text("No data here..."),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                           onPressed: controller.getMoviessLists,
//                           child: const Text("Again press the button to retry")),
//                     )
//                   ],
//                 );
//               }

//               if (status == PageStatus.loading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }

//               if (status == PageStatus.success) {
//                 final item = controller.produList;
//                 return ListView.builder(
//                     itemCount: item.length,
//                     itemBuilder: (context, index) => Card(
//                           child: ListTile(
//                             title: Text(item[index].category.toString()),
//                           ),
//                         ));
//               }
//               return const SizedBox();
//             }),
//           )
//         ],
//       ),
//     );
//   }
// }
