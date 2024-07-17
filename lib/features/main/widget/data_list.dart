part of '../main_page.dart';

class _SuccessContent extends StatelessWidget {
  const _SuccessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          // check if token banner should show
          _buildBanner(),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                const _FilterMenu(),
                const SizedBox(height: defaultPadding * 1.5),
                const _MainDataList(),
                _buildListStatus(),
                const SizedBox(height: defaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return Selector<MainProvider, bool>(
      selector: (_, provider) => provider.shouldShowBanner,
      builder: (_, show, __) {
        return AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: show ? const _TokenAlertWidget() : const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildListStatus() {
    return Selector<MainProvider, bool>(
      selector: (_, provider) => provider.repositoriesData.isEmpty,
      child: const _ListStatusWidget(),
      builder: (context, isEmpty, child) {
        return isEmpty ? const SizedBox.shrink() : child!;
      },
    );
  }

}

class _MainDataList extends StatelessWidget {
  const _MainDataList({super.key});

  @override
  Widget build(BuildContext context) {

    final dataList = context.select<MainProvider, List<RepositoriesData>>(
        (provider) => provider.repositoriesData);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: dataList.isNotEmpty ?
          _buildDataList(dataList) :
          _buildNoDataWidget(),
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

  Widget _buildNoDataWidget() {
    return Container(
      width: double.infinity,
      height: 200.0,
      alignment: Alignment.center,
      child: const Text('No data list'),
    );
  }

}
