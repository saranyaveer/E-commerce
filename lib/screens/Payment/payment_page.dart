import 'package:flutter/material.dart';
import 'package:sample_project/themes/app_colors.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.shadowColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            // Image.network(
            //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl_b-QncCRtdxptnfC425V2Q9axK0tHQmm9g&usqp=CAU",
            //   fit: BoxFit.cover,
            // ),
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage("lib/assets/images/tick.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "PAYMENT SUCCESSFUL",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
