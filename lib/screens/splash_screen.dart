import 'package:online_learning_app/bloc/auth/check_login/check_login_bloc.dart';
import 'package:online_learning_app/export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<CheckLoginBloc>().add(CheckUserLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckLoginBloc, CheckLoginState>(
      listener: (context, state) {
        if (state is CheckLoginSuccess) {
          if (state.data.role == 'ADMIN') {
            Timer(
              const Duration(
                seconds: 3,
              ),
              () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/admin-main', (route) => false);
              },
            );
          } else if (state.data.role == 'AUTHOR') {
            Timer(
                const Duration(
                  seconds: 3,
                ), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/author-main', (route) => false);
            });
          } else {
            Timer(
                const Duration(
                  seconds: 3,
                ), () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            });
          }
        } else if (state is CheckLoginError) {
          Timer(
              const Duration(
                seconds: 3,
              ), () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/auth', (route) => false);
          });
        }
      },
      child: CustomSplashScreen(
        logo: 'assets/logo.png',
        size: 120,
        // title: 'Ini Title',
        spacing: 10,
        fontWeight: semibold,
        fontSize: 22,
        backgroundColor: kBackgroundColor,
      ),
    );
  }
}
