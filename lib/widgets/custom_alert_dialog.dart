import 'package:online_learning_app/export.dart';

class CustomAlert extends StatelessWidget {
  final String title;
  final String content;
  final TextButton button;
  final TextStyle titleStyle;
  final TextStyle contentStyle;
  const CustomAlert({
    required this.title,
    required this.content,
    required this.button,
    required this.titleStyle,
    required this.contentStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                showAlertDialog(context);
              },
              child: const Text('show'),
            ),
          ),
        ],
      ),
    );
  }

  Widget showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Cancel',
        style: blackTextStyle.copyWith(
          color: Colors.red,
        ),
      ),
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text(title, style: titleStyle),
      content: Text(content, style: contentStyle),
      actions: [
        cancelButton,
        button,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
    return alertDialog;
  }
}
