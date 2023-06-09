import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final String tab1;
  final String tab2;
  final Color selectedColor;
  final Color selectedLabelColor;
  final Color unselectedLabelColor;
  final Color unselectedColor;
  final Widget tab1Content;
  final Widget tab2Content;
  final EdgeInsets padding;
  final double borderRadius;
  final TextStyle unselectedLabelStyle;
  final TextStyle selectedLabelStyle;

  const CustomTabBar({
    required this.tab1,
    required this.tab2,
    required this.tab1Content,
    required this.tab2Content,
    this.unselectedLabelStyle = const TextStyle(fontWeight: FontWeight.w400),
    this.selectedLabelStyle = const TextStyle(fontWeight: FontWeight.w700),
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(12),
    this.selectedColor = Colors.purple,
    this.unselectedColor = Colors.black12,
    this.selectedLabelColor = Colors.white,
    this.unselectedLabelColor = Colors.black,
    super.key,
  });

  @override
  CustomTabBarState createState() => CustomTabBarState();
}

class CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: widget.padding,
          child: Column(
            children: [
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: widget.unselectedColor,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
                child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: widget.selectedColor,
                  ),
                  labelColor: widget.selectedLabelColor,
                  unselectedLabelColor: widget.unselectedLabelColor,
                  labelStyle: widget.selectedLabelStyle,
                  unselectedLabelStyle: widget.unselectedLabelStyle,
                  tabs: [
                    // first tab [you can add an icon using the icon property]
                    Tab(text: widget.tab1),
                    // second tab [you can add an icon using the icon property]
                    Tab(text: widget.tab2),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Tab1 Content Here
                    widget.tab1Content,
                    // Tab2 Content Here
                    widget.tab2Content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
