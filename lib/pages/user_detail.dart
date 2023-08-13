import 'dart:developer';

import 'package:byam_wallet/Sample.dart';
import 'package:flutter/material.dart';

import '../app_style.dart';

class UserDetail extends StatefulWidget {
  Sample? name;
  UserDetail({super.key, this.name});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    log(widget.name!.title);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            elevation: 0.5,
            leadingWidth: 42.0,
            leading: IconButton(
              icon: Image.asset('assets/icons/back_icon.png'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            titleSpacing: -3,
            title: Text(
              widget.name!.title,
              style: fontSourceSansProMedium.copyWith(
                fontSize: 18.0,
                color: textColor,
              ),
            ),
          )),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      'Full Name',
                      style: fontSourceSansProRegular.copyWith(
                          fontSize: 20.0, color: textColor),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Robith Syaukil Islam',
                    style: fontSourceSansProMedium.copyWith(
                        fontSize: 16.0, color: textColor),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Text(
                      'NIK',
                      style: fontSourceSansProRegular.copyWith(
                          fontSize: 20.0, color: textColor),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'KMDS500000123',
                    style: fontSourceSansProMedium.copyWith(
                        fontSize: 16.0, color: textColor),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: null,
                      style: fontSourceSansProMedium.copyWith(fontSize: 16.0),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
