import 'package:online_learning_app/bloc/course/join_course/join_bloc.dart';
import '../../export.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<JoinBloc, JoinState>(
        builder: (context, state) {
          return const Center(
            child: Text('test page'),
          );
        },
      ),
    );
  }
}
