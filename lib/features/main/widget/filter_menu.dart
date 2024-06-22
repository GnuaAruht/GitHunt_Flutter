part of '../main_page.dart';

class _FilterMenu extends StatelessWidget {
  const _FilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _LanguageFilterButton(),
        SizedBox(width: defaultPadding),
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
        // todo update selected filter
      },
      itemBuilder: (BuildContext context) => DateFilter.values
          .map(
            (filter) => PopupMenuItem<DateFilter>(
              value: filter,
              child: Text(filter.title),
            ),
          )
          .toList(),
      child: const _FilterBtnContainer(
        child: Row(
          children: [
            Icon(
              Icons.calendar_month_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 8.0),
            Text('Weekly')
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
        context
            .push<LanguageModel>(RouteConst.languageFilterPath)
            .then((language) {
          // todo add refresh main page
          if(language != null) {
            log(language.name,name: 'Selected Language');
          }
        });
      },
      child: const _FilterBtnContainer(
        child: Row(
          children: [
            Icon(Icons.filter_alt_sharp, color: Colors.black),
            SizedBox(width: 8.0),
            Text('Kotlin')
          ],
        ),
      ),
    );
  }
}

class _FilterBtnContainer extends StatelessWidget {
  final Widget child;

  const _FilterBtnContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      constraints: const BoxConstraints(minWidth: 100.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 0.8,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
