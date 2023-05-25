import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mova/config/global/constants/image_routes.dart';
import 'package:mova/config/theme/app_colors.dart';
import 'package:mova/config/theme/app_theme.dart';
import 'package:mova/screens/home/widgets/movie_card_item.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 56.h,
                        decoration: BoxDecoration(
                          color:
                              AppFontColorBuilder.getGrey100AndDark2(context),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: searchFocusNode.hasFocus
                                ? theme.primaryColor
                                : AppFontColorBuilder.getGrey100AndDark2(
                                    context),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          focusNode: searchFocusNode,
                          style: theme.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppFontColorBuilder.getGrey900AndWhite(
                                  context)),
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: theme.textTheme.bodyMedium!.copyWith(
                                color: AppFontColorBuilder.getGrey600AndGrey400(
                                    context),
                                fontWeight: FontWeight.w500),
                            icon: SvgPicture.asset(
                              AppImagesRoute.iconSearch,
                              color: searchFocusNode.hasFocus
                                  ? theme.primaryColor
                                  : AppFontColorBuilder.getGrey600AndGrey400(
                                      context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 56.w,
                      height: 56.h,
                      padding: EdgeInsets.all(16.h),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: AppColors.redTransparent.withOpacity(0.1),
                      ),
                      child: SvgPicture.asset(
                        AppImagesRoute.iconFilter,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    margin: EdgeInsets.only(
                        right: index == 4 ? 24 : 0, left: index == 0 ? 24 : 12),
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'South Korea',
                      style: theme.textTheme.bodyLarge!.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    childCount: 6,
                    (context, index) => MovieCardItem(
                        itemIndex: index,
                        itemCount: 5,
                        movieCategory: 'new_movies',needsSpacing: false,),),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 2.6,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    crossAxisCount: 2),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }
}
