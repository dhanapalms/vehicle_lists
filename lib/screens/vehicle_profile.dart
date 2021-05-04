import 'package:flutter/material.dart';
import 'package:turbo_care/screens/vehicles_list.dart';

class VehicleProfile extends StatelessWidget {
  final String vehicleNo;
  final String wheeler;
  final String make;
  final String model;
  final String fuelType;
  final String transmission;

  VehicleProfile(
      {this.vehicleNo,
      this.wheeler,
      this.make,
      this.model,
      this.fuelType,
      this.transmission});
  @override
  Widget build(BuildContext context) {
    print('DETAILS COLLECTED');
    print(vehicleNo + wheeler + make + model + fuelType + transmission);
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(Icons.home),
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => VehiclesList()),
                (route) => false),
          ),
        ],
        backgroundColor: Colors.purple[900],
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.35),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 18, bottom: 18.0),
            child: Column(
              children: [
                Text(
                  'CIVIC',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  vehicleNo,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
          ),
        ),
        //actions: [Text('CIVIC ')],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsWidget('MAKE', make),
              detailsWidget('MODEL', model)
            ],
          ),
          SizedBox(
            height: 18.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsWidget('FUEL TYPE', fuelType),
              detailsWidget('TRANSMISSION', transmission)
            ],
          ),
        ],
      ),
    );
  }

  Widget detailsWidget(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
        ),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        )
      ],
    );
  }
}
