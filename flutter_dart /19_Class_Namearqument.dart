
main(){  
  Person person = Person(); //오른쪽 객체를 만들고(Person), 왼쪽에 정의(person)
  person.name = "James";
  print(person.name);

  String name2 = person.name!; 
  //(name타입은 String / person타입은? => !가 있어야지 ?해제됨)
  print(name2);

  People people1 = People("James", 23, "male");  //객체 여러개 만들 수 있
  People people2 = People("Cathy", 20, "female"); // PeoPle 클래스로 만든 다른 객체

  print(people1.name);
  print(people1.age);
  print(people1.gender);
  print(people2.name);
  print(people2.age);
  print(people2.gender);

  //----------------Named Argment --------------
  //(다른생성자들은 Name을 만들경우 따로 만들어야 하지만 argument는 하나 그때그때 해도됨)
  //argment는 기분이 null
  Human human = Human(name: "James");
  print(human.name);

  Human human1 = Human(gender: 'Femal', age: 20, name: 'Cathy');
  print("${human1.name}, ${human1.gender}, ${human1.age}"); // 순서 상관 없이 가능

}


class Person{ //class이름은 대문자로 씀!
  //property(class가 갖고 있는 데이터)
  String? name;   // 정의하고 데이터 안주면 빨간줄!  => late(나중에 정의하겠다) // String?(null이 가능한)  // name = ''; (임의) 3중하나

  //constructor(데이터를사용하려면 instance=object=객체 생성만해주는것)
  //fuction,Method
}




class People{
  String? name;
  int? age;
  String? gender;

  People(String name, int age,String gendr){  
    this.name = name; //this는 위에 있는 property를 가져옴
    this.age = age;
    this.gender = gender;
  }
}

// 생성자를 named argment로 구성하여 사용, 위와 차이{사용} ?안넣으면 오류
class  Human{
  String? name;
  int? age;
  String? gender;

  Human({String? name, int? age, String? gender}){ //?null값 들어올수 있다
    this.name = name; //this는 위에 있는 property를 가져옴
    this.age = age;
    this.gender = gender;
  }
}