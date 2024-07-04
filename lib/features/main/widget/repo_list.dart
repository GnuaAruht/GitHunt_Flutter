part of '../main_page.dart';

class _RepoListWidget extends StatelessWidget {
  final List<Repository> repositories;

  const _RepoListWidget({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: repositories.length,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 12.0),
      itemBuilder: (context, index) {
        return _RepoItemWidget(repo: repositories[index]);
      },
    );
  }
}

class _RepoItemWidget extends StatelessWidget {
  final Repository repo;

  const _RepoItemWidget({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      constraints: const BoxConstraints(minHeight: 200.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: defaultBoxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleRow(),
          const SizedBox(height: 18.0),
          _buildRepoContent(),
          const SizedBox(height: 18.0),
          _buildRepoTagRow()
        ],
      ),
    );
  }

  Widget _buildRepoContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          repo.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFF4A6EFB),
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          repo.description ?? 'No description given.',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildRepoTagRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (repo.languageName != null) _LanguageTag(languageName: repo.languageName),
        _StarTag(count: repo.stargazersCount ?? 0),
        _ForkTag(count: repo.forks ?? 0),
        _IssueTag(count: repo.openIssues ?? 0),
      ],
    );
  }

  Widget _buildTitleRow() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(defaultRadius),
          child: CachedNetworkImage(
            imageUrl: repo.owner.avatarUrl,
            width: 50.0,
            height: 50.0,
            placeholder: (context, url) => const ColoredBox(color: Colors.grey),
            errorWidget: (_, url, __) => const ColoredBox(color: Colors.grey),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                repo.owner.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(repo.created.toTitleFormat()),
            ],
          ),
        )
      ],
    );
  }
}

class _StarTag extends _Tag {
  const _StarTag({super.key, required super.count})
      : super(assetSvgUrl: "assets/svg/star.svg");
}

class _IssueTag extends _Tag {
  const _IssueTag({super.key, required super.count})
      : super(assetSvgUrl: "assets/svg/issue.svg");
}

class _ForkTag extends _Tag {
  const _ForkTag({super.key, required super.count})
      : super(assetSvgUrl: "assets/svg/fork.svg");
}

class _Tag extends StatelessWidget {
  final String assetSvgUrl;
  final int count;

  const _Tag({
    super.key,
    required this.assetSvgUrl,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          assetSvgUrl,
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        ),
        const SizedBox(width: 6.0),
        Text(NumberFormat('#,###').format(count))
      ],
    );
  }
}

class _LanguageTag extends StatelessWidget {
  final String? languageName;

  const _LanguageTag({super.key, required this.languageName});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.read<MainProvider>();
    return FutureBuilder<Language?>(
      future: mainProvider.getLanguageByName(languageName ?? ''),
      builder: (context, snapshot) {
        if (snapshot.hasData) return _buildContent(snapshot.data!);
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildContent(Language language) {
    return Row(
      children: [
        CircleAvatar(radius: 6.0, backgroundColor: language.color),
        const SizedBox(width: 4.0),
        Text(language.title)
      ],
    );
  }

}
