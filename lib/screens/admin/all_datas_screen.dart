import 'package:online_learning_app/services/user_services.dart';

import '../../export.dart';

class AllDataScreen extends StatelessWidget {
  const AllDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Data'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          if (state is LoginSuccess) {
            return StreamBuilder<QuerySnapshot>(
              stream: UserService().getAllUser(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }

                return ListView(
                  children: snapshot.data!.docs
                      .map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            title: Text(data['name']),
                            subtitle: Text(data['role']),
                          );
                        },
                      )
                      .toList()
                      .cast(),
                );
              },
            );
          } else {
            return const Text('');
          }
        },
      ),
    );
  }
}
