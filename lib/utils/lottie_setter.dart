import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget LottieSetter(String main) {
  switch (main.toLowerCase()) {
    case "clear":
      return Lottie.asset('assets/sunny.json',
          width: 48, height: 48, fit: BoxFit.fill);
    case "clouds":
      return Lottie.asset("assets/clouds.json",
          width: 48, height: 48, fit: BoxFit.fill);
    case "rain":
      return Lottie.asset("assets/rain.json",
          width: 48, height: 48, fit: BoxFit.fill);
    case "thunderstorm":
      return Lottie.asset("assets/thunderStorm.json",
          width: 48, height: 48, fit: BoxFit.fill);
    default:
      return Lottie.asset("assets/clouds.json",
          width: 48, height: 48, fit: BoxFit.fill);
  }
}
