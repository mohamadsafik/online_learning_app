import '../../export.dart';

class AuthorHomeScreen extends StatelessWidget {
  const AuthorHomeScreen({super.key});

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
