import 'package:flutter/material.dart';
import 'package:turbo_care/providers/api_providers.dart';
import 'package:turbo_care/screens/vehicle_fuel.dart';

class VehicleModel extends StatefulWidget {
  final String vehicleNo;
  final String wheeler;
  final String make;

  const VehicleModel({Key key, this.vehicleNo, this.wheeler, this.make})
      : super(key: key);
  @override
  _VehicleModelState createState() => _VehicleModelState();
}

class _VehicleModelState extends State<VehicleModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Model'),
        backgroundColor: Colors.purple[900],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder(
        future: ApiProviders().getVehicleModel(widget.make.toLowerCase()),
        builder: (context, AsyncSnapshot<List<String>> snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          List<String> model = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VehicleFuel(
                              make: widget.make,
                              vehicleNo: widget.vehicleNo,
                              wheeler: widget.wheeler,
                              model: model[index]
                                  .substring(1, model[index].length - 1),
                            ))),
                child: ListTile(
                  leading:
                      Text(model[index].substring(1, model[index].length - 1)),
                  trailing: Icon(Icons.keyboard_arrow_right),
                ),
              );
            },
            itemCount: model.length,
          );
        },
      ),
    );
  }
}
