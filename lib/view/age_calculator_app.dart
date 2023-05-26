// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../date_util.dart';

class AgeCalculatorView extends StatefulWidget {
  const AgeCalculatorView({super.key});

  @override
  _AgeCalculatorViewState createState() => _AgeCalculatorViewState();
}

class _AgeCalculatorViewState extends State<AgeCalculatorView> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  void _calculateAge() {
    if (_formKey.currentState!.validate()) {
      final inputFormat = DateFormat('yyyy-MM-dd');
      final dateOfBirth = inputFormat.parse(_dateController.text);
      final age = DateUtil.calculateAgeFromDate(dateOfBirth, DateTime.now());

      setState(() {
        _result = 'Your age is $age';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/calculate_your_age.png',
                    )),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth (YYYY-MM-DD)',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date of birth';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _calculateAge,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 16.0),
                Text(
                  _result,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
