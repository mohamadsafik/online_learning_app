import 'package:online_learning_app/bloc/user/get_user_bloc.dart';

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
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => GetCourseByIdBloc(),
        ),
        BlocProvider(
          create: (context) => GetUserBloc(),
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
      // home: GaweAnyar(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/auth': (context) => AuthScreen(),
        //User Route
        '/main': (context) => const BottomNavBar(arguments: {}),
        '/settings': (context) => SettingsScreen(arguments: const {}),
        '/profil': (context) => const ProfileScreen(),
        '/detail-course': (context) => const DetailCourseScreen(),
        //Lecturer Route
        '/author-main': (context) => const AuthorHomeScreen(arguments: {}),
        '/lecturer-main': (context) => const LecturerHomeScreen(arguments: {}),
        '/add-course': (context) => const AddCourseScreen(),
        //Admin Route
        '/add-lecturer': (context) => const AddLecturerScreen(),
        '/admin-main': (context) => const AdminHomeScreen(arguments: {}),
        '/all-data': (context) => const AllDataScreen(),
      },
    );
  }
}
