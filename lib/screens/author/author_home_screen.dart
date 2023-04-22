import 'package:online_learning_app/services/course_services.dart';

import '../../export.dart';

class AuthorHomeScreen extends StatelessWidget {
  final Map<String, String> arguments;
  const AuthorHomeScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/add-course');
            },
            icon: const Icon(Icons.add),
          )
        ],
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<CheckLoginBloc, CheckLoginState>(
            builder: (context, state) {
              if (state is CheckLoginSuccess) {
                return Text("Author : ${state.user.name}");
              } else if (state is CheckLoginLoading) {
                return const Center(
                  child: Text(''),
                );
              } else {
                return BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      return Text("Author : ${state.user.name}");
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
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daftar Kursus Kamu',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CheckLoginBloc, CheckLoginState>(
                builder: (context, state) {
                  if (state is CheckLoginSuccess) {
                    return const StreamCourse();
                  } else {
                    return BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginSuccess) {
                          return const StreamCourse();
                        } else {
                          return const Text('errror');
                        }
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamCourse extends StatelessWidget {
  const StreamCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("course").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            shrinkWrap: true,
            children: snapshot.data!.docs
                .map(
                  (DocumentSnapshot doc) {
                    Map<String, dynamic> data =
                        doc.data()! as Map<String, dynamic>;
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (data['title']),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              ),
                              content: SizedBox(
                                height: 250,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Description :',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data['description'],
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      'Category :',
                                      style: greyTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      data['category'],
                                      style: blackTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: ListTile(
                        title: Text(
                          data['title'],
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semibold,
                          ),
                        ),
                        subtitle: Text(
                          data['category'],
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    ('Delete Course'),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  content: Text(
                                    'Are you sure want to delete "${data['title']}"?',
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
                                        CourseService().deleteData(data['uid']);
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration:
                                                const Duration(seconds: 3),
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
                                                  style:
                                                      whiteTextStyle.copyWith(
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
                      ),
                    );
                  },
                )
                .toList()
                .cast(),
          );
        } else {
          return const Text('Data kosong');
        }
      },
    );
  }
}
