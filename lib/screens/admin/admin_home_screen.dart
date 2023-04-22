import '../../export.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key, required Map<String, String> arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<CheckLoginBloc, CheckLoginState>(
            builder: (context, state) {
              if (state is CheckLoginSuccess) {
                return Text("Admin : ${state.user.name}");
              } else if (state is CheckLoginLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      return Text("Admin : ${state.user.name}");
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
                      AuthService().logout();
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.all(10),
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerRight,
                        backgroundColor: Colors.amberAccent.shade100,
                      ),
                      child: Text(
                        'Add Author',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/add-author');
                      },
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      style: TextButton.styleFrom(
                        elevation: 0,
                        padding: const EdgeInsets.all(10),
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.centerRight,
                        backgroundColor: Colors.blue.shade200,
                      ),
                      child: Text(
                        'All User Data',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/all-data');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //Logout Floating
    );
  }
}
