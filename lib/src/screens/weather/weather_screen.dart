import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather/src/common/constant/color_constans.dart';
import 'package:weather/src/common/constant/padding_constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/src/common/widgets/custom_button.dart';
import 'package:weather/src/screens/weather/bloc/load_bloc.dart';

import '../../common/widgets/custom_text.dart';
import '../../common/widgets/custom_text_filed.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();
    return CupertinoPageScaffold(
        backgroundColor: AppColors.background,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: AppPaddings.horizontal,
                // Text Field <City>
                child: CustomTextField(cityController: cityController),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: AppPaddings.horizontal,
                child: BlocConsumer<LoadBloc, LoadState>(
                  listener: (context, state) {
                    if(state is LoadLoaded){
                      showCupertinoDialog(
                        context: context, 
                        builder: (context){
                          return Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children:  [
                                  const Spacer(),
                                  Image.network('https:' + state.image!, height: 64,),
                                  CustomText(text: state.status!),
                                  CustomText(text: state.temp_c.toString()),
                                  const Spacer(),
                                  Padding(
                                    padding: AppPaddings.horizontal,
                                    child: CustomButton(text: 'Close',onPressed: () => Navigator.of(context).pop(),),
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    }else if(state is LoadFailed){
                      showCupertinoModalPopup(
                        context: context, 
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const  Text('Ошибка'),
                            content: Text(state.message ?? ''),
                            actions: [
                              CupertinoButton(
                                child: const Text('OK'), 
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          );
                        }
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      text: 'Search',
                      onPressed: state is LoadLoading ? null :() {
                        context.read<LoadBloc>().add(
                          LoadPressed(
                            city: cityController.text,
                          ),                                      
                        );
                      });
                    },
                  ),
                ),
            ],
        )
      )
    );
  }
}