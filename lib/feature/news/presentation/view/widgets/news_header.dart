import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/core/local_storage.dart';

class NewsHeaderWidget extends StatefulWidget {
  const NewsHeaderWidget({
    super.key,
  });

  @override
  State<NewsHeaderWidget> createState() => _NewsHeaderWidgetState();
}

class _NewsHeaderWidgetState extends State<NewsHeaderWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: AppLocal.getName(),
              builder: (context, snapshot) {
                return Text(
                  'Hello, ${snapshot.data?.split(' ').first}',
                  style: Theme.of(context).textTheme.displayMedium!,
                );
              },
            ),
            //
            Text(
              'Have A Nice Day.',
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
        const Spacer(),
        FutureBuilder(
            future: AppLocal.getImage(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColor.white,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: FileImage(File(snapshot.data!)),
                  ),
                );
              } else {
                return CircleAvatar(
                  radius: 26,
                  backgroundColor: AppColor.white,
                  child: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/user.png')),
                );
              }
            })
      ],
    );
  }
}
