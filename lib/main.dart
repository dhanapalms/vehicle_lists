import 'package:flutter/material.dart';
import 'package:turbo_care/bloc/vehicle_bloc.dart';
import 'package:turbo_care/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VehicleBloc>(
      create: (_) => VehicleBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Turbo Care'),
        debugShowCheckedModeBanner: false,
        routes: {
          //'/': (context) => MyHomePage(),
        },
      ),
    );
  }
}
