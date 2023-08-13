import 'package:byam_wallet/Sample.dart';
import 'package:byam_wallet/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListUsers extends StatefulWidget {
  const ListUsers({super.key});

  @override
  State<ListUsers> createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  final List<String> unread = [
    'tunai',
    'belum tunai',
    'tunai',
    'tunai',
    'belum tunai',
    'tunai',
    'tunai',
    'tunai',
    'tunai',
    'tunai'
  ];

  final List<Map<String, dynamic>> names = [
    {'name': 'Robith', 'nik': 'KMDS500185', 'code_jb': 'MDR'},
    {'name': 'Nandi', 'nik': 'KMDS500184', 'code_jb': 'MDR'},
    {'name': 'Dudi', 'nik': 'KMDS500183', 'code_jb': 'MDR'},
    {'name': 'Jajat', 'nik': 'KMDS500182', 'code_jb': 'MDR'},
    {'name': 'Bambang', 'nik': 'KMDS500177', 'code_jb': 'SG'},
    {'name': 'Indra', 'nik': 'KMDS500181', 'code_jb': 'MDR'},
    {'name': 'Pirman', 'nik': 'KMDS500180', 'code_jb': 'MDR'},
    {'name': 'Erwin', 'nik': 'KMDS500179', 'code_jb': 'MDR'},
    {'name': 'Ujang', 'nik': 'KMDS500178', 'code_jb': 'MDR'},
    {'name': 'Fulan', 'nik': 'KMDS500176', 'code_jb': 'SG'},
  ];

  List<Color> itemColor = [
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight,
    bgColorLight
  ];

  Object a = {'name': 'ga'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Byam Wallet',
          style: fontSourceSansProSemiBold.copyWith(
            fontSize: 26.0,
            color: textColor,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: bgColorLight,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTapDown: (a) => changeColor(a, index),
              onTapUp: (a) => revertColor(a, index),
              onTap: () => context.goNamed('users/detail',
                  extra: Sample(title: names[index]['name'])),
              onTapCancel: () => revertColor(null, index),
              onHover: (hovered) => hoverColor(hovered, index),
              child: Container(
                height: 70,
                color: itemColor[index],
                margin: const EdgeInsets.only(bottom: 6.0, top: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            names[index]['name'],
                            style: fontSourceSansProSemiBold.copyWith(
                              fontSize: 16.0,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "${names[index]['nik']} - R",
                            style: fontSourceSansProRegular.copyWith(
                              fontSize: 14.0,
                              color: textColorSubtitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            names[index]['code_jb'],
                            style: fontSourceSansProRegular.copyWith(
                              fontSize: 14.0,
                              color: textColorSubtitle,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            width: 100,
                            height: 22,
                            decoration: unread[index] == 'tunai'
                                ? BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: gradientColorGreen),
                                    borderRadius: BorderRadius.circular(50.0),
                                  )
                                : BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: gradientColorRed),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                            child: Center(
                              child: Text(
                                unread[index],
                                style: fontSourceSansProRegular.copyWith(
                                    fontSize: 11.0, color: bgColorLight),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void hoverColor(bool hovered, int idx) {
    setState(() {
      if (hovered) {
        itemColor[idx] = bgColorLightHover;
      } else {
        itemColor[idx] = bgColorLight;
      }
    });
  }

  void changeColor(TapDownDetails a, int idx) {
    setState(() {
      itemColor[idx] = bgColorLightTap;
    });
  }

  void revertColor(TapUpDetails? a, int idx) {
    setState(() {
      itemColor[idx] = bgColorLight;
    });
  }
}
