import 'package:flutter/material.dart';
import 'package:task/Custom.dart';
import 'package:task/widgets/text_view.dart';

class DrawerData extends StatelessWidget {
  const DrawerData();

  @override
  Widget build(BuildContext context) {
    final List<DrawerItem> drawer = [
      const DrawerItem(
        'Home',
      ),
      const DrawerItem(
        'Book A Nanny',
      ),
      const DrawerItem(
        'How It Works',
      ),
      const DrawerItem(
        'Why Nanny Vanny',
      ),
      const DrawerItem(
        'My Bookings',
      ),
      const DrawerItem(
        'My Profile',
      ),
      const DrawerItem(
        'Support',
      ),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 22.0),
            child: Column(
              children: [
                Image.asset('assets/image_icon/user.png', height: 75),
                const SizedBox(
                  height: 10,
                ),
                TextView('Emily Cyrus',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    textColor: ColorClass.pink1),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 5,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 44,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: TextView(
                                drawer[index].name,
                                textColor: ColorClass.nevy,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width * 0.45),
                    color: ColorClass.pink,
                    height: 1,
                    width: 50,
                  );
                },
                itemCount: drawer.length),
          ),
        ],
      ),
    );
  }
}

class DrawerItem {
  final String name;

  const DrawerItem(
    this.name,
  );
}
