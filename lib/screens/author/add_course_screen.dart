import 'package:online_learning_app/export.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  File? imageSelected;
  final TextEditingController categoryId = TextEditingController();
  final TextEditingController memberId = TextEditingController();
  final TextEditingController transactionId = TextEditingController();
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  final TextEditingController image = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> category = [
    'Web Development',
    'Mobile Development',
    'IOT Development',
    'Desktop Development',
    'Artificial Intelligent',
    'UI/UX Design',
    'Lainnya...',
  ];
  String? selectedCategory;
  String categoryValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add New Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: title,
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Title is required";
                      }
                      return null;
                    },
                    // controller: nameC,
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
                      hintText: 'Judul Kursus',
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
                        Icons.abc,
                        size: 20,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            const Icon(
                              Icons.account_circle_outlined,
                              size: 20,
                              color: kGreyColor,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Expanded(
                              child: Text(
                                'Kategori',
                                style: greyTextStyle.copyWith(
                                  fontSize: 14,
                                  color: kGreyColor,
                                  fontWeight: regular,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: category
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: regular,
                                    color: kBlackColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        value: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value as String;
                            categoryValue = value;
                          });
                        },
                        //
                        icon: const Icon(Icons.keyboard_arrow_down),
                        iconSize: 24,
                        iconEnabledColor: kPrimaryColor,
                        iconDisabledColor: kGreyColor,
                        buttonHeight: 60,
                        buttonWidth: double.infinity,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: kGreyColor,
                          ),
                          color: Colors.transparent,
                        ),
                        buttonElevation: 0,
                        itemHeight: 50,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 290,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          border: Border.all(color: kGreyColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        dropdownElevation: 0,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: desc,
                    maxLines: 3,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Deskripsi is required";
                      }
                      return null;
                    },
                    // controller: widget.regisEmailC,
                    autocorrect: false,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular),
                    cursorColor: kBlackColor,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: kPrimaryColor,
                        ),
                      ),
                      hintText: 'Deskripsi',
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
                        Icons.description,
                        size: 20,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: kGreyColor,
                        )),
                    child: IconButton(
                      tooltip: 'Esese',
                      color: kGreyColor,
                      onPressed: () {},
                      icon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add thumbnail',
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Icon(Icons.camera_alt_outlined),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocConsumer<AddCourseBloc, AddCourseState>(
                    listener: (context, state) {
                      if (state is AddCourseSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 5),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: kGreenColor,
                            content: Row(
                              children: [
                                const Icon(Icons.beenhere_rounded,
                                    color: Colors.white),
                                const SizedBox(width: 12),
                                Text(
                                  'Add Course succesful!',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is AddCourseError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            behavior: SnackBarBehavior.floating,
                            elevation: 0,
                            backgroundColor: kRedColor,
                            content: Row(
                              children: [
                                const Icon(Icons.beenhere_rounded,
                                    color: Colors.white),
                                const SizedBox(width: 12),
                                Text(state.message),
                              ],
                            ),
                          ),
                        );
                      } else {
                        const CircularProgressIndicator();
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                elevation: 0,
                                backgroundColor: kLoadingColor,
                                content: Row(
                                  children: const [
                                    Text('Loading'),
                                    SizedBox(width: 12),
                                    SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                            //Store the data
                            print(selectedCategory);
                            context.read<AddCourseBloc>().add(
                                  AddNewCourseEvent(
                                      categoryId: '11',
                                      desc: desc.text,
                                      image: '11',
                                      memberId: '11',
                                      title: title.text,
                                      transactionId: '11'),
                                );
                          }
                        },
                        title: 'Add Course Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                        height: 55,
                        backgroundColor: kPrimaryColor,
                        width: double.infinity,
                        borderRadius: 20,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
