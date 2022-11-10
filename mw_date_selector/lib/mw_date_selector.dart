library mw_date_selector;

class MWDateSelector extends StatefulWidget {
  String label;
  DateTime? minTime;
  DateTime? maxTime;
  Function(DateTime) onDateChange;
  DateTime? _date;

  MWDateSelector({Key? key, required this.label, required this.onDateChange, this.minTime, this.maxTime}) : super(key: key);

  @override
  _MWDateSelectorViewState createState() => _MWDateSelectorViewState(this.label, this.onDateChange, this.minTime, this.maxTime);
}

class _MWDateSelectorViewState extends State<MWDateSelector> {

  String label;
  DateTime? minTime;
  DateTime? maxTime;
  Function(DateTime) onDateChange;
  DateTime? _date;

  DateFormat dateFormat = DateFormat("dd MMM yyyy");

  _MWDateSelectorViewState(this.label, this.onDateChange, this.minTime, this.maxTime);

  @override
  void initState() {
    super.initState();
  }

  _getColour() {
    if (_date == null) {
      return Colors.black45;
    }
    return Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: ExternalFonts.subtitle1(Colors.black54)),
          Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(2),
              child: Material(
                  child: InkWell(
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: minTime,
                            maxTime: maxTime,
                            onConfirm: (date) {
                              setState(() {
                                _date = date;
                              });
                              onDateChange(date);
                            },
                            locale: LocaleType.en
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child:Icon(Icons.date_range, color: _date == null ? Colors.black45 : Theme.of(context).primaryColor)
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Text(_date != null ? dateFormat.format(_date!) : "Select Date", style:TextStyle(color: _getColour(), fontWeight: FontWeight.w600, fontSize: 14))
                                )
                              ]
                          ),
                          _date != null ? GestureDetector(
                            onTap: () => setState(() => _date = null),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(Icons.close, color: Theme.of(context).colorScheme.error)
                            ),
                          ): Container()
                        ]
                      )
                  ),
                  color: Colors.transparent
              ),
              decoration: BoxDecoration(
                  border: Border.all(width:1, color: _getColour()),
                  borderRadius: BorderRadius.circular(4)
              )
          )
        ]
    );
  }
}