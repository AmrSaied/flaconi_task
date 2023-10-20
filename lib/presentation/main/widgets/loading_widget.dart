import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.grey.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const BannerPlaceholder(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  8,
                  (index) => const BannerPlaceholder(
                    height: 30,
                    width: 40,
                  ),
                ).toList(),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      4,
                      (index) => const BannerPlaceholder(
                            width: 230,
                            height: 250,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BannerPlaceholder extends StatelessWidget {
  final double? width;
  final double? height;
  const BannerPlaceholder({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 200.0,
      margin: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
    );
  }
}
