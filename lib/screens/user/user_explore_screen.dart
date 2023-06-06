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
            const SizedBox(height: 24),
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
                        border: Border.all(width: 1, color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        'Web Dev',
                        style: orangeTextStyle.copyWith(
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
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Mobile Dev',
                          style: whiteTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCourseScreen()));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: 130,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 130,
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
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 130,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            width: 130,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
