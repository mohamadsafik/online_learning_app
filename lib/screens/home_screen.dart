import 'package:online_learning_app/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Ini adalah Home',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
