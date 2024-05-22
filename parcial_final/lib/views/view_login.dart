import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:parcial_final/views/view_register.dart';

class ViewLogin extends StatelessWidget {
  Future<String> askForNotificationPermitions() async {
    final notificationSettings = await FirebaseMessaging.instance
        .requestPermission(
            alert: true, announcement: true, badge: true, provisional: true);

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      final token = await FirebaseMessaging.instance.getToken();

      print("Device Token: $token");
      if (token != null) {
        return token;
      }
    }

    return "";
  }

  const ViewLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                textAlign: TextAlign.center,
                "Mobile Development Final: Push Notifications",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.mail),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Email",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.lock),
                    iconColor: Theme.of(context).colorScheme.surface,
                    label: Text(
                      "Password",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    border: const OutlineInputBorder()),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String authorized = await askForNotificationPermitions();
                  if (authorized != "") {}
                },
                child: const Text("Login")),
            ElevatedButton(
                onPressed: () async {
                  String authorized = await askForNotificationPermitions();
                  if (authorized != "") {
                    Navigator.push(context, 
                      MaterialPageRoute(builder: ((context) => ViewRegister(authorized))));
                  }
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
