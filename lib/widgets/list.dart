import 'package:flutter/material.dart';

class CustomList extends StatefulWidget {
  final bool value;

  const CustomList({
    Key? key,
    this.value = false,
  }) : super(key: key);

  @override
  _CustomListState createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  late bool isFollowing;

  @override
  void initState() {
    super.initState();
    // Initialize isFollowing with the value from the widget
    isFollowing = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: const Text(
        '29, India',
        style: TextStyle(
          color: Color.fromRGBO(73, 73, 73, 1),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      title: const Text(
        'Yashika',
        style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: const CircleAvatar(
        radius: 20.5,
        backgroundImage: AssetImage('assets/girl.png'),
      ),
      trailing: Container(
        width: 101,
        height: 38,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              isFollowing = !isFollowing; // Toggle isFollowing
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isFollowing ? Colors.grey : Colors.pink,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.fromLTRB(19, 11, 19, 11),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Center(
            child: Text(
              isFollowing ? 'Following' : 'Add',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
