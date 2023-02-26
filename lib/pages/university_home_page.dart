import 'package:eduapp/pages/view_univer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/university_cubit.dart';

class UniversityHomePage extends StatefulWidget {
  const UniversityHomePage({Key? key}) : super(key: key);

  @override
  State<UniversityHomePage> createState() => _UniversityHomePageState();
}

class _UniversityHomePageState extends State<UniversityHomePage> {
  final name = TextEditingController();

  void _incrementCounter(BuildContext con) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Name"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(controller: name),
              ],
            ),
            actions: [
              ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    con.read<UniversityCubit>().getInfo(name.text);
                    name.clear();
                  },
                  child: const Text("Save"))
            ],
          );
        });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<UniversityCubit>().getLocal();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc && Hive"),
      ),
      body: BlocBuilder<UniversityCubit, UniversityState>(
        builder: (context, state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  itemCount: state.university?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ViewUniversPage(
                                    data: state.university?[index])));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(14)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(state.university?[index].name ?? ""),
                                Text(state.university?[index].univers.length
                                        .toString() ??
                                    "0"),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<UniversityCubit>()
                                      .deleteUniversity(index);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
