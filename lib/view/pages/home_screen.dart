import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_internet_connection_test/helper/internet_check_helper.dart';
import 'package:flutter_internet_connection_test/view/widgets/no_internet_widget.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<InternetCheckerHelper>(context,listen: false).checkInternetSpeed(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Internet Speed Test"),
      ),

      body: Center(
        child:
        Provider.of<InternetConnectionStatus>(context) == InternetConnectionStatus.disconnected ?
        NoInternetWidget(
        )
            :
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:   [
            Text("Internet Connection Check"),

            SizedBox(height: 30,),

            Consumer<InternetCheckerHelper>(
                builder: (context,internetCheckerHelper,child){
                  return Text("Internet Speed Test ${internetCheckerHelper.bitsPerSecond} kb");
                },
               ),

          ],
        ),
      ),

    );
  }
}
