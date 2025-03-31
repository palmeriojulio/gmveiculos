import 'package:flutter/material.dart';
import 'add_vehicle_screen.dart';
import 'login_screen.dart';
import 'vehicle_details_screen.dart';
import '../models/vehicle.dart';
import '../widgets/vehicle_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Vehicle> _vehicles = [];

  void _addVehicle(Vehicle newVehicle) {
    setState(() {
      _vehicles.add(newVehicle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veículos'),
        backgroundColor: const Color.fromARGB(47, 102, 127, 100),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const LoginScreen()),
            ),
          ),
        ],
      ),
      body: VehicleList(
        vehicles: _vehicles,
        onTapVehicle: (vehicle) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => VehicleDetailsScreen(vehicle: vehicle),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => AddVehicleScreen(
                    _addVehicle,
                    onVehicleAdded: (Vehicle) {},
                  )),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
