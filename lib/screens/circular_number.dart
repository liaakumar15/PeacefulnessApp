import 'package:flutter/material.dart';

class CircularNumberButton extends StatefulWidget {
  final int number;
  final ValueChanged<bool> onPressed;

  // ignore: use_key_in_widget_constructors
  const CircularNumberButton({required this.number, required this.onPressed});

  @override
  // ignore: library_private_types_in_public_api
  _CircularNumberButtonState createState() => _CircularNumberButtonState();
}

class _CircularNumberButtonState extends State<CircularNumberButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onPressed(isSelected);
      },
      shape: const CircleBorder(),
      fillColor: isSelected ? const Color.fromRGBO(139, 186, 235, 1) : const Color.fromRGBO(235, 182, 137, 1),
      constraints: const BoxConstraints.tightFor(width: 40.0, height: 40.0),
      child: Text(
        widget.number.toString(),
        style: const TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );
  }
}
