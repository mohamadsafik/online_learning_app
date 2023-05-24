import 'package:flutter/material.dart';
import 'package:online_learning_app/export.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deskripsi', style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Generate Lorem Ipsum placeholder\ntext for use in your graphic,\nGenerate Lorem Ipsum placeholder\ntext for use in your graphic,\n',
                style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular, height: 1.5),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(color: kRedColor, borderRadius: BorderRadius.circular(100)),
                child: const Center(child: Text('PP')),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pembuat',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              ),
              Text(
                'Fikri Ilhamsyah',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Kategori',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              ),
              Text(
                'Web Development',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Video',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              ),
              Text(
                '12 Video',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tanggal Dibuat',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semibold),
              ),
              Text(
                '14 April 2023',
                style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
