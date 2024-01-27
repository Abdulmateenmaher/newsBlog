import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class TitileShimmer extends StatelessWidget {
  const TitileShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.white,
        child: Container(
          height: 30,width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: Colors.grey,),
          margin: const EdgeInsets.only(bottom: 90),)
    );
  }
}

class PictureShimmer extends StatelessWidget {
  const PictureShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.white,
        direction: ShimmerDirection.ltr,
        child:
        Container(
          color: Colors.black26,
          height: 220,
        ));
  }
}

class DescriptionShimmer extends StatelessWidget {
  const DescriptionShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i=1; i<3; i++)
      Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top:5,right: 10,left: 20),
            height: 10,width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.grey,),)
      ),
    ]);
  }
}

class ReactionButtonsShimmer extends StatelessWidget {
  const ReactionButtonsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for(int i=1; i<4; i++)
          Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: Container(
            margin: EdgeInsets.only(top:5,right: 10),
            height: 30,width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Colors.grey,),)
      ),
    ]);
  }
}