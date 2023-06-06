import '../../export.dart';

class AuthorHomeScreen extends StatelessWidget {
  final Map<String, String> arguments;
  const AuthorHomeScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () => Navigator.of(context).pushNamed('/add-course'),
            child: const Icon(Icons.add),
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.add),
          // )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<CheckLoginBloc, CheckLoginState>(
            builder: (context, state) {
              if (state is CheckLoginSuccess) {
                return Text("Lecturer : ${state.data.name}");
              } else if (state is CheckLoginLoading) {
                return const Center(
                  child: Text(''),
                );
              } else {
                return BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      return Text("Lecturer : ${state.user.data!.name}");
                    } else {
                      return const Text('undefined');
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  ('Logout'),
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                content: Text(
                  'Are you sure want to logout?',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: blackTextStyle.copyWith(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/auth');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          elevation: 0,
                          backgroundColor: kGreenColor,
                          content: Row(
                            children: [
                              const Icon(
                                Icons.beenhere_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Logout Success',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Logout Now',
                      style: blackTextStyle.copyWith(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.logout_outlined),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Text('kamu belum memiliki kursus'),
        ),
      ),
    );
  }
}
