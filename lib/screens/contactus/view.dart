import 'package:aya_hospital/helpers/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:mailer2/mailer.dart';

class ContactUsView extends StatefulWidget {
  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  final _email = TextEditingController();
  final _msg = TextEditingController();
  final _name = TextEditingController();
  final _phone = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _sendMail() async {
    // var options = SendGridSmtpOptions()
    //   ..username = 'apikey'
    //   ..hostName = 'smtp.sendgrid.net'
    //   ..name = 'apikey'
    //   ..password =
    //       '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';
    // var emailTransport = SmtpTransport(options);
    // var envelope = Envelope()
    //   ..from = 'info@ayahospital.com.sa'
    //   ..recipients.add('info@ayahospital.com.sa')
    //   ..bccRecipients.add('arabee@is.net.sa')
    //   ..subject = 'Aya Hospital App Contact Form'
    //   ..html =
    //       'Name: $_name<br>Email:$_email<br>Phone:$_phone<br>Msg:$_msg<br> Regards<br>Aya Hospital App';

    final username = 'support@is.net.sa';
    final password =
        'xsmtpsib-7c95eba1e26b7bd148a2096e859db2a007444917863facadc3f41f58197003a6-3MQ91cRv2aAXrmBq';
    final smtpServer = SmtpServer(
      'smtp-relay.sendinblue.com',
      port: 587,
      username: username,
      password: password,
    );

    final message = Message()
      ..from = Address(username, 'Aya Hospital')
      ..recipients.add('info@ayahospital.com.sa')
      // ..bccRecipients.add(Address('arabee@is.net.sa'))
      ..subject = 'Aya Hospital App Contact Form'
      ..html =
          'Name: ${_name.text.trim()} <br>Email:${_email.text.trim()}<br>Phone:${_phone.text.trim()}<br>Msg:${_msg.text.trim()}<br> Regards<br>Aya Hospital App';
    await send(message, smtpServer).then((value) {
      print(value);
      setState(() {
        _name.clear();
        _email.clear();
        _phone.clear();
        _msg.clear();
      });
      return showInSnackBar(value: 'تم ارسال الرسالة بنجاح');
    }).catchError((e) => print('Error occurred: $e'));
    // var options = SendGridSmtpOptions()
    //   ..port = 587
    //   ..username = 'support@is.net.sa'
    //   ..hostName = 'smtp-relay.sendinblue.com'
    //   ..name = 'support@is.net.sa'
    //   ..password =
    //       'xsmtpsib-7c95eba1e26b7bd148a2096e859db2a007444917863facadc3f41f58197003a6-3MQ91cRv2aAXrmBq';
    // var emailTransport = SmtpTransport(options);
    // var envelope = Envelope()
    //   ..from = 'support@is.net.sa'
    //   ..recipients.add('support@is.net.sa')
    //   ..bccRecipients.add('arabee@is.net.sa')
    //   ..subject = 'Aya Hospital App Contact Form'
    //   ..html =
    //       'Name: $_name<br>Email:$_email<br>Phone:$_phone<br>Msg:$_msg<br> Regards<br>Aya Hospital App';

    // emailTransport.send(envelope).then((envelope) {
    //   showInSnackBar(value: 'تم ارسال الرسالة بنجاح');
    // }).catchError((e) => print('Error occurred: $e'));
  }

  _launchURL({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _item({String image, String url}) {
    return InkWell(
      onTap: () {
        _launchURL(url: url);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(30),
            color: Colors.white),
      ),
    );
  }

  Widget _textField(
      {String hint,
      Function validate,
      controller,
      Function onsave,
      int lines}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: TextFormField(
        controller: controller,
        maxLines: lines,
        validator: validate,
        onSaved: onsave,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(fontSize: 12, color: Theme.of(context).accentColor)),
      ),
    );
  }

  void _submitForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();

    _sendMail();
  }

  Widget _button() {
    return InkWell(
      onTap: () {
        _submitForm();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).accentColor),
        child: Center(
          child: Text(
            'ارسال',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  void showInSnackBar({
    String value,
  }) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Theme.of(context).accentColor,
        duration: Duration(seconds: 2),
        content: new Text(
          value ?? "",
          style: TextStyle(
            fontFamily: 'Cairo',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          AppLocalizations.of(context).translate('your_opinion_matters'),
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _item(
                  image: 'assets/facebook.png',
                  url:
                      'https://www.facebook.com/AyaHosp/?modal=admin_todo_tour'),
              _item(
                  image: 'assets/twitter.png',
                  url: 'https://twitter.com/ayahospital1?t=-_zZWANvbnJPwsUMaz--7Q&s=09'),
              _item(
                  image: 'assets/instagram.png',
                  url: 'https://instagram.com/ayahospital?utm_medium=copy_link'),
              _item(
                  image: 'assets/linkedin.png',
                  url: 'https://www.linkedin.com/in/aya-hospital-91a032b6'),
              _item(
                  image: 'assets/youtube.png',
                  url:
                      'https://www.youtube.com/channel/UCWGf6I7qJxcGHwaU9pbSAOQ?view_as=subscriber'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _textField(
                    controller: _name,
                    hint: 'الاسم',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'الاسم مطلوب';
                      } else
                        return null;
                    }),
                _textField(
                    controller: _phone,
                    hint: 'رقم الجوال',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'رقم الجوال مطلوب';
                      } else
                        return null;
                    }),
                _textField(
                    controller: _email,
                    hint: 'البريد الالكتروني',
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'البريد الالكتروني مطلوب';
                      } else
                        return null;
                    }),
                _textField(
                    controller: _msg,
                    hint: 'نص الرساله',
                    lines: 4,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'نص الرساله مطلوب';
                      } else
                        return null;
                    })
              ],
            ),
          ),
          _button()
        ],
      ),
    );
  }
}
