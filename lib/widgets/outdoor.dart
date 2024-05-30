import 'package:flutter/material.dart';

class Outdoor extends StatelessWidget {
  final String label;

  const Outdoor({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38, // Increased height to better fit text
      width: 77, // Increased width to better fit text
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.pink),
        borderRadius: BorderRadius.all(Radius.circular(17)),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandableOutdoorRow extends StatefulWidget {
  @override
  _ExpandableOutdoorRowState createState() => _ExpandableOutdoorRowState();
}

class _ExpandableOutdoorRowState extends State<ExpandableOutdoorRow> {
  bool _expanded = false;

  void _toggleExpanded() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Outdoor(label: 'Outdoor'),
          const Outdoor(label: 'Outdoor'),
          const Outdoor(label: 'Outdoor'),
          const Outdoor(label: 'Outdoor'),
          FittedBox(
            child: GestureDetector(
              onTap: _toggleExpanded,
              child: Container(
                // height: 40,
                // width: 80,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      _expanded ? 'Outdoor' : '+1',
                      style: const TextStyle(color: Colors.pink, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
