import 'package:online_learning_app/export.dart';

class CustomSplashScreen extends StatelessWidget {
  final String logo;
  final String title;
  final double size;
  final Color backgroundColor;
  final Color titleColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double spacing;

  const CustomSplashScreen({
    required this.logo,
    this.size = 75,
    this.fontSize = 14,
    this.title = '',
    this.spacing = 20,
    this.fontWeight = FontWeight.w400,
    this.backgroundColor = Colors.blue,
    this.titleColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logo,
                height: size,
                width: size,
              ),
              SizedBox(
                height: spacing,
              ),
              Text(
                title,
                style: blackTextStyle.copyWith(
                  color: titleColor,
                  fontWeight: fontWeight,
                  letterSpacing: 1,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
