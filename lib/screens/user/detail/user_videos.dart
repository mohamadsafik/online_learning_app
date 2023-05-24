import 'package:flutter/material.dart';
import 'package:online_learning_app/export.dart';

class Videos extends StatelessWidget {
  const Videos({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 0.5, color: kGreyColor),
              ),
              child: Center(
                child: Text(
                  '1',
                  style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
                ),
              ),
            ),
            title: Text(
              'Introduction',
              style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            subtitle: Text(
              '5 Minutes',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
            trailing: InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: kGreyColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: kRedColor,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 0.5, color: kGreyColor),
              ),
              child: const Center(
                child: Icon(
                  Icons.lock,
                  size: 18,
                  color: kGreyColor,
                ),
              ),
            ),
            title: Text(
              'Apa itu JS?',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            subtitle: Text(
              '10 Menit',
              style: greyTextStyle.copyWith(
                fontSize: 12,
                fontWeight: regular,
              ),
            ),
            trailing: InkWell(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: kGreyColor),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: kGreyColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
