import 'package:online_learning_app/export.dart';

class MainScreen extends StatefulWidget {
  final Map<String, String> arguments;
  const MainScreen({super.key, required this.arguments});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int index) {
      switch (index) {
        case 0:
          return HomeScreen(arguments: widget.arguments);
        case 1:
          return HomeScreen(arguments: widget.arguments);
        case 2:
          return HomeScreen(arguments: widget.arguments);
        case 3:
          return SettingsScreen(arguments: widget.arguments);
        default:
          return HomeScreen(arguments: widget.arguments);
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
