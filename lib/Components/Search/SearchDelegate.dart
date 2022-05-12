import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twin_social_network/AppColors/app_colors.dart';
import 'package:twin_social_network/Controllers/SearchCtrl.dart';
import 'package:twin_social_network/Models/User/UserModel.dart';

class MySearch extends SearchDelegate {
  var searchController = Get.put(SearchController());
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = "";
            }
          },
        )
      ];
  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(query),
      );
  @override
  Widget buildSuggestions(BuildContext context) {
    // set state list user search when query username
    searchController.userLists = searchController.ulist
        .where(
          (u) => (u.username.toLowerCase().contains(
                query.toLowerCase(),
              )),
        )
        .toList();
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.baseGrey10Color,
        child: Column(
          children: [
            Flexible(
              child: Card(
                child: FutureBuilder<List<UserSearch>>(
                  future: searchController.serachUser(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container(
                        child: Center(
                          child: Text("Chờ một xíu..."),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: searchController.userLists.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            onTap: () {
                              print(searchController.userLists[i].id);
                              Get.toNamed("userSocialScreen", arguments: [
                                {"id": searchController.userLists[i].id},
                                {
                                  "fullname":
                                      searchController.userLists[i].fullname
                                },
                                {
                                  "username":
                                      searchController.userLists[i].username
                                },
                                {
                                  "avatar": searchController.userLists[i].avatar
                                },
                                {
                                  "followers":
                                      searchController.userLists[i].followers
                                },
                                {
                                  "following":
                                      searchController.userLists[i].following
                                }
                              ]);
                              // searchController.userLists[i].id);
                            },
                            title: Text(searchController.userLists[i].username),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
