import '../../export.dart';

class CheckRoleScreen extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CheckRoleScreen({super.key});

  @override
  State<CheckRoleScreen> createState() => _CheckRoleScreenState();
}

class _CheckRoleScreenState extends State<CheckRoleScreen> {
  @override
  void initState() {
    Timer(
      Duration.zero,
      () {
        final currentUser =
            widget.firestore.doc(widget.auth.currentUser!.uid).get();
        final roleDataAdmin = widget.firestore
            .collection("user")
            .where("role", isEqualTo: "admin")
            .get();
        if (currentUser == roleDataAdmin) {}
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginSuccess) {
              final roleDataAdmin = widget.firestore
                  .collection("user")
                  .where("role", isEqualTo: "admin")
                  .get();

              return FutureBuilder(
                future: roleDataAdmin,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('something went wrong');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: Text('Loading'));
                  } else {
                    return ListView(
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['name'] ?? ''),
                            subtitle: Text(data['email'] ?? ''),
                            trailing: Text(data['role'] ?? ''),
                          );
                        },
                      ).toList(),
                    );
                  }
                },
              );
              // return StreamBuilder(
              //   stream: widget.firestore
              //       .collection('user')
              //       .orderBy('name')
              //       .snapshots(),
              //   builder: (BuildContext context,
              //       AsyncSnapshot<QuerySnapshot> snapshot) {
              //     if (snapshot.hasError) {
              //       return const Text('something went wrong');
              //     }
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: Text("Loading"));
              //     }
              //     return ListView(
              //       children: snapshot.data!.docs.map(
              //         (DocumentSnapshot document) {
              //           Map<String, dynamic> data =
              //               document.data()! as Map<String, dynamic>;
              //           return ListTile(
              //             title: Text(data['name']),
              //             subtitle: Text(data['createdAt']),
              //           );
              //         },
              //       ).toList(),
              //     );
              //   },
              // );
            } else {
              return const Text('error');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AuthService().logout();
          Navigator.pushNamed(context, '/auth');
        },
        child: const Text('Logout'),
      ),
    );
  }
}
