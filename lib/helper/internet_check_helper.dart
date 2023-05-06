import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InternetCheckerHelper extends ChangeNotifier{

    dynamic bitsPerSecond=0;
    dynamic elapsedSeconds=0;

    checkInternetSpeed(BuildContext context) async {
    // The URL of a server that is known to respond quickly
    const url = 'https://www.google.com';

    final stopwatch = Stopwatch()..start();

    // Make an HTTP GET request to the URL
    await http.get(Uri.parse(url));

    // Stop the stopwatch and calculate the elapsed time in seconds
     elapsedSeconds = stopwatch.elapsedMilliseconds / 1000;

    // Calculate the download speed in bits per second
    bitsPerSecond = 8 * url.length / elapsedSeconds;

    // Convert the download speed to megabits per second (Mbps)
    //final speed = bitsPerSecond / 1000000;

    print("Internet Speed>>>>$bitsPerSecond kb/ps");

    if(bitsPerSecond<500){
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Your Internet is not Stable"),
          ),
        );
      });
    }


    notifyListeners();
    return bitsPerSecond;
  }

}


