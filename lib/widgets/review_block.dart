import '../utils/mytheme.dart';
import '../controllers/auth_controller.dart';
import '../utils/constants.dart';

import 'package:flutter/material.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '1043 reviews',
                style: TextStyle(fontSize: 14),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Write yours >',
                    style: TextStyle(color: MyTheme.splash),
                  ))
            ],
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: CircleAvatar(
              foregroundImage: NetworkImage(picUrl),
            ),
            title: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: AuthController.instance.user!.displayName ?? 'No name',
                style: const TextStyle(color: Colors.black87),
              ),
              const WidgetSpan(child: SizedBox(width: 10)),
              const TextSpan(
                  text: '09 August, 2022',
                  style: TextStyle(color: Colors.black45)),
            ])),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  'With all the updates after the last few months the app has improved a lot'),
            ),
          )
        ],
      ),
    );
  }
}
