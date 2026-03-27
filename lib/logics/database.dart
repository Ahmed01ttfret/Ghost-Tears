
import 'package:shared_preferences/shared_preferences.dart';

class Save{


  void sets(String name,int num)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setInt(name, num);
  }


  Future<int> seter(String key)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    var t=pref.getInt(key);
    if(t==null){
      return 0;
    }else{
      return t;
    }
  }
  void Put(String name,bool state)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setBool(name, state);

}


  void cut(int name)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.setInt('level' ,name);

  }

  Future<int?> cat()async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    var num=pref.getInt('level');
    return num;
  }
  Future<bool> Get(String name)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    var x=pref.getBool(name);
    if(x==true){
      return true;
    }else{
      return false;
    }
  }

  void Update(String name)async{
    var state=true;
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.remove(name);
    pref.setBool(name, state);

  }
  void del(String name)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.remove(name);
  }
  void clr()async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    pref.clear();
  }
  Future<int> G(String name)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    var x=pref.getBool(name);
    if(x==true){
      return 1;
    }else{
      return 0;
    }
  }
  Future<bool> set(String name)async{
    final SharedPreferences pref =await SharedPreferences.getInstance();
    var x=pref.getBool(name);
    if(x==null){
      return true;
    }else{
      return x;
    }
  }
}