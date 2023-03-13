import '../../export.dart';

class AuthorHomeScreen extends StatelessWidget {
  final Map<String, String> arguments;
  const AuthorHomeScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'ini halaman home pengajar',
          ),
        ),
      ),
    );
  }
}
