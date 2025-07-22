import 'package:evently/ui/home/home_screen.dart';
import 'package:evently/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';

void ShowMyDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("تنبيه"),
        content: Text("هل تريد الذهاب للصفحة التانية؟"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(dialogContext).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
        ],
      );
    },
  );
}
