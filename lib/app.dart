import 'package:online_learning_app/widgets/persistent.dart';

import 'export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(),
        ),
        BlocProvider(
          create: (context) => CheckLoginBloc(),
        ),
        BlocProvider(
          create: (context) => AddCourseBloc(),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => AuthScreen(),
        //User Route
        '/main': (context) => const BottomNavBar(arguments: {}),
        '/settings': (context) => SettingsScreen(arguments: {}),
        '/profile': (context) => const ProfileScreen(),
        //Author Route
        '/author-main': (context) => const AuthorHomeScreen(arguments: {}),
        '/add-course': (context) => AddCourseScreen(),
        //Admin Route
        '/admin-main': (context) => const AdminHomeScreen(arguments: {}),
        '/add-author': (context) => AddAuthorScreen(),
        '/all-data': (context) => const AllDataScreen(),
      },
    );
  }
}
