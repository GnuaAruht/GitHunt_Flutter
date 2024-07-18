part of '../main_page.dart';

class _RepoListTitleWidget extends StatelessWidget {
  final DateTime fromDate, toDate;

  const _RepoListTitleWidget({
    super.key,
    required this.fromDate,
    required this.toDate,
  });

  @override
  Widget build(BuildContext context) {
    final dateFilter = context.read<MainProvider>().dateFilter;
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        ),
        text: '${timeago.format(fromDate)}\t',
        children: [
          TextSpan(
            text: (dateFilter == DateFilter.daily)
                ? fromDate.toTitleFormat()
                : '${fromDate.toTitleFormat()} - ${toDate.toTitleFormat()}',
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
