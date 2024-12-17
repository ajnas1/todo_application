import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/utlities/constants.dart';
import 'package:todo/viewModel/settingsProvider.dart';
import 'package:todo/widget/settingsElement_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Settingsprovider>(context,listen: false).startSettings();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings',style: TextStyle(fontSize: settingsScreenLargeTitleSize),),
      ),
      body: Padding(
        padding: settingsScreenPadding,
        child: Column(
          children: [
            Row(
              children: [
                Consumer<Settingsprovider>(
                  builder:(context, value, child) =>  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: FirebaseAuth.instance.currentUser!.photoURL! == null? Image.network(
                        'https://th.bing.com/th/id/OIP.CAbTaFvo9r1nh2uSZgd5yAAAAA?rs=1&pid=ImgDetMain',
                        fit: BoxFit.cover,
                      ):Image.network(value.networkImage!,fit: BoxFit.cover,)
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ajnas',style: TextStyle(fontSize: settingsScreenMediumTitleSize,fontWeight: FontWeight.bold)),
                    Text('India',style: TextStyle(fontSize: settingsScreenSmallTitleSize)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<Settingsprovider>(context,listen: false).openImagePicker();
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 50),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(0),
                    backgroundColor: const Color(0xFF373F4A),
                    foregroundColor: Colors.white,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white),
                )
              ],
            ),
            const SizedBox(height: 20,),
            const Text(
                'Hi! My name is Ajnas, I\'m a community manage from rabat, india',style: TextStyle(fontSize: settingsScreenMediumTitleSize)),
            const SizedBox(
              height: 40,
            ),
            settingsElementswidget(Icons.notifications, 'Notifications'),
            const SizedBox(
              height: 23,
            ),
            settingsElementswidget(Icons.settings, 'General'),
            const SizedBox(
              height: 23,
            ),
            settingsElementswidget(Icons.person, 'Account'),
            const SizedBox(
              height: 23,
            ),
            settingsElementswidget(Icons.inbox_outlined, 'About'),
          ],
        ),
      ),
    );
  }
}
