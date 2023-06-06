import 'package:online_learning_app/export.dart';
import 'package:online_learning_app/screens/user/detail/user_detail_course.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required Map<String, String> arguments});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<CheckLoginBloc, CheckLoginState>(
                    builder: (context, state) {
                      if (state is CheckLoginSuccess) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo,',
                              style: greyTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: regular,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              state.data.name,
                              style: blackTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            if (state is LoginSuccess) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Halo,',
                                    style: greyTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: regular,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    state.user.data!.name.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Text('error');
                            }
                          },
                        );
                      }
                    },
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/settings'),
                    child: const SizedBox(
                      child: CircleAvatar(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Kursus Kamu',
                    style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                  Text(
                    'Lihat Semua',
                    style: greyTextStyle.copyWith(fontSize: 12, fontWeight: regular),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailCourseScreen()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(child: Text('thumbnail')),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Fundamental PHP\nUntuk Menuju\nFramework Laravel\n10Untuk Pemula',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Fikri Ilhamsyah',
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(child: Text('thumbnail')),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fundamental PHP\nUntuk Menuju\nFramework Laravel\n10Untuk Pemula',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fikri Ilhamsyah',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(child: Text('thumbnail')),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fundamental PHP\nUntuk Menuju\nFramework Laravel\n10Untuk Pemula',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Fikri Ilhamsyah',
                          style: greyTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
