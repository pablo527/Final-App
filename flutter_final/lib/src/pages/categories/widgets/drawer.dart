import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:redmartini_mobile_flutter/src/providers/user.provider.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/colors.global.dart';
import 'package:redmartini_mobile_flutter/src/utils/global/variables.global.dart';

class DrawerRedMartini extends StatefulWidget {
  DrawerRedMartini({Key key}) : super(key: key);

  @override
  _DrawerRedMartiniState createState() => _DrawerRedMartiniState();
}

class _DrawerRedMartiniState extends State<DrawerRedMartini> {
  FlutterSecureStorage storage;

  @override
  void initState() {
    super.initState();
    storage = FlutterSecureStorage();
  }

  void _deleteToken() async {
    await storage.delete(key: jwtSecureKey);
  }

  Widget _showProfileImg(String img) {
    return Image.asset("assets/imgs/avatar.png", width: 90, height: 90);
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(color: redColor),
              child: Container(
                child: Column(
                  children: <Widget>[
                    ClipOval(child: _showProfileImg(userInfo.image)),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "${userInfo.firtsName} ${userInfo.firtsLastName}",
                        style: TextStyle(color: whiteColor, fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: kDefaultPaddin,
          ),
          CustomListTitle(Icons.person, 'Profile', () => {}),
          CustomListTitle(
              Icons.lock,
              'Log Out',
              () => {
                    _deleteToken(),
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login', (Route<dynamic> route) => false)
                  }),
        ],
      ),
    );
  }
}

class CustomListTitle extends StatefulWidget {
  final IconData icon;
  final String text;
  final Function onTap;
  CustomListTitle(this.icon, this.text, this.onTap);

  @override
  _CustomListTitleState createState() => _CustomListTitleState();
}

class _CustomListTitleState extends State<CustomListTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300))),
        child: InkWell(
          splashColor: Colors.redAccent,
          onTap: widget.onTap,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(widget.icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
