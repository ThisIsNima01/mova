import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova/screens/explore/widgets/movie_filters.dart';
import 'package:mova/theme_notifier.dart';
import 'package:provider/provider.dart';

import '../../../config/global/constants/image_routes.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_theme.dart';

class SearchAndFilter extends StatefulWidget {
  const SearchAndFilter({
    super.key,
  });

  @override
  State<SearchAndFilter> createState() => _SearchAndFilterState();
}

class _SearchAndFilterState extends State<SearchAndFilter> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: const [
            SearchField(),
            SizedBox(width: 12),
            FilterButton(),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          barrierColor: const Color(0xff09101D).withOpacity(0.7),
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DraggableScrollableSheet(
              initialChildSize: .7,
              minChildSize: .4,
              maxChildSize: .9,
              builder: (context, scrollController) => Container(
                padding: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                  color: AppDynamicColorBuilder.getWhiteAndDark2(context),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      SizedBox(
                        height: 24,
                        width: double.infinity,
                        child: Text(
                          'Sort & Filter',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium!
                              .copyWith(color: AppColors.error),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Divider(
                        color:
                            AppDynamicColorBuilder.getDark3AndGrey200(context),
                        thickness: 1,
                      ),
                      const SizedBox(height: 24),
                      FilterTitle(title: 'Categories'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: MovieFilters(selectedIndex: 3),
                      ),
                      FilterTitle(title: 'Regions'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: MovieFilters(selectedIndex: 4),
                      ),
                      FilterTitle(title: 'Genre'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: MovieFilters(selectedIndex: 2),
                      ),
                      FilterTitle(title: 'Time/Periods'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: MovieFilters(selectedIndex: 0),
                      ),
                      FilterTitle(title: 'Sort'),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: MovieFilters(selectedIndex: 1),
                      ),
                      Divider(
                        color:
                            AppDynamicColorBuilder.getDark3AndGrey200(context),
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 58.h,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: AppDynamicColorBuilder
                                        .getPrimary100AndDark3(context),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  child: Text(
                                    'Reset',
                                    style: theme.textTheme.bodyLarge!.copyWith(
                                      color: AppDynamicColorBuilder
                                          .getPrimaryAndWhite(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 58.h,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: theme.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Apply',
                                      style: theme.textTheme.bodyLarge!
                                          .copyWith(color: AppColors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: Container(
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
      ),
    );
  }
}

class FilterTitle extends StatelessWidget {
  String title;

  FilterTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: theme.textTheme.headlineSmall!.copyWith(
          color: AppDynamicColorBuilder.getGrey800AndWhite(context),
        ),
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    searchFocusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Consumer<ThemeNotifier>(
      builder: (context, value, child) => Expanded(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 56.h,
          decoration: BoxDecoration(
            color: AppDynamicColorBuilder.getGrey100AndDark2(context),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: searchFocusNode.hasFocus
                  ? theme.primaryColor
                  : AppDynamicColorBuilder.getGrey100AndDark2(context),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            focusNode: searchFocusNode,
            style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppDynamicColorBuilder.getGrey900AndWhite(context)),
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search',
              hintStyle: theme.textTheme.bodyMedium!.copyWith(
                  color: AppDynamicColorBuilder.getGrey600AndGrey400(context),
                  fontWeight: FontWeight.w500),
              icon: SvgPicture.asset(
                AppImagesRoute.iconSearch,
                color: searchFocusNode.hasFocus
                    ? theme.primaryColor
                    : AppDynamicColorBuilder.getGrey600AndGrey400(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
