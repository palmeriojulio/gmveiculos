import 'package:flutter/material.dart';
import 'package:gmveiculos/screens/login_screen.dart';
import 'add_vehicle_screen.dart';
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
        title: const Text('Meus Veículos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (ctx) => const LoginScreen()),
            ),
          )
        ],
      ),
      body: VehicleList(vehicles: _vehicles),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => AddVehicleScreen(onVehicleAdded: _addVehicle),
          ),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
