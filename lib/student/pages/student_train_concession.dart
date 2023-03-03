import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class TrainConcession extends StatelessWidget {
  const TrainConcession({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = '';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  CollectionReference students =
      FirebaseFirestore.instance.collection('train-concession');

  @override
  void initState() {
    from.text = "";
    till.text = ""; //set the initial value of text field
    super.initState();
  }

  Future<void> addApp(
      String fullName,
      String uid,
      String? yr,
      String? course,
      String l_from,
      String l_till,
      String ph_no,
      String addr,
      String? zone,
      String? travel_class,
      String? img) {
    // Calling the collection to add a new user
    return students
        //adding to firebase collection
        .add({
          //Data added in the form of a dictionary into the document.
          'full_name': fullName,
          'uid': uid,
          'year': yr,
          'course': course,
          'from': l_from,
          'till': l_till,
          'phone-number': ph_no,
          'address': addr,
          'travel-zone': zone,
          'travel-class': travel_class,
          'image': img
        })
        .then((value) => print(""))
        .catchError((error) => print("Student couldn't be added."));
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController abc = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController from = TextEditingController();
  TextEditingController till = TextEditingController();
  TextEditingController ph_no = TextEditingController();
  TextEditingController address = TextEditingController();
  String? chosenValue;
  String? chosenValue1;
  String? chosenValue2;
  String? chosenValue3;

  XFile? image;
  String? txt = "No file selected";

  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
      txt = img?.name;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 12,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void change_class_value(String? value) {
    setState(() {
      chosenValue = value;
    });
  }

  void change__course_value(String? value) {
    setState(() {
      chosenValue1 = value;
    });
  }

  void change_zone_value(String? value) {
    setState(() {
      chosenValue2 = value;
    });
  }

  void change_travel_value(String? value) {
    setState(() {
      chosenValue3 = value;
    });
  }

  void change_image_value(String? value) {
    setState(() {
      txt = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Train Concession",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 3,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text("Full Name",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              subtitle: TextField(
                controller: name,
                obscureText: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  // labelText: 'Full Name',
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text("UID/Roll No",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              subtitle: TextField(
                controller: uid,
                obscureText: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  // labelText: 'Full Name',
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(" Class",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: DropdownButtonFormField<String>(
                      value: chosenValue,
                      elevation: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      // style: TextStyle(color: Colors.black),

                      items: <String>[
                        'FY',
                        'SY',
                        'TY',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: change_class_value,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListTile(
                    title: Text(" Course",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: DropdownButtonFormField<String>(
                      value: chosenValue1,
                      elevation: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),

                      // style: TextStyle(color: Colors.black),

                      items: <String>[
                        'BA',
                        'BSC',
                        'BSC IT',
                        'BMS',
                        'BMM',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: change__course_value,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text("Phone Number",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              subtitle: TextField(
                controller: ph_no,
                obscureText: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                  prefixText: "+ 91",
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.phone,
                    ),
                  ),

                  // labelText: 'Full Name',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              title: Text("Address",
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87)),
              subtitle: TextField(
                controller: address,
                obscureText: false,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  // labelText: 'Full Name',
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Travel Zone",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: DropdownButtonFormField<String>(
                        value: chosenValue2,
                        elevation: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        // style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Central',
                          'Harbour',
                          'Western',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: change_zone_value),
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: ListTile(
                    title: Text("Travel Class",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: DropdownButtonFormField<String>(
                        value: chosenValue3,
                        elevation: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        // style: TextStyle(color: Colors.black),

                        items: <String>[
                          'First Class',
                          'Second Class',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: change_travel_value),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("From",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: TextField(
                      controller: from,
                      obscureText: false,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            from.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // labelText: 'Full Name',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("To",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                    subtitle: TextField(
                      controller: till,
                      obscureText: false,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));
                        if (pickedDate != null) {
                          //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            till.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        // labelText: 'Full Name',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Upload Your Image and Aadhar Card Copy Here",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87)),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      //if user click this button, user can upload image from gallery
                      onPressed: () {
                        myAlert();
                        //getImage(ImageSource.gallery);
                      },
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.upload),
                              Text('From Gallery'),
                            ],
                          ),
                          Row(
                            children: [
                              Text("$txt", style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    addApp(
                        name.text,
                        uid.text,
                        chosenValue,
                        chosenValue1,
                        from.text,
                        till.text,
                        ph_no.text,
                        address.text,
                        chosenValue2,
                        chosenValue3,
                        image?.path);
                    _formKey.currentState?.reset();
                    name.clear();
                    uid.clear();
                    change_image_value("No file selected");
                    from.clear();
                    till.clear();
                    ph_no.clear;
                    address.clear();
                    change_class_value(null);
                    change__course_value(null);
                    change_zone_value(null);
                    change_travel_value(null);

                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Uploading Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
