// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:counter_apk_bloc/bloc/user/user_bloc.dart';
import 'package:counter_apk_bloc/model/user_model.dart';
import 'package:counter_apk_bloc/page/page_data/add_edit/edit_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageList extends StatefulWidget {
  HomePageList({Key? key}) : super(key: key);

  @override
  State<HomePageList> createState() => _HomePageListState();
}

class _HomePageListState extends State<HomePageList> {
  @override
  Widget build(BuildContext context) {
    UserBloc userb = context.read<UserBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page list"),
        actions: [],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: userb,
        builder: (context, state) {
          if (state.allUser.isEmpty) {
            return const Center(
              child: Text(
                "Tidak ada data",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          }
          return Container(
            height: 500,
            child: ListView.builder(
              itemCount: state.allUser.length,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                User item = state.allUser[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Text("$index"),
                    ),
                    title: Text("${item.name}"),
                    subtitle: Text("${item.age}"),
                    trailing: IconButton(
                      onPressed: () async {
                        userb.add(DeleteUserEvent(item));
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 24.0,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddEditPage(
                                  item: item,
                                )),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditPage()),
          );
        },
      ),
    );
  }
}
