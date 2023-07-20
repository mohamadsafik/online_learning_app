import 'package:online_learning_app/bloc/course/search_course/search_course_bloc.dart';
import 'package:online_learning_app/export.dart';

import '../../bloc/course/get_course/get_course_bloc.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key, required Map<String, String> arguments});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String defaultImage =
      'https://images.unsplash.com/photo-1616587894289-86480e533129?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fHZpZGVvJTIwbGVhcm5pbmd8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60';

  @override
  Widget build(BuildContext context) {
    bool buttonSelected = false;
    TextEditingController searchController = TextEditingController();
    final course = context.read<GetCourseBloc>()..add(GetAllCourseEvent());
    selectedButtonCategory() {
      setState(() {
        buttonSelected = !buttonSelected;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          scrollDirection: Axis.vertical,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cari Kursus',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                value = searchController.text;
                if (searchController.text == "" && searchController.text.isEmpty) {
                  course;
                } else {
                  context.read<SearchCourseBloc>().add(SearchCourseByQuery(query: value));
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                hintText: 'Javascript Dasar..',
                hintStyle: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 0.5,
                    color: kGreyColor,
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  size: 20,
                  color: kGreyColor,
                ),
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<SearchCourseBloc, SearchCourseState>(
              builder: (context, state) {
                if (state is SearchCourseLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchCourseError) {
                  return Center(
                    child: Text('Error: ${state.message}'),
                  );
                } else if (state is SearchCourseSuccess) {
                  var dataLength = state.result.data!.length;
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dataLength,
                    itemBuilder: (context, index) {
                      var result = state.result.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailCourseScreen(),
                              settings: RouteSettings(arguments: course),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(defaultImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result.title!,
                                    style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                                  ),
                                  const SizedBox(height: 12),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          result.description!,
                                          style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return BlocBuilder<GetCourseBloc, GetCourseState>(
                    bloc: course,
                    builder: (context, state) {
                      if (state is GetCourseError) {
                        return Text(state.message);
                      } else if (state is GetCourseLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetCourseSuccess) {
                        var dataLength = state.course.data!.length;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: dataLength,
                          itemBuilder: (context, index) {
                            var course = state.course.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DetailCourseScreen(),
                                    settings: RouteSettings(arguments: course),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 24),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: NetworkImage(defaultImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          course.title.toString(),
                                          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: bold),
                                        ),
                                        const SizedBox(height: 12),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Text(
                                                course.description.toString(),
                                                style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: false,
                                                maxLines: 3,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('');
                      }
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
