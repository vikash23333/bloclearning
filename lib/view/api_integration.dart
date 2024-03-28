import 'package:bloclearning/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc/bloc/api_integration_bloc.dart';

class ApiIntegration extends StatefulWidget {
  const ApiIntegration({super.key});

  @override
  State<ApiIntegration> createState() => _ApiIntegrationState();
}

class _ApiIntegrationState extends State<ApiIntegration> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<ApiIntegrationBloc>().add(PostFetchEvent());
  }
  @override
  Widget build(BuildContext context) {
    //ApiIntegrationBloc
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ApiIntegrationBloc,ApiIntegrationState>(
          builder: (context, state) {
            if (state.apiStatus==ApiLoadingStatus.loading) {
              return const Center(child: CircularProgressIndicator(),);
            }else if(state.apiStatus==ApiLoadingStatus.loading){
              return Center(child: Text(state.message),);

            }
            return Visibility(
              visible: state.commentList.isNotEmpty,
              replacement:const Center(child: Text('NO data found'),),
              child: ListView.builder(
                itemCount: state.commentList.length,
                itemBuilder: (context, index) =>  Padding(
                  padding:const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Text('${state.commentList[index].id}'),
                        Text('${state.commentList[index].name}'),
                        Text('${state.commentList[index].email}'),
                        Text('${state.commentList[index].postId}'),
                        Text('${state.commentList[index].body}'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>context.read<ApiIntegrationBloc>().add(PostFetchEvent()), child: const Icon(Icons.add)),
      ),
    );
  }
}
