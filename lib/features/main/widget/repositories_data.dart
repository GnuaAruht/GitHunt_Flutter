part of '../main_page.dart';

class _RepositoriesData extends StatelessWidget {
  final RepositoriesData data;
  const _RepositoriesData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RepoListTitleWidget(),
        const SizedBox(height: defaultPadding),
        _RepoListWidget(repositories: data.repositories),
      ],
    );
  }

}
