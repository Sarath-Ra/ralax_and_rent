import 'package:flutter/material.dart';
import 'package:ralax_and_rent/forms/rent_form.dart';

class RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  // Initialize a variable to hold the selected option
  String _selectedOption = 'Rent';

  void createForm() {
    if (_selectedOption == 'Rent') {
      RentForm();
    } else {
      Center(
        child: Text("Hello"),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Rent option
          GestureDetector(
            onTap: createForm,
            child: Radio(
              value: 'Rent',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
                createForm();
              },
            ),
          ),
          Text('Rent'),
          SizedBox(width: 20),
          // Sale option
          GestureDetector(
            onTap: createForm,
            child: Radio(
              value: 'Sale',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
          ),
          Text('Sale'),
        ],
      ),
    );
  }
}
