import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  final Function() scroll;

  const Searchbar({Key? key, required this.scroll}) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  bool _search = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      // Update the search state based on the focus state of the text field
      _search = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Row(
        children: [
          Expanded(
            child: !_search
                ? const Text(
                    'Members',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextFormField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Search members',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                      ),
                    ),
                  ),
          ),
          Visibility(
            visible: _search,
            child: TextButton(
              onPressed: () {
                // Clear focus to dismiss the keyboard
                _focusNode.unfocus();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !_search,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.grey[200],
                child: IconButton(
                  onPressed: () {
                    widget.scroll();
                    // Set focus to the text field to open the keyboard
                    FocusScope.of(context).requestFocus(_focusNode);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
