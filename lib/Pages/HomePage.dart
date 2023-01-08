import 'package:eduapp/repository/get_information.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:url_launcher/url_launcher_string.dart';

import '../Model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Info> listOfData = [];
  int? status;
  bool isLoading = true;

  Future getInfo(String? country) async {
    isLoading = true;
    setState(() {});

    var data = GetInformationRepository.getInformation(country);
    status= GetInformationRepository.status;
    print(data);
    print(status);

    data.forEach((e) {
      listOfData.add(Info.convertJson(e));
    });
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInfo('Uzbekistan');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
          itemCount: listOfData.length,
          itemBuilder: (context, index) {
            return Container(
              margin:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              padding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xffBDBFC4),
              ),
              child: Column(
                children: [
                  Text(listOfData[index].name ?? " "),
                  const SizedBox(
                    height: 7,
                  ),
                  TextButton(
                      onPressed: () async {
                        final Uri launchUri = Uri(scheme: 'URL',
                            path: listOfData[index].webPages?[0] ?? "");
                        await url_launcher.launchUrl(launchUri,mode: LaunchMode.externalApplication);
                      },
                      child: Text(listOfData[index].domains?[0] ?? " ")),
                  TextButton(
                      onPressed: () async {
                        final Uri launchUri = Uri(scheme: 'tel',
                            path: '+998933270279');
                        await url_launcher.launchUrl(launchUri,mode: LaunchMode.externalApplication);
                      },
                      child: const Text('tel'),),
                ],
              ),
            );
          }),
    );
  }
}
