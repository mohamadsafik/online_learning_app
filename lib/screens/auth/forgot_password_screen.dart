import 'package:online_learning_app/export.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  TextEditingController emailC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          'Lupa Password',
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Email is required";
                } else if (!val.toString().contains('@gmail')) {
                  return 'Enter valid Email';
                }
                return null;
              },
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
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {},
              height: 55,
              backgroundColor: kPrimaryColor,
              title: 'Send email verification',
              borderRadius: 20,
              width: double.infinity,
              style: whiteTextStyle.copyWith(
                fontSize: 14,
                color: kWhiteColor,
                fontWeight: semibold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
