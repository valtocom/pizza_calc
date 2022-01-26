import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PizzaCalcScreen extends StatefulWidget {
  const PizzaCalcScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalcScreenState createState() => _PizzaCalcScreenState();
}

enum Sauce { spicy, sour, cheesy }


class _PizzaCalcScreenState extends State<PizzaCalcScreen> {

  bool _isSwitch = true;

  double _pizzaSize = 30;

  int _cost = 500;

  bool _addCheese = false;

  Sauce? _sauce = Sauce.spicy;

  void _onSauceChanged (Sauce? value) {
    setState(() {
      _sauce = value;
      _calcCost();
    });
  }

  int _calcCost () {

    _cost = 500;
    if (_isSwitch == true) _cost += 100;
    if (_addCheese == true) _cost += 50;

    if (_pizzaSize == 20) _cost -= 200;
    if (_pizzaSize == 40) _cost += 200;

    switch (_sauce) {
      case Sauce.spicy:
        break;
      case Sauce.sour:
        _cost += 20;
        break;
      case Sauce.cheesy:
        _cost += 30;
        break;
      default:
        _sauce = Sauce.spicy;
        _cost += 0;
    }

    return _cost;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerRight,
                      child: Image(image: AssetImage('assets/pizza.png')),
                  ),

                  SizedBox(height: 35,),
                  Text('Калькулятор пиццы',
                  style: TextStyle(fontSize: 30),
                  ),

                  SizedBox(height: 10,),
                  Text('Выберите параметры:',
                    style: TextStyle(fontSize: 16),
                  ),

                  SizedBox(height: 35,),

                  SlidingSwitch(
                    value: false,
                    width: 300,
                    onChanged: (bool value) {
                      _isSwitch = value;
                      setState(() {
                        _calcCost();
                      });
                    },
                    height : 35,
                    animationDuration : const Duration(milliseconds: 400),
                    onTap:(){},
                    onDoubleTap:(){},
                    onSwipe:(){},
                    textOff : "Обычное тесто",
                    textOn : "Тонкое тесто",
                    colorOn : const Color(0xffFFFFFF),
                    colorOff : const Color(0xffFFFFFF),
                    background : const Color(0xffe4e5eb),
                    buttonColor : const Color(0xff0079D0),
                    inactiveColor : const Color(0xff636f7b),
                  ),

                  SizedBox(height: 20,),

                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Text('Размер:',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  SizedBox(height: 20,),

                  SizedBox(
                    child: SfSlider(
                      min: 20,
                      max: 40,
                      value: _pizzaSize,
                      interval: 10,
                      showTicks: true,
                      showLabels: true,
                      enableTooltip: true,
                      minorTicksPerInterval: 0,
                      stepSize: 10,
                      onChanged: (dynamic val){
                        setState(() {
                          _pizzaSize = val;
                          _calcCost ();
                        });
                      },
                    ),
                    width: 400,
                  ),

                  SizedBox(height: 30,),



                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('Соус:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    RadioListTile<Sauce>(
                      title: const Text('Острый'),
                      value: Sauce.spicy,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged
                    ),

                    RadioListTile<Sauce>(
                      title: const Text('Кисло-сладкий'),
                      value: Sauce.sour,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged
                    ),

                    RadioListTile<Sauce>(
                      title: const Text('Сырный'),
                      value: Sauce.cheesy,
                      groupValue: _sauce,
                      onChanged: _onSauceChanged,
                    ),

                    Container(
                      width: double.infinity,
                      height: 60,
                      child: Card(
                        color: Color(0xFFECEFF1),

                        child: Row(
                          children: [

                            Expanded (child:
                            SizedBox(
                              height: 45,
                              child: Image(image: AssetImage('assets/cheese-logo.png')),
                            ),
                            ),

                            Text('Дополнительный сыр',
                                style: TextStyle(fontSize: 18),
                              ),

                            Expanded(
                              child: Switch(
                                    value: _addCheese,
                                    onChanged: (val) {
                                      setState(() {
                                        _addCheese = !_addCheese;
                                        _calcCost();
                                      });
                                    },
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text('Стоимость:',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 50,
                      child: Card(
                        child: Text('$_cost руб.',
                          style: TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        color: Color(0xFFECEFF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),

                    SizedBox(height: 35,),

                    SizedBox(width: 154, height: 42, child:
                    ElevatedButton(onPressed: () {},
                      child: Text('Заказать'),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0079D0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.0),
                        ),
                      ),
                    )
                    ),


                  ],
              ),
            ),
          ),
      ),
    );
  }
}
