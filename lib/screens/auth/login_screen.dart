import 'package:online_learning_app/export.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  TextEditingController loginEmailC = TextEditingController();
  TextEditingController loginPasswordC = TextEditingController();
  bool _obscureText = true;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _showPassword() {
    setState(() {
      widget._obscureText = !widget._obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                //Title
                Text(
                  'Welcome Back',
                  style: orangeTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/hi.png',
                  width: 25,
                  height: 25,
                ),
              ],
            ),
            //Subtitle
            const SizedBox(height: 10),
            Text(
              'We happy to see you again. Please enter the form\nto continue to your account.',
              style: greyTextStyle.copyWith(
                fontSize: 14,
                height: 1.5,
                fontWeight: light,
              ),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: widget.loginEmailC,
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
                  color: kGreyColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: widget.loginPasswordC,
              scrollPadding: const EdgeInsets.only(bottom: 165.0),
              autocorrect: false,
              obscureText: widget._obscureText,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
              cursorColor: kGreyColor,
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
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: regular,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomButton(
              title: 'Login Now',
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semibold,
              ),
              height: 55,
              backgroundColor: kPrimaryColor,
              onPressed: () {},
              width: double.infinity,
              borderRadius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
