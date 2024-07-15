part of '../main_page.dart';

class _FilterMenu extends StatelessWidget {
  const _FilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _LanguageFilterButton(),
        SizedBox(width: defaultPadding / 2),
        _DateFilterButton()
      ],
    );
  }
}

class _DateFilterButton extends StatelessWidget {
  const _DateFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: const Offset(0, 1),
      position: PopupMenuPosition.under,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onSelected: (filter) {
        // add some delay for pop up dismiss
        Future.delayed(const Duration(milliseconds: 280)).whenComplete(() {
          context.read<MainProvider>().updateDateFilter(filter);
        });
      },
      itemBuilder: (BuildContext context) => DateFilter.values
          .map(
            (filter) => PopupMenuItem<DateFilter>(
              value: filter,
              child: Text(filter.title),
            ),
          )
          .toList(),
      child: _FilterBtnContainer(
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month_outlined,
              color: Colors.black,
            ),
            const SizedBox(width: 8.0),
            Selector<MainProvider, DateFilter>(
              selector: (_, provider) => provider.dateFilter,
              builder: (_, filter, __) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(key: UniqueKey(), filter.title),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LanguageFilterButton extends StatelessWidget {
  const _LanguageFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LanguageFilterBottomSheet.show(context).then((language) {
          if (language != null) {
            context.read<MainProvider>().updateLanguage(language.title);
          }
        });
      },
      child: _FilterBtnContainer(
        child: Row(
          children: [
            const Icon(Icons.filter_alt_sharp, color: Colors.black),
            const SizedBox(width: 8.0),
            Selector<MainProvider, String?>(
              selector: (_, provider) => provider.language,
              builder: (_, language, __) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Text(key: UniqueKey(), language ?? 'All languages'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _FilterBtnContainer extends StatelessWidget {

  final Widget child;
  final double minWidth;

  const _FilterBtnContainer({super.key,this.minWidth = 100.0,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      constraints: BoxConstraints(minWidth: minWidth),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: defaultBoxShadow,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
