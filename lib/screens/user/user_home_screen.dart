import 'package:online_learning_app/export.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

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
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginSuccess) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.user.name,
                            style: blackTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            state.user.email,
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
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/profile'),
                  child: const SizedBox(
                    child: CircleAvatar(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              // validator: (val) {
              // widget.validated = false;
              // if (val == null || val.isEmpty) {
              //   return "Email is required";
              // } else if (!val.toString().contains('@gmail')) {
              //   return 'Enter valid Email';
              // } else {
              //   widget.validated = true;
              // }
              // return null;
              // },
              // controller: widget.loginEmailC,
              autocorrect: false,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                hintText: 'Search...',
                hintStyle: greyTextStyle.copyWith(
                  fontWeight: regular,
                  fontSize: 14,
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
            const SizedBox(height: 30),
            Text(
              'Popular Courses',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    color: kRedColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.logout),
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
