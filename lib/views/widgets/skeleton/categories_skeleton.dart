import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CategoriesSkeleton extends StatelessWidget {
  const CategoriesSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.all(8.0),
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(width: 60, height: 60),
        ),
      ),
    );
  }
}
