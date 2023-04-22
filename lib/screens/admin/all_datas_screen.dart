import '../../export.dart';

class AllDataScreen extends StatelessWidget {
  const AllDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('All User Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
        child: BlocBuilder<CheckLoginBloc, CheckLoginState>(
          builder: (context, state) {
            if (state is CheckLoginSuccess) {
              return const StreamAllUser();
            } else {
              return BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return const StreamAllUser();
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class StreamAllUser extends StatelessWidget {
  const StreamAllUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: UserService().getAllUser(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }

        return ListView(
          children: snapshot.data!.docs
              .map(
                (DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['email']),
                    subtitle: Text(data['role']),
                    trailing: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                ('Delete User'),
                                style: blackTextStyle.copyWith(
                                  fontSize: 18,
                                  fontWeight: bold,
                                ),
                              ),
                              content: Text(
                                'Are you sure want to delete ${data['email']}?',
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
                                    UserService().deleteData(data['uid']);
                                    Navigator.pop(context);
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
                                              'Delete Success',
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
                                    'Delete Now',
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
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              )
              .toList()
              .cast(),
        );
      },
    );
  }
}
