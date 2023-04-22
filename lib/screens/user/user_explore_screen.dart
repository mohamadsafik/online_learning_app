import 'package:online_learning_app/export.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key, required Map<String, String> arguments});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
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
                Text(
                  'Cari Kursus Kamu',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: bold,
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
                hintText: 'Javascript Dasar..',
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
              'Kategori',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.lightBlue.shade100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Web Dev',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      )),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.lightBlue.shade100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Mobile Dev',
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),
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
