import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';
const apiKey = '1c01f6791071b19d714b374a09eef4d2';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var lat, lon;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var decodedData = await WeatherModel().getWeather();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(dData: decodedData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A3C50),
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
