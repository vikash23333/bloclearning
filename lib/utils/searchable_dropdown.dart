
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
 

 /*
  CommonSearchableDropDown is a searchable dropdown field which contains generic type.
  Fields:
    1. hintText             -> Required  -> Give the label text
    2. Selected Value       -> Required  -> When you select the dropdown value it will take the selected value.
    3. OnTcanged            -> Required  -> it will triggered when you click on one of the field of the dropdown.
    4. compareFn            -> Required  -> it will give two parameters with the generic model you have to write the
                                            logic based on the field you want to compare between both 
    5. textToViewInDropDown -> Required  -> this function will give One generic type parameters, it is used to show the 
                                            value on the dropdown list, like the field you to show on the dropdown list.
  */

class CommonSearchableDropDown<T> extends StatelessWidget {
  //Class Field
  final String hintText;
  final T? selectedValue;
  final List<T>? options;
  final bool isEnable;
  final void Function(T?)? onChanged;
  final Function(T,T) compareFn;
  final Function(T?) textToViewInDropDown;
  final Function(T?)? validatorFunction;

  //Constructor
  const CommonSearchableDropDown({super.key,required this.textToViewInDropDown, 
  required this.compareFn,
  required this.hintText,
  this.isEnable=true, 
  this.validatorFunction,
  required this.options,
   required this.selectedValue,
   required this.onChanged
   });


  @override
  Widget build(BuildContext context) { 
    //Main Widgets
     return Container(
      color: (isEnable)? const Color(0xFFFFFFFF): const Color.fromARGB(255, 229, 226, 226),
       child: DropdownSearch<T>(
        enabled:isEnable,
                  popupProps: const PopupProps.menu(
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search',
                        focusedBorder:  OutlineInputBorder(
                          borderRadius:BorderRadius.all(Radius.circular(6.0)),
                          borderSide:BorderSide(color: Color(0xff004772)),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0)))
                      ),
                      style:  TextStyle(color: Color(0xff004772)),
                      cursorColor: Color(0xff004772),
                    ),
                    
                    showSelectedItems: true,
                  ),
                  
                  
                  dropdownButtonProps: DropdownButtonProps( iconSize: 28,icon: const Icon(Icons.arrow_drop_down) ,color: Colors.grey[600]),
                  selectedItem:(selectedValue==null)?null:selectedValue ,
                  compareFn: (item1, item2) =>compareFn(item1,item2),
                  itemAsString: (item) => '${textToViewInDropDown(item)}',
                  items:  (options==null)?[]:options!,
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 12),
                      border: const OutlineInputBorder( borderRadius:BorderRadius.all(Radius.circular(6))),
                      labelText: hintText,
                      labelStyle:const TextStyle(color:Color.fromARGB(255, 118, 117, 117)),
                      floatingLabelStyle: const TextStyle(color: Color(0xff004772))
                    ),
                  ),
                  validator: (value) {
                    try {
                      if (validatorFunction!=null) {
                        return validatorFunction!(value);
                      }
                    } catch (e) {
                      return null;
                    }
                    return null;
                  },
                  onChanged: onChanged, 
                ),
     ); 
  }
} 



/*

CommonSearchableDropDown<GetSite>(
                    textToViewInDropDown: (p0)   => '${p0?.name} (${p0?.siteId})',
                    compareFn: (p0, p1) => (p0.name.toString().toLowerCase() == p1.name.toString().toLowerCase()), 
                    hintText:getLabelInfo('Equipment','SoEqSName',defaultVal: translate('refdata.site_name')),
                    selectedValue: selectedSite,
                    onChanged: (GetSite? newValue)async {
                      setState(() {
                        selectedWareHouse = null;
                        selectedSite = newValue;});
                        await fillterWareHouse(context, newValue?.siteId);
                    },
                    options: postSiteModel,
                  ), 
 */