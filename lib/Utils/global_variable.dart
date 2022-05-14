import 'package:flutter/material.dart';
import 'package:twin_social_network/Screens/Post/CreatePost.dart';
import 'package:twin_social_network/Screens/Profile/ProfileScreen.dart';
import 'package:twin_social_network/Screens/Search/SearchScreen.dart';

List<Widget> homeScreenItems = [
  const Text('a'),
  SearchScreen(),
  CreatePost(),
  const Text('d'),
  ProfileScreen(),
];
