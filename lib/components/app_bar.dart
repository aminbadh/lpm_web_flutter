import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.white, //const Color(0xFF191919)
            elevation: 4,
            child: SizedBox(
              height: 56,
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      // splashColor: Colors.transparent,
                      // hoverColor: Colors.transparent,
                      // highlightColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(2),
                          child: Image.asset("assets/lpm_logo.png"),
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 18),
                        child: Column(
                          children: const [
                            Icon(Icons.home_outlined),
                            Expanded(child: SizedBox()),
                            Text(
                              "Home",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 18),
                        child: Column(
                          children: const [
                            Icon(Icons.article_outlined, size: 22),
                            Expanded(child: SizedBox()),
                            Text(
                              "Articles",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/articles"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 18),
                        child: Column(
                          children: const [
                            Icon(Icons.groups_outlined),
                            Expanded(child: SizedBox()),
                            Text(
                              "Clubs",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () => Navigator.of(context).pushNamed("/clubs"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 46,
                    child: Builder(builder: (context) {
                      return InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 18),
                          child: Column(
                            children: const [
                              Icon(Icons.more_horiz_outlined),
                              Expanded(child: SizedBox()),
                              Text(
                                "More",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        onTap: () {
                          Offset offset = const Offset(0, -55);

                          final RenderBox button =
                              context.findRenderObject() as RenderBox;
                          final RenderBox overlay = Overlay.of(context)
                              ?.context
                              .findRenderObject() as RenderBox;
                          final RelativeRect position = RelativeRect.fromRect(
                            Rect.fromPoints(
                              button.localToGlobal(Offset.zero,
                                  ancestor: overlay),
                              button.localToGlobal(
                                  button.size.bottomRight(Offset.zero),
                                  ancestor: overlay),
                            ),
                            offset & overlay.size,
                          );

                          showMenu(
                              context: context,
                              position: position,
                              items: <PopupMenuEntry<String>>[
                                PopupMenuItem<String>(
                                  value: "/students",
                                  child: Row(
                                    children: const [
                                      Icon(Icons.star_border, size: 20),
                                      SizedBox(width: 12),
                                      Text(
                                        'Success Stories',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: "/contact",
                                  child: Row(
                                    children: const [
                                      Icon(Icons.question_answer_outlined,
                                          size: 20),
                                      SizedBox(width: 12),
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  value: "/about",
                                  child: Row(
                                    children: const [
                                      Icon(Icons.info_outline, size: 20),
                                      SizedBox(width: 12),
                                      Text(
                                        'About Us',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ]).then(
                            (selectedValue) {
                              if (selectedValue != null) {
                                Navigator.of(context).pushNamed(selectedValue);
                              }
                              // if (Navigator.canPop(context)) {
                              //   Navigator.pop(context);
                              // }
                            },
                          );
                        },
                      );
                    }),
                  ),
                  // Theme(
                  //   data: Theme.of(context).copyWith(
                  //     tooltipTheme: const TooltipThemeData(
                  //       decoration: BoxDecoration(
                  //         color: Colors.transparent,
                  //       ),
                  //     ),
                  //   ),
                  //   child: SizedBox(
                  //     height: 46,
                  //     child: PopupMenuButton(
                  //       child: InkWell(
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               vertical: 4, horizontal: 18),
                  //           child: Column(
                  //             children: const [
                  //               Icon(Icons.more_horiz_outlined),
                  //               Expanded(child: SizedBox()),
                  //               Text(
                  //                 "More",
                  //                 style: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         customBorder: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //         ),
                  //         onTap: () => ,
                  //       ),
                  //       tooltip: "",
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8),
                  //       ),
                  //       itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  //         const PopupMenuItem(
                  //           child: ListTile(
                  //             leading: Icon(Icons.add),
                  //             title: Text('Item 1'),
                  //           ),
                  //         ),
                  //         const PopupMenuItem(
                  //           child: ListTile(
                  //             leading: Icon(Icons.anchor),
                  //             title: Text('Item 2'),
                  //           ),
                  //         ),
                  //         const PopupMenuItem(
                  //           child: ListTile(
                  //             leading: Icon(Icons.article),
                  //             title: Text('Item 3'),
                  //           ),
                  //         ),
                  //         const PopupMenuDivider(),
                  //         const PopupMenuItem(child: Text('Item A')),
                  //         const PopupMenuItem(child: Text('Item B')),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search_outlined),
                        ),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            Navigator.of(context).pushNamed("/search");
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 18),
                        child: Column(
                          children: const [
                            Icon(Icons.dark_mode_outlined, size: 21),
                            Expanded(child: SizedBox()),
                            Text(
                              "Dark Mode",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    height: 46,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 18),
                        child: Column(
                          children: const [
                            Icon(Icons.language_outlined, size: 22),
                            Expanded(child: SizedBox()),
                            Text(
                              "العربية",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                      height: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 112,
                    child: Builder(builder: (context) {
                      // return Row(
                      //   children: [
                      //     SizedBox(
                      //       height: 46,
                      //       child: InkWell(
                      //         child: Padding(
                      //           padding: const EdgeInsets.symmetric(
                      //               vertical: 4, horizontal: 18),
                      //           child: Column(
                      //             children: const [
                      //               Icon(Icons.apps_outlined, size: 22),
                      //               Expanded(child: SizedBox()),
                      //               Text(
                      //                 "Apps",
                      //                 style: TextStyle(
                      //                   fontSize: 12,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //         customBorder: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(8),
                      //         ),
                      //         onTap: () {},
                      //       ),
                      //     ),
                      //     const SizedBox(width: 12),
                      //     Container(
                      //       margin: const EdgeInsets.symmetric(vertical: 2),
                      //       width: 36,
                      //       height: 36,
                      //       decoration: BoxDecoration(
                      //         color: Colors.deepOrangeAccent,
                      //         borderRadius: BorderRadius.circular(100),
                      //       ),
                      //     ),
                      //   ],
                      // );

                      // return const Center(
                      //   child: CircularProgressIndicator(),
                      // );

                      return OutlinedButton(
                        onPressed: () => setState(() => _isOpen = true),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          "SIGN IN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          top: 68,
          left: _isOpen ? maxWidth - 370 : maxWidth + 20,
          curve: Curves.ease,
          child: Card(
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "Who Are You?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => setState(() => _isOpen = false),
                        icon: const Icon(Icons.close_outlined),
                        splashRadius: 24,
                        tooltip: "Close",
                      ),
                      const SizedBox(width: 12),
                    ],
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text("Student"),
                    leading: const Icon(Icons.person_outline_outlined),
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              width: 500,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Text(
                                          "Sign In To Your LPM Account",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        icon: const Icon(Icons.close_outlined),
                                        splashRadius: 24,
                                        tooltip: "Close",
                                      ),
                                      const SizedBox(width: 12),
                                    ],
                                  ),
                                  const Divider(),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  ListTile(
                    title: const Text("Teacher"),
                    leading: const Icon(Icons.person_outline_outlined),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Administrator"),
                    leading: const Icon(Icons.person_outline_outlined),
                    onTap: () {},
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
