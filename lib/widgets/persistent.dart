import 'package:flutter/cupertino.dart';
import 'package:online_learning_app/screens/user/user_explore_screen.dart';
import '../export.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.arguments}) : super(key: key);
  final Map<String, String> arguments;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> _buildScreens() {
    return [
      HomeScreen(arguments: widget.arguments),
      ExploreScreen(arguments: widget.arguments),
      SettingsScreen(arguments: widget.arguments),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.house),
        title: "Home",
        activeColorPrimary: kWhiteColor,
        activeColorSecondary: kBlackColor,
        inactiveColorPrimary: kGreyColor,
        iconSize: 18,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.compass),
        title: "Jelajah",
        activeColorPrimary: kWhiteColor,
        activeColorSecondary: kBlackColor,
        inactiveColorPrimary: kGreyColor,
        iconSize: 18,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.settings),
        title: "Pengaturan",
        activeColorPrimary: kWhiteColor,
        activeColorSecondary: kBlackColor,
        inactiveColorPrimary: kGreyColor,
        iconSize: 18,
      ),
    ];
  }

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
