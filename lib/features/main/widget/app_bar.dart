part of '../main_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 4.0,
      title: const Row(
        children: [
          CircleAvatar(
              radius: 28.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/logo.png')),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GitHunt',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
              Text(
                'Most starred projects on Github',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ],
      ),
      // bottom: PreferredSize(
      //   preferredSize: const Size.fromHeight(50.0),
      //   child: Container(
      //     width: double.infinity,
      //     height: 50.0,
      //     color: Colors.green,
      //   ),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
