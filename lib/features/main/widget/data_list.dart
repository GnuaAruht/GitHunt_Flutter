part of '../main_page.dart';

class _MainDataList extends StatelessWidget {
  const _MainDataList({super.key});

  @override
  Widget build(BuildContext context) {

    final dataList = context.select<MainProvider, List<RepositoriesData>>(
        (provider) => provider.repositoriesData);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: dataList.isNotEmpty
          ? _buildDataList(dataList)
          : const Center(child: Text('No data list')),
    );
  }

  Widget _buildDataList(List<RepositoriesData> repoDataList) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: repoDataList.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: defaultPadding * 2),
      itemBuilder: (context, index) {
        final data = repoDataList[index];
        return _RepositoriesData(data: data);
      },
    );
  }
}
