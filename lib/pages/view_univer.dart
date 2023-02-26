import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../Model/university_model.dart';

class ViewUniversPage extends StatefulWidget {
  final UniverResponse? data;

  const ViewUniversPage({Key? key, required this.data}) : super(key: key);

  @override
  State<ViewUniversPage> createState() => _ViewUniversPageState();
}

class _ViewUniversPageState extends State<ViewUniversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data?.name ?? ""),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          itemCount: widget.data?.univers.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
              child: Column(
                children: [
                  Text(widget.data?.univers[index].name ?? ""),
                  TextButton(
                      onPressed: () async {
                        final Uri launchUri = Uri(
                            scheme: 'URL',
                            path: widget.data?.univers[index].domains?.first ??
                                "");
                        await url_launcher.launchUrl(launchUri,
                            mode: LaunchMode.externalApplication);
                      },
                      child: Text(
                        widget.data?.univers[index].domains?.first ?? "",
                        style: const TextStyle(color: Colors.black),
                      )),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: "Rangini o'zgartirish",
        onPressed: () => setState(() {}),
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
