import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tasbihapp/core/getx/homescreenget.dart';

class MyAlertDialog extends StatefulWidget {
  final Function(String) onvalueEntered;
  final HomeScreenController homeScreenController;

  MyAlertDialog({
    required this.onvalueEntered,
    required this.homeScreenController,
  });
  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Please enter a value',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(7)

                ],
                
                // maxLength: 5,
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter value',
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle the value entered by the user
                    String value = _textEditingController.text;
                    widget.onvalueEntered(value);
                    widget.homeScreenController.saveReminder(value);

                    print('Entered value: $value');
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
