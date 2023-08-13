import 'package:flutter/material.dart';

class UpdateBinPage extends StatefulWidget {
  const UpdateBinPage({Key? key}) : super(key: key);

  @override
  _UpdateBinPageState createState() => _UpdateBinPageState();
}

class _UpdateBinPageState extends State<UpdateBinPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _routeDescriptionController = TextEditingController();
  TextEditingController _wasteTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Bin'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _areaController,
                decoration: InputDecoration(
                  labelText: 'Area',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an area';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _landmarkController,
                decoration: InputDecoration(
                  labelText: 'Landmark',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a landmark';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _routeDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Route Description',
                ),
                maxLines: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a route description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _wasteTypeController,
                decoration: InputDecoration(
                  labelText: 'Waste Type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a waste type';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform update bin logic here
                  }
                },
                child: Text('Update Bin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
