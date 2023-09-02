import 'package:flutter/material.dart';

const kTextFormDecoration =  InputDecoration(
                                 focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.all(Radius.circular(10))
                                 ),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))));