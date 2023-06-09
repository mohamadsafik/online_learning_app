import 'package:online_learning_app/bloc/course/get_course_by_id/get_course_by_id_bloc.dart';

import '../../export.dart';

class LecturerHomeScreen extends StatelessWidget {
  final Map<String, String> arguments;
  const LecturerHomeScreen({super.key, required this.arguments});

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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<CheckLoginBloc, CheckLoginState>(
                builder: (context, state) {
                  if (state is CheckLoginSuccess) {
                    return Text(
                      state.data.name.toUpperCase(),
                      style: blackTextStyle.copyWith(fontSize: 22, fontWeight: bold),
                    );
                  } else if (state is CheckLoginLoading) {
                    return const Center(
                      child: Text(''),
                    );
                  } else {
                    return BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginSuccess) {
                          return Text(
                            state.user.data!.name!.toUpperCase(),
                            style: blackTextStyle.copyWith(fontSize: 22, fontWeight: bold),
                          );
                        } else {
                          return const Text('undefined');
                        }
                      },
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              BlocBuilder<CheckLoginBloc, CheckLoginState>(
                builder: (context, state) {
                  if (state is CheckLoginSuccess) {
                    print(state.data.idUser);
                    return BlocBuilder<GetCourseByIdBloc, GetCourseByIdState>(
                      bloc: context.read<GetCourseByIdBloc>()..add(CourseByIdEvent(id: state.data.idUser)),
                      builder: (context, state) {
                        if (state is GetCourseByIdLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is GetCourseByIdSuccess) {
                          var data = state.course.data;
                          return ListView.builder(
                            itemCount: data.toString().length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(data!.title.toString()),
                                subtitle: Text(data.description.toString()),
                              );
                            },
                          );
                        } else {
                          return const Text('kamu belum memiliki kursus');
                        }
                      },
                    );
                  } else {
                    return BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginSuccess) {
                          print(state.user.data!.idUser);
                          return BlocBuilder<GetCourseByIdBloc, GetCourseByIdState>(
                            bloc: context.read<GetCourseByIdBloc>()..add(CourseByIdEvent(id: state.user.data!.idUser.toString())),
                            builder: (context, state) {
                              if (state is GetCourseByIdLoading) {
                                return const CircularProgressIndicator();
                              } else if (state is GetCourseByIdSuccess) {
                                var data = state.course.data;
                                return ListTile(
                                  leading: Text(data!.id.toString()),
                                  title: Text(data.title.toString()),
                                  subtitle: Text(data.description.toString()),
                                );
                              } else {
                                return const Text('kamu belum memiliki kursus');
                              }
                            },
                          );
                        } else {
                          return const Text(''); //
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
