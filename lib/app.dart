import 'export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TestBlocBloc(),
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
      home: const LoginScreen(),
      // initialRoute: '/',
      // routes: {
      // '/home': (context) => const HomeScreen(),
      // '/login': (context) => const LoginScreen(),
      // },
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
