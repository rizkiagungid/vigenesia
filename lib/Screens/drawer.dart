import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vigenesia/Constant/const.dart';
import 'package:vigenesia/Screens/profile.dart';
import 'package:url_launcher/url_launcher.dart';
import 'login.dart';

class NavDrawer extends StatelessWidget {
  final String displayName;
  final String fullName;
  const NavDrawer({
    Key? key,
    required this.displayName,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/cover1.jpg'),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: SizedBox(
                    child: CircleAvatar(
                      radius: 19.0,
                      child: Text(displayName),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.5),
                    child: Text(
                      fullName,
                      style:
                          const TextStyle(color: Colors.black, fontSize: 19.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 19.0,
                      child: TextButton(
                        child: const Icon(
                          Icons.logout_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          SharedPreferences.getInstance().then(
                            (prefs) {
                              prefs.remove('email');
                              prefs.remove('nama');
                              prefs.remove('id');
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const Login(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 19.5),
            leading: const Icon(
              CupertinoIcons.person,
              size: 33.5,
            ),
            title: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10.5,
              ),
              child: const Text(
                'PROFILE',
                style: TextStyle(fontSize: 16),
              ),
            ),
            onTap: () {
              SharedPreferences.getInstance().then(
                (prefs) {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Profile(
                        id: prefs.getString('id')!,
                        fromPage: "home",
                      ),
                    ),
                  );
                },
              );
            },
          ),
          url != "http://vigenesia.rasxmedia.com/"
              ? ListTile(
                  contentPadding: const EdgeInsets.only(left: 19.5),
                  leading: const Icon(
                    CupertinoIcons.link,
                    size: 33.5,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10.5,
                    ),
                    child: const Text(
                      'PAGE',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onTap: () {
                    _launchUrl();
                  },
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

_launchUrl() async {
  const url = 'http://vigenesia.rasxmedia.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
