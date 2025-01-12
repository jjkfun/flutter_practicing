import 'package:flutter/material.dart';
import 'package:practicing_flutter/2.dart';
import 'package:practicing_flutter/widgets/drawer_navigation_widget.dart';
import 'package:practicing_flutter/widgets/progress_widget.dart';
import 'package:practicing_flutter/widgets/todo_widget.dart';

class Practicing extends StatelessWidget {
  const Practicing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              width: double.infinity,
              height: 150,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sourav Suman',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'App developer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'My Tasks',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.teal,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const TodoWidget(
                    icon: Icons.timer_outlined,
                    color: Colors.red,
                    title: 'To Do',
                    subtitle: '6 tasks now, 1 started',
                    nextPage: SecondScreen(),
                  ),
                  const SizedBox(height: 16),
                  const TodoWidget(
                    icon: Icons.timelapse,
                    color: Colors.orangeAccent,
                    title: 'In Progress',
                    subtitle: '1 tasks now, 1 started',
                    nextPage: Practicing(),
                  ),
                  const SizedBox(height: 16),
                  const TodoWidget(
                    icon: Icons.done_outline_rounded,
                    color: Colors.indigoAccent,
                    title: 'Done',
                    subtitle: '18 tasks now, 13 started',
                    nextPage: Practicing(),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Active Projects',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Wrap(
                    spacing: 20,
                    runSpacing: 16,
                    children: [
                      ProgressWidget(
                        count: 25,
                        value: 0.25,
                        color: Colors.teal,
                        title: 'Medical App',
                        subtitle: '9 hours progress',
                      ),
                      ProgressWidget(
                        count: 60,
                        value: 0.60,
                        color: Colors.redAccent,
                        title: 'Medical App',
                        subtitle: '9 hours progress',
                      ),
                      ProgressWidget(
                        count: 75,
                        value: 0.75,
                        color: Colors.orangeAccent,
                        title: 'Medical App',
                        subtitle: '9 hours progress',
                      ),
                      ProgressWidget(
                        count: 5,
                        value: 0.05,
                        color: Colors.indigoAccent,
                        title: 'Medical App',
                        subtitle: '9 hours progress',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: 350,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40),
              width: double.infinity,
              height: 230,
              color: Colors.indigoAccent,
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Sourav Suman',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Sourav@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const DrawerNavigationWidget(
              icon: Icons.dashboard_outlined,
              text: 'Dashboard',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.people_alt_outlined,
              text: 'Contacts',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.event,
              text: 'Events',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.notes,
              text: 'Notes',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.settings,
              text: 'Settings',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.notifications_none,
              text: 'Notifications',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.privacy_tip_outlined,
              text: 'Privacy policy',
              nextPage: Practicing(),
            ),
            const DrawerNavigationWidget(
              icon: Icons.error_outline,
              text: 'Send feedback',
              nextPage: Practicing(),
            ),
          ],
        ),
      ),
    );
  }
}
