import 'package:flutter/material.dart';
import 'package:todo_bloc/utils/app_strings.dart';
import 'package:todo_bloc/views/home/tabs/pending_view.dart';

import 'tabs/done_view.dart';
import 'tabs/inprogress_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: AppStrings.pending),
              Tab(text: AppStrings.inProgress),
              Tab(text: AppStrings.done),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PendingView(),
            InProgressView(),
            DoneView(),
          ],
        ),
      ),
    );
  }
}
