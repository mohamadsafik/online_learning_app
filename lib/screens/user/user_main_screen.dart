import 'package:online_learning_app/export.dart';

class UserMainScreen extends StatelessWidget {
  const UserMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return HomeScreen();
        case 1:
          return HomeScreen();
        case 2:
          return HomeScreen();
        case 3:
          return const ProfileScreen();
        default:
          return HomeScreen();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                buildContent(currentIndex),
                const CustomBottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
