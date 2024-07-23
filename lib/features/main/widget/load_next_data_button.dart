part of '../main_page.dart';

class _LoadNextDataButton extends StatelessWidget {
  const _LoadNextDataButton({super.key});

  @override
  Widget build(BuildContext context) {

    final dateFilter = context
        .select<MainProvider, DateFilter>((provider) => provider.dateFilter);

    return InkWell(
      onTap: () => context.read<MainProvider>().loadData(),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding * 0.8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: getBoxShadow(context),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.sync, color: Colors.white),
            const SizedBox(width: 8.0),
            Text(
              'Load next ${dateFilter.status}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

}