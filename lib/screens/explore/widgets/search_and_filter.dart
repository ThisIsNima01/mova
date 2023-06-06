import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mova/config/global/constants/app_static_data.dart';
import 'package:mova/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../../../config/global/constants/image_routes.dart';
import '../../../config/global/utils/show_modal.dart';
import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_theme.dart';
import 'modal_item.dart';

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
    return const SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
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
    return GestureDetector(
      onTap: () => showAppModal(
        context: context,
        initChildSize: .7,
        minChildSize: .4,
        maxChildSize: .9,
        modalTitle: 'Sort & Filter',
        primaryButtonTitle: 'Apply',
        secondaryButtonTitle: 'Reset',
        mainModalContent: Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppStaticData.exploreModalTitles.length,
            itemBuilder: (context, index) => ExploreModalItem(index: index),
          ),
        ),
      ),
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



