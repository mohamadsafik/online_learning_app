import '../../export.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key, required Map<String, String> arguments});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'ini halaman home Admin',
          ),
        ),
      ),
    );
  }
}
