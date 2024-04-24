import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  final Function(String) onvalueEntered;

  MyAlertDialog({
    required this.onvalueEntered,

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
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please enter a value',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter value',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle the value entered by the user
                    String value = _textEditingController.text;
                    widget.onvalueEntered(value);
                    
                    print('Entered value: $value');
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
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


