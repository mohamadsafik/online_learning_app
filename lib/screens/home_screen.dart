import 'package:online_learning_app/export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              AuthService().logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 5),
                behavior: SnackBarBehavior.floating,
                backgroundColor: kGreenColor,
                content: Row(
                  children: [
                    const Icon(Icons.beenhere_rounded, color: Colors.white),
                    const SizedBox(width: 12),
                    Text(
                      'Logout succesful!',
                      style: whiteTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
            Navigator.pushNamed(context, '/auth');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                behavior: SnackBarBehavior.floating,
                backgroundColor: kRedColor,
                content: Row(
                  children: [
                    const Icon(Icons.beenhere_rounded, color: Colors.white),
                    const SizedBox(width: 12),
                    Text(state.message!),
                  ],
                ),
              ),
            );
          } else {
            const CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Text(
                'Ini adalah Home',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
