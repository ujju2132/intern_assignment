import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern/widgets/appbar.dart';
import 'package:intern/widgets/horizontal_list.dart';
import 'package:intern/widgets/list.dart';
import 'package:intern/widgets/outdoor.dart';
import 'package:intern/widgets/readmore.dart';
import 'package:intern/widgets/searchbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrolling App Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollableAppBar(),
    );
  }
}

class ScrollableAppBar extends StatefulWidget {
  @override
  _ScrollableAppBarState createState() => _ScrollableAppBarState();
}

class _ScrollableAppBarState extends State<ScrollableAppBar> {
  late ScrollController _scrollController;
  bool _showTitle = false;
  double _previousScrollOffset = 0.0;
  bool value = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double currentScrollOffset = _scrollController.offset;
    if (currentScrollOffset > _previousScrollOffset) {
      setState(() {
        _showTitle = true;
      });
    } else if (currentScrollOffset < _previousScrollOffset) {
      setState(() {
        _showTitle = false;
      });
    }
    _previousScrollOffset = currentScrollOffset;
  }

  void _scrollToSearchBar() {
    // Calculate the height of the collapsed app bar (toolbar height + status bar height)
    final double collapsedAppBarHeight = kToolbarHeight + MediaQuery.of(context).padding.top;

    // Get the height of the status bar
    final double statusBarHeight = MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom;

    // Calculate the height of the screen below the collapsed AppBar
    final double screenHeight = MediaQuery.of(context).size.height;
    final double bodyHeight = screenHeight - collapsedAppBarHeight - statusBarHeight;
    final searchBarOffset = bodyHeight;
    
    _scrollController.animateTo(
      searchBarOffset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 270.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final double top = constraints.biggest.height;
                  final bool isCollapsed = top <=
                      kToolbarHeight + MediaQuery.of(context).padding.top;

                  return Apbar(isCollapsed: isCollapsed);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ExpandableText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper amet, consectetur adipiscing elit. Sed euismod vestibulum lacus, nec consequat nulla efficitur sit amet. Proin eu lorem libero. Sed id enim in urna tincidunt sodales. Vivamus vel semper amet.',
                    ),
                  ),
                  ExpandableOutdoorRow(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Media, docs and links',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, bottom: 20),
                    child: HorizontalImageList(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 5, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Mute notification',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        CupertinoSwitch(
                          activeColor: Colors.pink,
                          thumbColor: Colors.grey[400],
                          trackColor: Colors.grey[120],
                          value: value,
                          onChanged: (newValue) {
                            setState(() {
                              value = newValue;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.delete_outlined),
                        title: const Text(
                          'Clear Chat',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {},
                      ),
                      ListTile(
                        leading: const Icon(Icons.lock_outline_rounded),
                        title: const Text(
                          'Encryption',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {}, // Add your functionality
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.red),
                        title: const Text(
                          'Exit community',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {}, // Add your functionality
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.thumb_down_off_alt_sharp,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Report',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        onTap: () => {},
                      ),
                      Searchbar(scroll: _scrollToSearchBar)
                    ],
                  )
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0)
                    return CustomList(
                      key: ValueKey(index),
                      value: true,
                    );
                  return CustomList(key: ValueKey(index));
                },
                childCount: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
