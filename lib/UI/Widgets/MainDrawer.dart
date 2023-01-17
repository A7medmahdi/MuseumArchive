import 'package:flutter/material.dart';

import '../theme.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: [
          Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          color: Theme
              .of(context)
              .primaryColor,
          child:  Text('متحف الكفيل للنفائس و المخطوطات',
            style: HeadingStyle.copyWith(color: Colors.white),
            textAlign: TextAlign.center,

      ),),
    const SizedBox(
    height: 20,
    ),
    buildListTile(context, "تسجيل الدخول", Icons.login),
    buildListTile(context, "تسجيل خروج", Icons.logout),
    ],
    ));
  }

  Widget buildListTile(ctx, String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24,
      ),
      title: Text(title, style: (Theme
          .of(ctx)
          .textTheme
          .titleLarge)),
      onTap: () {},
    );
  }
}
