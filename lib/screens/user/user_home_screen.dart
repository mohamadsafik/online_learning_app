import 'package:online_learning_app/export.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String image =
      'https://plus.unsplash.com/premium_photo-1663050718223-bf7ad96c0fee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2058&q=80';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutBloc, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 5),
              behavior: SnackBarBehavior.floating,
              backgroundColor: kGreenColor,
              content: Row(
                children: [
                  const Icon(Icons.beenhere_rounded, color: Colors.white),
                  const SizedBox(width: 12),
                  Text(
                    'Logout succesful!',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is LogoutError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              backgroundColor: kRedColor,
              content: Row(
                children: [
                  const Icon(Icons.beenhere_rounded, color: Colors.white),
                  const SizedBox(width: 12),
                  Text(state.message!),
                ],
              ),
            ),
          );
        } else {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: kPrimaryColor,
            child: const Icon(Icons.logout),
            onPressed: () {
              AuthService().logout();
              Navigator.pushNamed(context, '/auth');
            },
          ),
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(25),
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, ${widget.auth.currentUser!.displayName}',
                      style: blackTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semibold,
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.image),
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
      },
    );
  }
}
