import 'dart:developer';
import 'package:final_project/core/utils/constant_var.dart';
import 'package:final_project/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/network/network.dart';
import 'nutrition_states.dart';

class NutritionCubit extends Cubit<NutritionStates> {
  NutritionCubit() : super(InitialState());
  static NutritionCubit get(context) => BlocProvider.of(context);


  List<CategoryModel> categories = [];
  void getCategories()async {
    emit(GetCategoriesLoadingState());
    try {
      var result = await NetworkHelper.instance.get(endPoint: EndPoints.categories,
          host: EndPoints.dietHost,
          apiKey: ketoApiKey
          //"44f3f861ccmshc044140944ff801p1e7238jsna57f89e73123",
      );
      debugPrint(result.data.toString());
      List<dynamic> responseData = result.data;
      categories = responseData.map((item) => CategoryModel.fromJson(item)).toList();
      //categories.add(CategoryModel.fromJson(result.data));
      emit(GetCategoriesSuccessState());
    } catch (e) {
      emit(GetCategoriesErrorState());
      log(e.toString(), name: "Meals Categories Info Lose Weight Cubit");
    }
  }

List<Recipe> recipes = [];
  void getAllCategories(int id)async {
    emit(GetAllCategoriesLoadingState());
    try {
      var result = await NetworkHelper.instance.get(endPoint: "${EndPoints.allCategories}${id.toString()}",
          host: EndPoints.dietHost,
          apiKey: ketoApiKey,);
      debugPrint(result.data.toString());
      List<dynamic> responseData = result.data;
      recipes = responseData.map((item) => Recipe.fromJson(item)).toList();
      emit(GetAllCategoriesSuccessState());
    } catch (e) {
      emit(GetAllCategoriesErrorState());
      log(e.toString(), name: "Meals Categories Info Lose Weight Cubit");
    }
  }
}
