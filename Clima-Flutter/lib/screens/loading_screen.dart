import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {

    var weatherData = await WeatherModel().getWeatherInfo();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherLocation: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          duration: const Duration(milliseconds: 2400),
          color: Colors.white30,
          size: 100,
        ),
      ),
    );
  }
}
