import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  final Color colorActive;
  final Function(Color) onColorChanged;

  const ContainerWidget(
      {super.key, required this.colorActive, required this.onColorChanged});

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          widget.onColorChanged(widget.colorActive); // Access using widget.
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.colorActive == Colors.red
                  ? widget.colorActive
                  : Colors.black, // Change color based on state
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 100,
          height: 100,
          margin: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
