import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CreateCoupon extends StatefulWidget {
  @override
  _CreateCouponState createState() => _CreateCouponState();
}

// String _chosenValue;
class _CreateCouponState extends State<CreateCoupon> {
  String _chosenValue;
  bool visibilityOnFirst = false;
  bool visibilityOnSecond = false;
  bool visibilityOnThird = false;
  String selectedDate = "Expiry Date";
  var customFormat = DateFormat('dd-MM-yyyy');
  var sd = DateFormat('dd-MM-yyyy');

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2101));

    if (picked != null)
      setState(() {
        // selectedDate = picked;
        selectedDate = "" + customFormat.format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        centerTitle: true,
        title: Text(
          'Create Coupon',
          style: TextStyle(color: Color(0xffFFFFFF)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Notification',
            onPressed: () {
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.fromLTRB(100.0, 10.0, 10.0, 10.0),
                    // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.blueAccent,
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              color: Theme.of(context).hintColor.withOpacity(0.2),
                              offset: Offset(0, 10),
                              blurRadius: 20)
                        ]),
                    // width: double.infinity,
                    // padding: const EdgeInsets.fromLTRB(100, 10.0, 0.0, 0.0),
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      elevation: 5,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black.withOpacity(0.6)),

                      items: <String>[
                        'Buy Get Free',
                        'Flat ₹ Off',
                        'Upto % Discount',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Please choose a coupon type ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                          switch(value) {
                            case "Buy Get Free":
                              visibilityOnFirst = true;
                              visibilityOnSecond = false;
                              visibilityOnThird = false;
                              break;
                            case "Flat ₹ Off":
                              visibilityOnFirst = false;
                              visibilityOnSecond = true;
                              visibilityOnThird = false;
                              break;
                            case "Upto % Discount":
                              visibilityOnFirst = false;
                              visibilityOnSecond = false;
                              visibilityOnThird = true;
                              break;
                            default:
                              visibilityOnFirst = false;
                              visibilityOnSecond = false;
                              visibilityOnThird = false;
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(10, 10.0, 10.0, 20.0),
                // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 130, horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.blueAccent,
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ]),

                child: Form(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Create Coupon",
                        style: Theme.of(context).textTheme.headline2,
                      ),

                      //Buy get free
                      Visibility(
                        child : SizedBox(
                          height: 60,
                        child : new TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: "Product Name",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        ),
                        visible: visibilityOnFirst ? true : false,
                      ),
                      //Flat rs. off & discount
                      SizedBox(
                        height: 60,
                        child : new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: fnameController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          // hintText: "Last Name",
                          hintText: "Amount",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                      ),
                      Visibility(
                        //upto % discount
                      child : SizedBox(
                        height: 60,
                        child: new TextFormField(
                          keyboardType: TextInputType.text,
                          // controller: lnameController,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: "Flat Amount",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                        visible: visibilityOnSecond ? true : false,
                      ),
                      Visibility(
                      child : SizedBox(
                        height: 60,
                        child : new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: phoneController,
                        decoration: new InputDecoration(
                          contentPadding: EdgeInsets.all(20.0),
                          hintText: "Discount",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(0.2),
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                      ),
                      ),
                        visible: visibilityOnThird ? true : false,
                      ),
                      new Container(
                        width: double.maxFinite,

                        decoration: BoxDecoration(
                          // color: Colors.yellow[100],
                          color: Theme.of(context).primaryColor,
                          border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2)),
                          ),
                        ),
                        // child: new RaisedButton(color: Colors.red,
                        //     onPressed: null),
                        child: SizedBox(
                          height : 60,
                          child : RaisedButton(
                            elevation: 0,
                            hoverElevation: 0,
                            focusElevation: 0,
                            highlightElevation: 0,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "${selectedDate}",
                                // "Expiry Date",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            textColor: Colors.grey,
                            color: Theme.of(context).primaryColor,
                            onPressed: () => {showPicker(context)},
                          ),
                        ),
                      ),

                      // new RaisedButton(
                      //   // textColor: Colors.white,
                      //
                      //   color: Theme.of(context).primaryColor,
                      //   elevation: 0,
                      //   hoverElevation: 0,
                      //   focusElevation: 0,
                      //   highlightElevation: 0,
                      //
                      //   child: Container(
                      //
                      //       decoration: BoxDecoration (
                      //
                      //         border: Border(
                      //           bottom: BorderSide(
                      //             width: 1,
                      //             color: Theme.of(context).accentColor.withOpacity(0.2)
                      //           ),
                      //         ),
                      //
                      //
                      //       ),
                      //       width: double.maxFinite,
                      //       padding: const EdgeInsets.fromLTRB(0, 10.0, 0.0, 15.0),
                      //       child: Text(
                      //         "Expiry Date",
                      //         // textAlign: TextAlign.left,
                      //       )),
                      //   onPressed: () {
                      //
                      //   },
                      // ),
                      // new TextFormField(
                      //
                      //   keyboardType: TextInputType.datetime,
                      //   // controller: phoneController,
                      //   decoration: new InputDecoration(
                      //     hintText: "Expiry Date",
                      //
                      //     enabledBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context)
                      //             .accentColor
                      //             .withOpacity(0.2),
                      //       ),
                      //     ),
                      //     suffixIcon: IconButton(
                      //       onPressed: () {
                      //         showPicker(context);
                      //       },
                      //       color: Theme.of(context).accentColor,
                      //       icon: Icon(
                      //             Icons.calendar_today_outlined,
                      //       ),
                      //     ),
                      //
                      //     focusedBorder: UnderlineInputBorder(
                      //       borderSide: BorderSide(
                      //         color: Theme.of(context).accentColor,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      //description
                      SizedBox(
                        height: 100,
                        child : new TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          maxLines: 5,
                          // controller: phoneController,
                          decoration: new InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            hintText: "Description",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .accentColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //create
                      SizedBox(
                        height: 60,
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 80,
                          ),
                          onPressed: (){
                            // userRegistration();
                            // _navigateToNextScreen(context);
                          },
                          // onPressed: userRegistration,

                          child: Text(
                            "Create",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                        ),

                      ),

                      // Visibility(
                      //     // visible: visible,
                      //     child: Container(
                      //         margin: EdgeInsets.only(bottom: 30),
                      //         child: CircularProgressIndicator()
                      //     )
                      // ),
                    ],
                  ),
                ),

                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(20),
                //     // color: Colors.blueAccent,
                //     color: Theme.of(context).primaryColor,
                //     boxShadow: [
                //       BoxShadow(
                //           color: Theme.of(context).hintColor.withOpacity(0.2),
                //           offset: Offset(0, 10),
                //           blurRadius: 20)
                //     ]),
              )
            ],
          )
        ],
      )),
    );
  }
}
