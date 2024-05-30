import 'package:flutter/material.dart';

class Apbar extends StatelessWidget {
  const Apbar({
    super.key,
    required this.isCollapsed,
  });

  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          'assets/weeknd.png',
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Container(
                color: Colors.black87,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            color: const Color.fromRGBO(195, 36, 34, 1),
            height: 66,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (isCollapsed)
                      Padding(
                        padding: const EdgeInsets.only(right: 13),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(17),
                          child: Container(
                            color: Colors.white10,
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    if (isCollapsed)
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/weeknd.png'),
                        radius: 20,
                      ),
                    // if (isCollapsed) const SizedBox(width: 10),
                    const Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "The Weeknd",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Community • +11K Members',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                if (!isCollapsed)
                  Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(9.0),
                          bottomRight: Radius.circular(9.0),
                          topLeft: Radius.circular(9.0),
                          bottomLeft: Radius.circular(9.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                        size: 18,
                      )),
                if (isCollapsed)
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.link),
                                title: const Text('Invite',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                onTap: () => {},
                              ),
                              ListTile(
                                leading:
                                    const Icon(Icons.person_add_alt_rounded),
                                title: const Text('Add Member',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                onTap: () => {},
                              ),
                              ListTile(
                                leading: const Icon(Icons.group_add_sharp),
                                title: const Text(
                                  'Add Group',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                onTap: () => {},
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Container(
                        color: Colors.white10,
                        child: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
