import 'package:online_learning_app/export.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            BottomNavigationItem(
              index: 0,
              imgUrl: 'assets/home_filled.png',
            ),
            BottomNavigationItem(
              index: 1,
              imgUrl: 'assets/menu_filled.png',
            ),
            BottomNavigationItem(
              index: 2,
              imgUrl: 'assets/chart_filled.png',
            ),
            BottomNavigationItem(
              index: 3,
              imgUrl: 'assets/settings_filled.png',
            ),
          ],
        ),
      ),
    );
  }
}
