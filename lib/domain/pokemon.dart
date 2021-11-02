class Pokemon {
  String pokemonname;
  String imagePath;
  String img;
  //攻撃
  String attack1;
  String attack2;
  String attack3;
  String attack4;


  //序盤わざ
  String waza1;
  String damage;
  String damagelv1;
  String damagelv2;
  String damagelv3;

//わざ1A
  String waza1A;

// ダメージ1発目
  String damage1;
  String damage1lv4;
  String damage1lv5;
  String damage1lv6;
  //わざ1B
  String waza1B;
  //ダメージ(おいうちなし)
  String damage3;
  String damage3lv4;
  String damage3lv5;
  String damage3lv6;
  //ダメージ(正面)
  String damage4;
  //わざ2
  String waza2;
  //ダメージ
  String damage6;
  String damage6lv1;
  String damage6lv2;
  String damage6lv3;

  //わざ2A
  String waza2A;
  //ダメージ
  String damage7;
  String damage7lv4;
  String damage7lv5;
  String damage7lv6;
  //わざ2B
  String waza2B;
  //ダメージ
  String damage9;
  String damage9lv6;
  String damage9lv7;
  String damage9lv8;
  //ユナイトわざ
  String unitewaza;
  //ダメージ
  String damage10;
  String damage10lv9;
  String damage10lv10;
  String damage10lv11;


  Pokemon({
    required this.pokemonname,
    required this.imagePath,
    required this.img,

    //攻撃
    required this.attack1,
    required this.attack2,
    required this.attack3,
    required this.attack4,
    //序盤わざ
    required this.waza1,
    required this.damage,
    required this.damagelv1,
    required this.damagelv2,
    required this.damagelv3,
    //わざ1A
    required this.waza1A,
    //ダメージ(1発目)
    required this.damage1,
    required this.damage1lv4,
    required this.damage1lv5,
    required this.damage1lv6,
    //わざ1B
    required this.waza1B,
    //ダメージ(おいうちなし)
    required this.damage3,
    required this.damage3lv4,
    required this.damage3lv5,
    required this.damage3lv6,
    //ダメージ(正面)
    required this.damage4,

    //わざ2
    required this.waza2,
    //ダメージ
    required this.damage6,
    required this.damage6lv1,
    required this.damage6lv2,
    required this.damage6lv3,

    //わざ2A
    required this.waza2A,
    //ダメージ
    required this.damage7,
    required this.damage7lv4,
    required this.damage7lv5,
    required this.damage7lv6,

    //わざ2B
    required this.waza2B,
    //ダメージ
    required this.damage9,
    required this.damage9lv6,
    required this.damage9lv7,
    required this.damage9lv8,
    //ユナイトわざ
    required this.unitewaza,
    //ダメージ
    required this.damage10,
    required this.damage10lv9,
    required this.damage10lv10,
    required this.damage10lv11,

  });
}

