import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/theme/app_colors.dart';
class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Image.asset('assets/images/home_header.png'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Row(
              children: [
                SvgPicture.asset('assets/images/app_logo.svg'),
                const Spacer(),
                SvgPicture.asset('assets/images/icon_search.svg'),
                const SizedBox(
                  width: 24,
                ),
                SvgPicture.asset('assets/images/icon_bell.svg'),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dr. Strange 2',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: AppColors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Action, Superhero, Science Fiction, ...',
                  style: theme.textTheme.bodySmall!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_play.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Play',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          side:
                          const BorderSide(color: AppColors.white, width: 2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/icon_plus.svg'),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'My List',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}