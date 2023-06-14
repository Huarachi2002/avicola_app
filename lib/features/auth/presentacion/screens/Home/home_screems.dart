import 'package:avicola/config/config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const _HomeView(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _MyHeaderDrawer(),
                _MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: Column(
        //Lista del menu
        children: [
          menuItem(appMenuConfig[0].title, appMenuConfig[0].icon,
              appMenuConfig[0].link),
          menuItem(appMenuConfig[1].title, appMenuConfig[1].icon,
              appMenuConfig[1].link)
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, String link) {
    return Builder(builder: (context) {
      return Material(
        child: InkWell(
            onTap: () {
              context.push(link);
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: colorSeed,
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: colorSeed,
                        fontSize: 16,
                      ),
                    ))
              ]),
            )),
      );
    });
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push(menuItem.link);
      },
    );
  }
}

class _MyHeaderDrawer extends StatefulWidget {
  const _MyHeaderDrawer({super.key});

  @override
  State<_MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<_MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorSeed,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('assets/images/profile.png')),
            ),
          ),
          FilledButton(
              onPressed: () {},
              child: const Text(
                'Yeferson Adrian Huarachi Aleman',
              )),
          FilledButton(onPressed: () {}, child: const Text('220001499')),
        ],
      ),
    );
  }
}
