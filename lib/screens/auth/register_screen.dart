import 'package:online_learning_app/export.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});
  bool _obscureText = true;
  String roleValue = '';
  TextEditingController nameC = TextEditingController();
  TextEditingController roleC = TextEditingController();
  TextEditingController regisPasswordC = TextEditingController();
  TextEditingController regisEmailC = TextEditingController();
  final List<String> role = [
    'Mahasiswa',
    'Dosen',
  ];
  String? selectedRole;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _showPassword() {
    setState(() {
      widget._obscureText = !widget._obscureText;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              behavior: SnackBarBehavior.floating,
              backgroundColor: kGreenColor,
              content: Row(
                children: const [
                  Icon(Icons.beenhere_rounded, color: Colors.white),
                  SizedBox(width: 12),
                  Text('Register new account succesful!'),
                ],
              ),
            ),
          );
        } else if (state is AuthError) {
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
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an Account!',
                  style: orangeTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Start your journey with us and discover a world of\nendless possibilities.',
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: light,
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: widget.nameC,
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
                    hintText: 'Nama Lengkap',
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
                TextField(
                  controller: widget.regisEmailC,
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
                    hintText: 'Email',
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
                      Icons.mail_outline,
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
                              'Pilih Role',
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
                      items: widget.role
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
                      value: widget.selectedRole,
                      onChanged: (value) {
                        setState(() {
                          widget.selectedRole = value as String;
                          widget.roleValue = value;
                        });
                      },
                      //
                      icon: const Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      iconEnabledColor: kPrimaryColor,
                      iconDisabledColor: kGreyColor,
                      buttonHeight: 60,
                      buttonWidth: double.infinity,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
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
                TextField(
                  controller: widget.regisPasswordC,
                  // scrollPadding: const EdgeInsets.only(bottom: 165.0),
                  autocorrect: false,
                  obscureText: widget._obscureText,
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
                    hintText: 'Password',
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
                      Icons.key,
                      size: 20,
                      color: kGreyColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _showPassword,
                      icon: widget._obscureText == true
                          ? const Icon(Icons.visibility_off, size: 20)
                          : const Icon(Icons.visibility, size: 20),
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          RegisterUserEvent(
                            name: widget.nameC.text,
                            email: widget.regisEmailC.text,
                            role: widget.roleValue,
                            password: widget.regisPasswordC.text,
                          ),
                        );
                    print('Button Klik');
                  },
                  title: 'Register Now',
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                  height: 55,
                  backgroundColor: kPrimaryColor,
                  width: double.infinity,
                  borderRadius: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
