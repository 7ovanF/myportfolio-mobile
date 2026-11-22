import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:myportfolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";
  String _category = "Internship";
  String _thumbnail = "";
  DateTime? _startedAt; // required
  DateTime? _endedAt;

  final List<String> _categories = [
    'Internship',
    'Research',
    'Volunteer',
    'Part-Time',
    'Full-Time',
    'Freelance',
  ];

  late final List<Widget> _fields = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Experience Title",
          labelText: "Experience Title",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _title = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return "Enter a experience title.";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "Experience Description",
          labelText: "Experience Description",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _description = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return "Enter a experience description.";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: "Experience Category",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        initialValue: _category,
        items: _categories
            .map((category) => DropdownMenuItem(
                  value: category,
                  child: Text(category),
                ))
            .toList(),
        onChanged: (String? newValue) {
          setState(() {
            _category = newValue!;
          });
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Thumbnail URL (Optional)",
          labelText: "Thumbnail URL",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _thumbnail = value!;
          });
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimeFormField(
        mode: DateTimeFieldPickerMode.date,
        decoration: InputDecoration(
          hintText: "Started at date",
          labelText: "Started at",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        firstDate: DateTime(1000),
        lastDate: DateTime(5000),
        onChanged: (DateTime? value) {
          setState(() {
            _startedAt = value;
          });
        },
        validator: (DateTime? value) {
          if (value == null) {
            return "Enter a starting date.";
          }
          return null;
        },
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimeFormField(
        mode: DateTimeFieldPickerMode.date,
        decoration: InputDecoration(
          hintText: "Ended at date",
          labelText: "Ended at",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        firstDate: DateTime(1000),
        lastDate: DateTime(5000),
        onChanged: (DateTime? value) {
          setState(() {
            _endedAt = value;
          });
        },
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Experience Form',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _fields + [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Experience added successfully!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Experience Title: $_title'),
                                    Text('Description: $_description'),
                                    Text('Category: $_category'),
                                    Text('Thumbnail URL: $_thumbnail'),
                                    Text('Started at: $_startedAt'),
                                    Text('Ended at: ${_endedAt ?? "Unspecified"}'),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          ) // stairs
        )
      ),
    );
  }
}
