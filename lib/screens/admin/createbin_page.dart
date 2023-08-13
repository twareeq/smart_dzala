import 'package:flutter/material.dart';

class CreateBinPage extends StatefulWidget {
  const CreateBinPage({Key? key}) : super(key: key);

  @override
  _CreateBinPageState createState() => _CreateBinPageState();
}

class _CreateBinPageState extends State<CreateBinPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _areaController = TextEditingController();
  TextEditingController _locationLinkController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _routeDescriptionController = TextEditingController();
  TextEditingController _wasteTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Bin'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                controller: _locationLinkController,
                decoration: InputDecoration(
                  labelText: 'Location Link',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location link';
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
                maxLines: 8, // Set the maximum lines for the text field
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
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform bin creation logic here
                    String username = _usernameController.text;
                    String area = _areaController.text;
                    String locationLink = _locationLinkController.text;
                    String landmark = _landmarkController.text;
                    String routeDescription = _routeDescriptionController.text;
                    String wasteType = _wasteTypeController.text;

                    // TODO: Add logic to create a bin using the entered data

                    // Reset the form
                    _formKey.currentState!.reset();
                    _usernameController.clear();
                    _areaController.clear();
                    _locationLinkController.clear();
                    _landmarkController.clear();
                    _routeDescriptionController.clear();
                    _wasteTypeController.clear();

                    // Show a success message or navigate to another page
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Bin created successfully')),
                    );
                  }
                },
                child: Text('Create Bin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
