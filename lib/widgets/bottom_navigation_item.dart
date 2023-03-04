import 'package:online_learning_app/export.dart';

class BottomNavigationItem extends StatelessWidget {
  final int index;
  final String imgUrl;
  final String title;
  const BottomNavigationItem({
    super.key,
    required this.index,
    required this.imgUrl,
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().setPage(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(
            imgUrl,
            width: 24,
            height: 24,
            color: context.read<PageCubit>().state == index
                ? kPrimaryColor
                : kGreyColor,
          ),
          Container(
            height: 4,
            width: 30,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kTransparentColor,
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
    );
  }
}
