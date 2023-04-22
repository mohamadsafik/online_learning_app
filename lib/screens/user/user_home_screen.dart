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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(25),
          scrollDirection: Axis.vertical,
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
                            state.user.name,
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
                                    fontSize: 14,
                                    fontWeight: regular,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.user.name,
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
                  onTap: () => Navigator.of(context).pushNamed('/profile'),
                  child: const SizedBox(
                    child: CircleAvatar(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Kursus yang kamu ikuti',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lime.shade50,
                      // border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.accessible_forward_outlined,
                            size: 50,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Javascript Dasar',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semibold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Essential JavaScript course for beginners. Fundamentals covered comprehensively.',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Completed',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                '60%',
                                style: orangeTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.lime.shade50,
                      // border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.accessible_forward_outlined,
                            size: 50,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Javascript Dasar',
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: semibold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Essential JavaScript course for beginners. Fundamentals covered comprehensively.',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Completed',
                                style: blackTextStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: regular,
                                ),
                              ),
                              Text(
                                '60%',
                                style: orangeTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: semibold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //       Container(
            //         color: kRedColor,
            //         child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(Icons.logout),
            //         ),
            //       ),
            //       const SizedBox(width: 16),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
