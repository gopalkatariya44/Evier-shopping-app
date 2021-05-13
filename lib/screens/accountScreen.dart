import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../database/database_services.dart';
import '../database/user_data.dart';
import '../resources/routes.dart';
import '../screens/recent_orders.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  UserData? userData;
  @override
  void dispose() {
    userData = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<User?>(context);

    return StreamBuilder<UserData?>(
      stream: DatabaseServices().userData(),
      builder: (context, snapshot) {
        return ListView(
          padding: EdgeInsets.all(16),
          children: [
            Center(
              child: FaIcon(
                FontAwesomeIcons.solidUserCircle,
                color: Theme.of(context).primaryColor,
                size: 70,
              ),
            ),
            ListTile(
              title: Center(
                  child: Text(
                snapshot.data?.name ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
              subtitle: Center(child: Text(user?.email ?? '')),
            ),
            Divider(
              thickness: 1,
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.phoneAlt),
              title: Text(
                snapshot.data?.phoneNumber ??
                    AppLocalizations.of(context)!.phoneNumberError,
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.addressCard),
              title: Text(
                snapshot.data?.address ?? "Please enter the address",
              ),
            ),
            ListTile(
              title: Text(
                "Recent Orders",
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RecentOrders(),
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 8,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                    ),
                    child: Text("Edit"),
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.userDetailEdit,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
