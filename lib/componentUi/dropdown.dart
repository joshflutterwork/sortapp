import 'package:flutter/material.dart';
import 'package:sortapp/model/dropdownModel.dart';

Widget createDropDown(
        {String label,
        IconData icon,
        bool isEditing = true,
        List<DropdownMenuItem<DropDownObj>> optionItems,
        DropDownObj selectedValue,
        bool enable = true,
        void onChangeFunc(DropDownObj value),
        void onSavedFunc(DropDownObj value),
        bool validate: true,
        bool transferChat: false}) =>
    Container(
      height: 70,
      alignment: Alignment.centerLeft,
      child: DropdownButtonFormField<DropDownObj>(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            hintText: label,
          ),
          value: selectedValue ?? null,
          items: optionItems,
          isDense: true,
          validator: (value) {
            if (value == null) {
              return '$label must be fill';
            } else {
              return null;
            }
          },
          onChanged: enable
              ? (value) async {
                  if (isEditing) {
                    if (selectedValue != value) onChangeFunc(value);
                  } else
                    return null;
                }
              : null,
          onSaved: (value) {
            onSavedFunc(value);
          }),
    );
