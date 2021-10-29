import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  Widget buildlistTileWidget({String? leading, required String trailing}) {
    return ListTile(
      tileColor: Colors.white,
      leading: Text(
        leading!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildBottomListTile(
      {required String leading, required String trailing}) {
    return ListTile(
      onTap: () {},
      tileColor: Colors.white,
      leading: Text(
        leading,
        style: TextStyle(
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
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Icon(
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
      backgroundColor: Colors.grey,
      //appBar: buildAppBar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/originals/7b/48/65/7b48654b92587f3df86c21d7071bad42.jpg"),
                    ),
                  ),
                  Text(
                    "Aqeel Baloch",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Phong Colony ...Sui",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.white,
            child: Column(
              children: [
                buildlistTileWidget(
                    leading: "Full name", trailing: "Aqeel Baloch"),
                Divider(),
                buildlistTileWidget(
                  leading: "Email",
                  trailing: "Aqeelbaloch123@gmail.com",
                ),
                Divider(),
                buildlistTileWidget(
                  leading: "Address",
                  trailing: "123123",
                ),
                Divider(),
                buildlistTileWidget(
                  leading: "Payment",
                  trailing: "6011\t****\t****\t1117",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Column(
              children: [
                buildBottomListTile(
                  leading: "Wish-list",
                  trailing: "5",
                ),
                Divider(),
                buildBottomListTile(
                  leading: "My bag",
                  trailing: "3",
                ),
                Divider(),
                buildBottomListTile(
                  leading: "My orders",
                  trailing: "1 in transit",
                ),
              ],
            ),
          ),
          Container(margin: EdgeInsets.all(20.0), child: Icon(Icons.logout)

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
