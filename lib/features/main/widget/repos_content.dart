part of '../main_page.dart';

class _ReposContent extends StatelessWidget {
  const _ReposContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RepoListTitleWidget(),
        SizedBox(height: defaultPadding),
        _RepoListWidget(),
      ],
    );
  }
}
