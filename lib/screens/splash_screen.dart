import 'package:online_learning_app/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(
        seconds: 5,
      ),
      () {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckLoginBloc, CheckLoginState>(
      bloc: context.read<CheckLoginBloc>()..add(CheckUserLoginEvent()),
      builder: (context, state) {
        if (state is CheckLoginSuccess) {
          if (state.user.role == 'admin') {
            return AdminHomeScreen(
              arguments: {
                "uid": state.user.uid,
                "name": state.user.name,
                "role": state.user.role,
                "email": state.user.email,
              },
            );
          } else if (state.user.role == 'author') {
            return AuthorHomeScreen(
              arguments: {
                "uid": state.user.uid,
                "name": state.user.name,
                "role": state.user.role,
                "email": state.user.email,
              },
            );
          } else {
            return MainScreen(
              arguments: {
                "uid": state.user.uid,
                "name": state.user.name,
                "role": state.user.role,
                "email": state.user.email,
              },
            );
          }
        } else if (state is CheckLoginLoading) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is CheckLoginError) {
          return AuthScreen();
        }
        return CustomSplashScreen(
          logo: 'assets/logo.png',
          size: 120,
          // title: 'Ini Title',
          spacing: 10,
          fontWeight: semibold,
          fontSize: 22,
          backgroundColor: kBackgroundColor,
        );
      },
    );
  }
}
