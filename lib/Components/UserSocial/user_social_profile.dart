import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/Components/UserSocial/custom_clippath.dart';
import 'package:twin_social_network/Components/UserSocial/styles.dart';
import 'package:twin_social_network/Controllers/FollowCtrl.dart';
import '../../AppColors/app_colors.dart';

class profileUserSocial extends StatefulWidget {
  const profileUserSocial({Key? key}) : super(key: key);

  @override
  State<profileUserSocial> createState() => _profileUserSocialState();
}

class _profileUserSocialState extends State<profileUserSocial> {
  var data = Get.arguments;
  var followController = Get.put(FollowController());

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 1,
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: AppColors.baseSeaShellColor,
          height: 250,
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  data[2]['username'] ?? "",
                  style: textUserName,
                ),
                SizedBox(
                  height: 20,
                ),
                CircleAvatar(
                  backgroundColor: AppColors.baseDarkOrangeColor,
                  radius: 54.0,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data[3]['avatar']),
                    radius: 50.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          followController.listfollowing.length!.toString(),
                          style: textNumber,
                        ),
                        Text(
                          "Nguời theo dõi",
                          style: textFollowers,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          followController.listfollowers.length!.toString(),
                          style: textNumber,
                        ),
                        Text(
                          "Đang theo dõi",
                          style: textFollow,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
