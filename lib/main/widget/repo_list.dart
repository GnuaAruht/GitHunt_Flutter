part of '../main_page.dart';

class _RepoListWidget extends StatelessWidget {
  const _RepoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _RepoListTitleWidget(),
        const SizedBox(height: defaultPadding),
        ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => const SizedBox(height: 12.0),
          itemBuilder: (context, index) => const _RepoItemWidget(),
        ),
      ],
    );
  }
}

class _RepoListTitleWidget extends StatelessWidget {
  const _RepoListTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
        ),
        text: 'This week\t',
        children: [
          TextSpan(
            text: 'June 13, 2024 - June 20, 2024',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}

class _RepoItemWidget extends StatelessWidget {
  const _RepoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 1.4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
              ),
              const SizedBox(width: 12.0),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User name',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('12 June, 2024'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 18.0),
          const Text(
            'Repository name',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xFF4A6EFB),
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            _repoDescription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 18.0),
          const Row(
            children: [
              Expanded(child: _LanguageTag()),
              Expanded(child: _StarTag()),
              Expanded(child: _ForkTag()),
              Expanded(child: _IssueTag()),
            ],
          )
        ],
      ),
    );
  }
}

class _IssueTag extends StatelessWidget {
  const _IssueTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/issue.svg",
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        ),
        const SizedBox(width: 6.0),
        const Text("12")
      ],
    );
  }
}

class _ForkTag extends StatelessWidget {
  const _ForkTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/fork.svg",
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        ),
        const SizedBox(width: 6.0),
        const Text("12")
      ],
    );
  }
}

class _StarTag extends StatelessWidget {
  const _StarTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/star.svg",
          colorFilter: const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
        ),
        const SizedBox(width: 6.0),
        const Text("12")
      ],
    );
  }
}

class _LanguageTag extends StatelessWidget {
  const _LanguageTag({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(radius: 6.0, backgroundColor: Colors.teal),
        SizedBox(width: 6.0),
        Text('Dart')
      ],
    );
  }
}

const _repoDescription =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at odio eros. Duis sagittis dapibus fermentum. Maecenas cursus ipsum sit amet lacinia ornare.";
