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
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 0.8,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Row(
        children: [
          Icon(Icons.calendar_month_outlined, color: Colors.black),
          SizedBox(width: 8.0),
          Text('Weekly')
        ],
      ),
    );
  }

}

class _LanguageFilterButton extends StatelessWidget {
  const _LanguageFilterButton({super.key});

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
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 0.8,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Row(
        children: [
          Icon(Icons.filter_alt_sharp, color: Colors.black),
          SizedBox(width: 8.0),
          Text('Kotlin')
        ],
      ),
    );
  }
}
