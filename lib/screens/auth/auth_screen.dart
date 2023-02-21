import 'package:online_learning_app/export.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget._scaffoldKey,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomTabBar(
          padding: const EdgeInsets.all(25),
          borderRadius: 20,
          selectedColor: kPrimaryColor,
          unselectedColor: kTabColor,
          unselectedLabelColor: kGreyColor,
          tab1: 'Login',
          tab1Content: LoginScreen(),
          tab2: 'Register',
          tab2Content: RegisterScreen(),
        ),
      ),
    );
  }
}
