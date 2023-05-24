import 'package:online_learning_app/export.dart';

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
                                    state.user.data!.name.toString(),
                                    style: blackTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    state.user.data!.email.toString(),
                                    style: greyTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: regular,
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
                    onTap: () => Navigator.of(context).pushNamed('/profile'),
                    child: const SizedBox(
                      child: CircleAvatar(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
