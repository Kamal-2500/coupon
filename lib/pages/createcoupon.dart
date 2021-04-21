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
                    padding: const EdgeInsets.fromLTRB(40, 0.0, 10.0, 0.0),
                    // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                margin: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
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
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: shopnameController,
                        // validator: (input) => input.length < 3
                        //     ? "Password should be more than 3 characters"
                        //     : null,
                        // obscureText: hidePassword,
                        decoration: new InputDecoration(
                          hintText: "    Product Name",
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

                      //Flat rs. off & discount
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: fnameController,
                        decoration: new InputDecoration(
                          // hintText: "Last Name",
                          hintText: "    Amount",
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

                      //Flat rs. off
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: lnameController,
                        decoration: new InputDecoration(
                          hintText: "    Flat Amount",
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

                      //upto % discount
                      SizedBox(
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: phoneController,
                        decoration: new InputDecoration(
                          hintText: "    Discount",
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

                      //Exp_date
                      SizedBox(
                        height: 20,
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
                        child: RaisedButton(
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
                        height: 20,
                      ),
                      new TextFormField(
                        keyboardType: TextInputType.text,
                        // controller: phoneController,
                        decoration: new InputDecoration(
                          hintText: "    Description",
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

                      //Add
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // FlatButton(
                      //   padding: EdgeInsets.symmetric(
                      //     vertical: 12,
                      //     horizontal: 80,
                      //   ),
                      //   onPressed: (){
                      //     // userRegistration();
                      //     // _navigateToNextScreen(context);
                      //   },
                      //   // onPressed: userRegistration,
                      //
                      //   child: Text(
                      //     "Add",
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   color: Theme.of(context).accentColor,
                      //   shape: StadiumBorder(),
                      // ),

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
