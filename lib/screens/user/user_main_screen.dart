import 'package:online_learning_app/export.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return HomeScreen();
        case 1:
        // return HomeScreen();
        case 2:
        // return HomeScreen();
        case 3:
          return SettingsScreen();
        default:
          return HomeScreen();
      }
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                buildContent(state),
                const CustomBottomNavigation(),
              ],
            ),
          ),
        );
      },
    );
  }
}
