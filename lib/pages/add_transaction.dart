import 'package:chronos/components/buttons/add_button.dart';
import 'package:chronos/components/curved_appbar.dart';
import 'package:chronos/components/textfield.dart';
import 'package:chronos/const.dart';
import 'package:chronos/cubits/app_cubit.dart';
import 'package:chronos/models/category.dart';
import 'package:chronos/models/transaction.dart';
import 'package:chronos/pages/qr_scan.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatefulWidget {
  AddExpensePage({Key? key, required this.transaction, required this.isScanned})
      : super(key: key);
  Transaction transaction;
  bool isScanned;
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController =
        TextEditingController(text: widget.transaction.name);
    TextEditingController notesController = TextEditingController();
    TextEditingController amountController = TextEditingController(
        text: widget.transaction.amount.toStringAsFixed(2));
    TextEditingController dateController =
        TextEditingController(text: widget.transaction.date.toString());
    AppCubit appCubit = AppCubit.get(context);
    List<Category> categories = appCubit.demoCategories;

    return Scaffold(
      backgroundColor: appCubit.getBackgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedAppBar(
              title: "Add a Transaction",
              isBackButton: true,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  !widget.isScanned
                      ? Column(
                          children: [
                            IconButton(
                              iconSize: 100,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (_) {
                                    return const QRScanPage();
                                  },
                                ));
                              },
                              icon: const Icon(Icons.qr_code_scanner_outlined),
                            ),
                            const Text(
                              "Scan an invoice QR Code",
                              style: TextStyle(
                                  fontFamily: "Merriweather",
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  getTextField(
                    title: "Amount",
                    icon: Icons.attach_money_outlined,
                    onChanged: (p0) {},
                    controller: amountController,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "  Choose a Category",
                    style: subTitleStyle,
                  ),
                  buildCategoryChips(categories),
                  const SizedBox(height: 10),
                  getTextField(
                    title: "Transaction Title",
                    onChanged: (p0) => widget.transaction.name,
                    controller: nameController,
                  ),
                  const SizedBox(height: 10),
                  getTextField(
                    title: "Notes",
                    icon: Icons.note_alt_outlined,
                    onChanged: (p0) {},
                    controller: notesController,
                  ),
                  const SizedBox(height: 10),
                  getTextField(
                    title: "Date",
                    onChanged: (p0) {},
                    inputType: TextInputType.datetime,
                    icon: Icons.date_range_outlined,
                    controller: dateController,
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: AddButton(
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryChips(List<Category> categories) {
    return Wrap(
      spacing: 14,
      children: categories
          .map(
            (e) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                setState(() {
                  widget.transaction.category = e;
                });
              },
              child: Chip(
                shape:
                    const StadiumBorder(side: BorderSide(color: Colors.teal)),
                backgroundColor: (e.name == widget.transaction.category.name)
                    ? Colors.teal[600]
                    : Colors.grey[900],
                elevation: 10,
                label: Text(
                  e.name,
                  style: subTitleStyle,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
