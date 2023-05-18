import 'package:online_learning_app/export.dart';

class AddAuthorScreen extends StatefulWidget {
  bool _obscureText = true;
  TextEditingController nameC = TextEditingController();
  TextEditingController regisPasswordC = TextEditingController();
  TextEditingController regisEmailC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddAuthorScreen({super.key});

  @override
  State<AddAuthorScreen> createState() => _AddAuthorScreenState();
}

class _AddAuthorScreenState extends State<AddAuthorScreen> {
  void _showPassword() {
    setState(() {
      widget._obscureText = !widget._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Add Author'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Container(
          padding: const EdgeInsets.only(top: 40),
          child: SingleChildScrollView(
            child: Form(
              key: widget._formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Nama Lengkap is required";
                      }
                      return null;
                    },
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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Email is required";
                      } else if (!val.toString().contains('@')) {
                        return 'Enter valid Email';
                      }
                      return null;
                    },
                    controller: widget.regisEmailC,
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
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Password is required";
                      } else if (val.length <= 6) {
                        return "Please enter a password at least 6 characters!";
                      }
                      return null;
                    },
                    controller: widget.regisPasswordC,
                    obscureText: widget._obscureText,
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
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
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
                                  'Register succesful!',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else if (state is RegisterError) {
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
                          if (widget._formKey.currentState!.validate()) {
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
                                          strokeWidth: 1),
                                    )
                                  ],
                                ),
                              ),
                            );
                            //Store the data
                            context.read<RegisterBloc>().add(
                                  RegisterUserEvent(
                                    email: widget.regisEmailC.text,
                                    password: widget.regisPasswordC.text,
                                    dateBirth: '',
                                    fullName: '',
                                    gender: '',
                                    userName: '',
                                  ),
                                );
                          }
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
  }
}
