import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sample_project/services/storage_service.dart';

class ProfileScreen extends StatelessWidget {
  Widget buildlistTileWidget({String? leading, required String trailing}) {
    return ListTile(
      tileColor: Colors.grey.withOpacity(0.2),
      leading: Text(
        leading!,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildBottomListTile(
      {required String leading, required String trailing}) {
    return ListTile(
      onTap: () {},
      tileColor: Colors.grey.withOpacity(0.2),
      leading: Text(
        leading,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Wrap(
        spacing: 5,
        children: [
          Text(
            trailing,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.grey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGluZGlhbiUyMHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    ),
                  ),
                  Text(
                    "Ankita sharma",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Mumbai",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            color: Colors.grey.withOpacity(0.2),
            child: Column(
              children: [
                buildlistTileWidget(
                    leading: "Full name", trailing: "Ankita sharma"),
                const Divider(),
                buildlistTileWidget(
                  leading: "Email",
                  trailing: "Ankitasharma123@gmail.com",
                ),
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 10),
          //   color: Colors.grey.withOpacity(0.2),
          //   child: Column(
          //     children: [
          //       const Divider(),
          //       buildBottomListTile(
          //         leading: "My bag",
          //         trailing: "3",
          //       ),
          //     ],
          //   ),
          // ),
          Container(
              margin: const EdgeInsets.all(20.0),
              child: IconButton(
                  onPressed: () {
                    StorageService().logout();
                    Get.toNamed('/login');
                  },
                  icon: const Icon(Icons.logout_rounded))

              // MyButtonWidget(
              //   color: AppColors.baseDarkPinkColor,
              //   onPress: () {},
              //   text: "Log out",
              // ),
              ),
        ],
      ),
    );
  }
}
