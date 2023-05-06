import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class NoInternetWidget extends StatelessWidget {
  dynamic onPressed;
   NoInternetWidget({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: Container(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                    height: 120.h,
                    width: 120.w,
                    "assets/images/internet.json",

                    fit: BoxFit.cover),

                SizedBox(height: 30.h,),

                const Text("No internet !!!"),
                SizedBox(height: 5.h,),
                const Text("Please Check your internet connection"),
                SizedBox(height: 20.h,),

                MaterialButton(onPressed: onPressed,
                  minWidth: 150.w,
                  color: Theme.of(context).primaryColor,
                child: const Text("Try Again",style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ],
        )));
  }
}
