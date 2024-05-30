import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: _isExpanded ? widget.text : widget.text.substring(0, 252),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              if (!_isExpanded && widget.text.length > 247)
                const TextSpan(
                  text: '...',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              TextSpan(
                text: _isExpanded ? ' Read less' : ' Read more',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
