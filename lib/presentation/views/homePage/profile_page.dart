import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsline/data/models/blog_model.dart';
import 'package:newsline/presentation/views/profileView/setting_screen.dart';
import '../../../core/routes/route_names.dart';
import '../../../domain/viewModel/controller/HomeScreenControllers/profile_controller.dart';
import '../../../shared/utils/responsive_utils.dart';
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller=Get.find<ProfileController>();


  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(

      appBar: AppBar(
        title:  Text("PROFILE", style: TextStyle(color: colorScheme.onSurface),),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.padding(7)),
            child: IconButton(
              onPressed: () {
                Get.to(SettingScreen());
              },
              icon: Icon(
                Icons.settings,
                color: colorScheme.onSurface,
                size: 28,
              ),
            ),
          )
        ],
      ),



      body: SingleChildScrollView(
        padding: EdgeInsets.all(Responsive.padding(7)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

     Obx(() {
        final profile = controller.profile.value;

        if (profile == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: profile.avatarUrl != null
                    ? NetworkImage(profile.avatarUrl!)
                    : const AssetImage('assets/images/test.jpg') as ImageProvider,
              ),
              const SizedBox(height: 16),
              Text(profile.username, style: const TextStyle(fontSize: 20)),
              Text(profile.email, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: Responsive.height(1),),
              if (profile.bio == null) Text(
                "Flutter Developer-Traveler",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Responsive.fontSize(3.2),
                  color: colorScheme.onSurface,
                ),
              ),
              SizedBox(height: Responsive.screenHeight * 0.02),


              SizedBox(
                width: Responsive.screenWidth*0.7,
                child: ElevatedButton(
                  onPressed: () {

                    Get.toNamed(RouteNames.editProfileScreen);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    padding: EdgeInsets.symmetric(vertical: Responsive.padding(3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: Responsive.fontSize(3.6),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Responsive.screenHeight * 0.03),

              Obx(() {
                if(controller.blog.isEmpty){
                  return Center(child: Text('No blog yet',style: TextStyle(fontSize: Responsive.fontSize(3)),),);
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: controller.blog.length,
                  itemBuilder: (context, index) {
                    final blog = controller.blog[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Image.asset('assets/images/test.jpg',)
                            // child: blog.coverImageUrl != null
                            //     ? Image.network(blog.coverImageUrl!, fit: BoxFit.cover)
                            //     : const Icon(Icons.article, size: 50),
                          ),
                          const SizedBox(height: 8),
                          Text(blog.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: Responsive.fontSize(3))),
                          Text(blog.content, maxLines: 2, overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: Responsive.fontSize(2)),),
                        ],
                      ),
                    );
                  },
                );
              }),


       ],
          ),
        );
      }),
    ])
      ),
            floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.toNamed(RouteNames.addBlogPage);
          },
            child: Icon(Icons.add),
      ),
    );
  }
}


