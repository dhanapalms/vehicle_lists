import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_care/bloc/vehicle_bloc.dart';
import 'package:turbo_care/screens/new_vehicle.dart';

class VehiclesList extends StatefulWidget {
  @override
  _VehiclesListState createState() => _VehiclesListState();
}

class _VehiclesListState extends State<VehiclesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicles'),
        backgroundColor: Colors.purple[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Consumer<VehicleBloc>(
        builder: (_, myVehicles, child) => ListView.builder(
          itemBuilder: (context, index) {
            var vehicle = myVehicles.getVehicles[index];
            var len = myVehicles.getVehicles.length;
            return (len != 0)
                ? ListTile(
                    title: Text(vehicle.model),
                  )
                : Text('No Vehicles added yet!');
          },
          itemCount: myVehicles.getVehicles.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateVehicle()));
        },
        tooltip: 'Add',
        backgroundColor: Colors.purple[900],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
