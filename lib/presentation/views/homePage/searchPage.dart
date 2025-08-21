import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/domain/viewModel/controller/HomeScreenControllers/notification_controllers.dart';

import '../../../shared/utils/responsive_utils.dart';

class SearchPage extends StatelessWidget {
 SearchPage({super.key});


  final controller=Get.find<NotificationControllers>();

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;


    return Scaffold(
      appBar: AppBar(
        title:  Text("NOTIFICATIONS", style: TextStyle(color: colorScheme.onSurface),),

      ),
      body:
      DefaultTabController(
          length: 2,
          child:Scaffold(
            appBar: AppBar(
              title: const Text(""),
              centerTitle: true,
              elevation: 2,
              bottom: TabBar(
                indicatorColor: Colors.white,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                indicatorWeight: 2,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: [
                  Tab(icon: Icon(Icons.favorite_border, color: Colors.red,), text: "Likes"),
                  Tab(icon: Icon(Icons.comment, color: colorScheme.primary,), text: "Comments"),
                ],
              )
            ),
            body: TabBarView(
                children:[
                LikeScreen(),
                CommentScreen()
              ]
            ),
          )
      )
    );
  }
}


class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7), vertical: Responsive.padding(4)),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Today' ,style: TextStyle(fontSize:Responsive.fontSize(5)),),
            SizedBox(height: Responsive.height(2),),
            ListTile(
              title: Text('Suhana liked your blog', style: TextStyle(fontSize:Responsive.fontSize(4),),
            ),
              leading:  Icon(Icons.circle, color: Colors.white, size: Responsive.radius(7),),
             trailing: ClipRect(
                child: Container(
                  width: 50,
                  height: Responsive.height(5),
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                  ),
                ),
              ),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}


class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('comemhs'),
      ),
    );
  }
}

