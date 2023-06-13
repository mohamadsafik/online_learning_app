import 'package:online_learning_app/bloc/user/get_user_bloc.dart';

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
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<GetUserBloc, GetUserState>(
          bloc: context.read<GetUserBloc>()..add(GetAllUserEvent()),
          builder: (context, state) {
            if (state is GetUserSuccess) {
              var dataLength = state.user.data!.length;
              return ListView.builder(
                shrinkWrap: true,
                itemCount: dataLength,
                itemBuilder: (context, index) {
                  var data = state.user.data![index];
                  print(data);
                  return ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text(data.name!),
                    subtitle: Text(data.email!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            } else if (state is GetUserError) {
              return const Center(child: Text('Error'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
