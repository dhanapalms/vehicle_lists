import 'package:flutter/material.dart';
import 'package:turbo_care/screens/vehicle_class.dart';

class CreateVehicle extends StatefulWidget {
  @override
  _CreateVehicleState createState() => _CreateVehicleState();
}

class _CreateVehicleState extends State<CreateVehicle> {
  TextEditingController _vehicle;

  @override
  void initState() {
    _vehicle = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new vehicle profile'),
        backgroundColor: Colors.purple[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VEHICLE NUMBER'),
          TextField(
            controller: _vehicle,
            decoration: InputDecoration(
              hintText: 'Enter Vehicle number here',
              border: const OutlineInputBorder(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => VehicleClass(
                        vehicleNo: _vehicle.text,
                      )));
        },
        tooltip: 'Next',
        backgroundColor: Colors.purple[900],
        child: Icon(
          Icons.chevron_right_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
