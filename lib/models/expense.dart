//Here we make a blueprint of our data model using MVC architecture

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

//A special kind of class used to represent a fixed number of constant value
//here Category is a datatype having these four fixed values
enum Category {food, work, leisure, travel}

//map
const categoryIcon = {
  Category.food : Icons.lunch_dining,
  Category.work : Icons.work,
  Category.leisure : Icons.movie,
  Category.travel : Icons.car_repair
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.dt,
    required this.category,
  }) : id = uuid.v4(); //initializer list, will initiate whenever new obj created

  final String id;
  final String title;
  final double amount;
  final DateTime dt;
  final Category category;

  String getdateformatter(){
    return DateFormat.yMd().format(dt);
  }
}
