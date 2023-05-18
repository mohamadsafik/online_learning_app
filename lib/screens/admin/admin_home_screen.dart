import '../../constant/storage_services.dart';
import '../../export.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key, required Map<String, String> arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              storage.deleteAllData().then((_) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);
              });
            },
            child: Text(
              'ini halaman home Admin',
            ),
          ),
        ),
      ),
    );
  }
}
