import 'package:flutter/material.dart';

String homeNav = "assets/icons/home.png";
String categoryNav = "assets/icons/menu.png";
Color homeColorNav = Colors.black;
Color menuColorNav = Colors.black;
int currentIndex = 0;

// bool themeColor = false;
bool newValue = true;
bool bottomNavRes = false;

List categories = [
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
  {"name": "Ramadan", "image": "aasets/images/ramadan2.png"},
];

List noodles = [
  {
    "price": "20BDT",
    "name": "Cocola Egg Noodles",
    "quantity": "130 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh",
  },
  {
    "price": "160BDT",
    "name": "Nestle Maggie 2-Minute Masala Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "20BDT",
    "name": "Doodles Stick Noodles",
    "quantity": "150 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "65BDT",
    "name": "Sajib Coook Noodles Chicken Tandoori 8 Pcs",
    "quantity": "300 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "180BDT",
    "name": "Nestle Maggie Masala Blast Noodles",
    "quantity": "8 pack",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List freshFruits = [
  {
    "price": "115 BDT",
    "name": "Black Grapes",
    "quantity": "250 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "25 BDT",
    "name": "Cherry Pineapple",
    "quantity": "each",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "145 BDT",
    "name": "Laal Angur",
    "quantity": "250 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "275 BDT",
    "name": "Watermelon Medium 4kg ",
    "quantity": "each",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Shada Nashpati",
    "quantity": "2 pcs",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List oil = [
  {
    "price": "906 BDT",
    "name": "Teer Fortified Soyabean Oil",
    "quantity": "5 ltr",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "374 BDT",
    "name": "Fresh Fortified Soyabean Oil",
    "quantity": "2 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Radhuni Pure Mustard Oil",
    "quantity": "500 ml",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "185 BDT",
    "name": "Teer Fortified Soyabean Oil ",
    "quantity": "1 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "1620 BDT",
    "name": "Suffola Active Plus Edible oil",
    "quantity": "5 ltr",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List saltNSugar = [
  {
    "id": "0",
    "price": "120 BDT",
    "name": "Loose White Sugar",
    "quantity": "1 kg",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "id": "1",
    "price": "22 BDT",
    "name": "ACI Pure Salt",
    "quantity": "500 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "id": "2",
    "price": "42 BDT",
    "name": "Fresh Super Premium",
    "quantity": "1 Kg",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "id": "3",
    "price": "55 BDT",
    "name": "Sugar Candy(Tal Misri) ",
    "quantity": "200 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "id": "4",
    "price": "559 BDT",
    "name": "Sis Brown Sugar",
    "quantity": "800 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List biscuits = [
  {
    "price": "10 BDT",
    "name": "Haque Mr. Cookie Butter",
    "quantity": "39 gm",
    "imageName": "assets/images/chaldal-premium-beef.webp",
    "details":
        "Protein, calcium, iodine and vitamin enriched egg noodles.Ingredients: Noodles: Spices, iodized salt, water. Masala: Iodized salt, tasting salt, corn starch, chicken powder, sugar, egg powder, chili powder, tapioca starch, citric acid. Nutrition: Minerals, fibre, calorie, protein, fat, carbohydrate, calcium, iron, carotene, vitamin B-1, vitamin B-2.",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "15 BDT",
    "name": "Olympic Energy Plus Biscuit",
    "quantity": "62 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        " MAGGI offers tasty and healthy snacks option for Bangladeshi families Fortified with Vitamin A, Iron and Iodine./n The tastemaker is comprised of known ingredients typically found in Bangladeshi households, such as turmeric, pepper, coriander, ginger and cardamom.To boost the goodness in your bowl, add colourful vegetables and lean protein such as chicken.Contains noodle cake & Tastemaker inside for a quick 2-minute preparation ",
    "variant": "Masala",
    "net-weight": "496g",
    "origin": "Bangladesh"
  },
  {
    "price": "20 BDT",
    "name": "Bangas Grand Choice Salted Biscuit",
    "quantity": "70 gm",
    "imageName": "assets/images/beef-front-leg-bone.jpg",
    "details":
        "Doodles instant noodles gives your fussy eating kids something tasty to look forward to. Kids’ love the irresistible taste of Doodles instant noodles that kills their boredom and provides iron, iodine, calcium and many other nutrient",
    "variant": "",
    "net-weight": "",
    "origin": "Bangladesh"
  },
  {
    "price": "20 BDT",
    "name": "Cocola Champion Chocolate biscuit",
    "quantity": "65 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
  {
    "price": "35 BDT",
    "name": "Pran Potata Spicy Biscuit",
    "quantity": "100 gm",
    "imageName": "assets/images/beef-kuruli-bone.jpg",
    "details":
        "MAGGI MASALA BLAST is Yummy and Spicy Noodles especially for the teenagers who love to have hot and spicy foods.Fortified with Vitamin A, Iron and Iodine.This unique tastemaker is comprised of the ingredients that consumers know and love such as red chilli, turmeric, black pepper, onion, ginger and cardamom sourced from both home and abroad.Contains noodle cake & Tastemaker inside for a quick preparation",
    "variant": "Masala blast",
    "net-weight": "504 g",
    "origin": "Bangladesh"
  },
];

List popular = [
  {
    "id": "0",
    "price": "120 BDT",
    "name": "Loose White Sugar",
    "quantity": "1 kg",
    "imageName": "assets/images/white-sugar.jpg",
    "details": "Pure and refined white sugar for everyday use.",
    "variant": "Premium",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "1",
    "price": "22 BDT",
    "name": "ACI Pure Salt",
    "quantity": "500 gm",
    "imageName": "assets/images/aci-salt.jpg",
    "details": "Refined iodized salt for a healthy diet.",
    "variant": "Refined",
    "net-weight": "500g",
    "origin": "Bangladesh"
  },
  {
    "id": "2",
    "price": "150 BDT",
    "name": "Premium Lentils",
    "quantity": "1 kg",
    "imageName": "assets/images/lentils.jpg",
    "details": "High-quality red lentils for nutritious meals.",
    "variant": "Fine Quality",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "3",
    "price": "550 BDT",
    "name": "Miniket Rice",
    "quantity": "5 kg",
    "imageName": "assets/images/miniket-rice.jpg",
    "details": "Fine quality Miniket rice, perfect for daily cooking.",
    "variant": "Super Fine",
    "net-weight": "5 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "4",
    "price": "140 BDT",
    "name": "Soybean Oil (Rupchanda)",
    "quantity": "1 liter",
    "imageName": "assets/images/soybean-oil.jpg",
    "details": "Refined soybean oil for healthy cooking.",
    "variant": "Refined",
    "net-weight": "1 liter",
    "origin": "Bangladesh"
  },
  {
    "id": "5",
    "price": "75 BDT",
    "name": "Fresh Brown Eggs",
    "quantity": "12 pcs",
    "imageName": "assets/images/eggs.jpg",
    "details": "Farm fresh brown eggs, rich in protein.",
    "variant": "Organic",
    "net-weight": "12 pcs",
    "origin": "Bangladesh"
  },
  {
    "id": "6",
    "price": "90 BDT",
    "name": "Red Onions",
    "quantity": "1 kg",
    "imageName": "assets/images/red-onion.jpg",
    "details": "Fresh red onions for cooking and salads.",
    "variant": "Local",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "7",
    "price": "50 BDT",
    "name": "Potatoes",
    "quantity": "2 kg",
    "imageName": "assets/images/potatoes.jpg",
    "details": "Fresh and organic potatoes.",
    "variant": "Organic",
    "net-weight": "2 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "8",
    "price": "200 BDT",
    "name": "Green Chili",
    "quantity": "500 gm",
    "imageName": "assets/images/green-chili.jpg",
    "details": "Fresh and spicy green chilies.",
    "variant": "Hot",
    "net-weight": "500 gm",
    "origin": "Bangladesh"
  },
  {
    "id": "9",
    "price": "60 BDT",
    "name": "Tomatoes",
    "quantity": "1 kg",
    "imageName": "assets/images/tomatoes.jpg",
    "details": "Fresh and juicy tomatoes.",
    "variant": "Local",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "10",
    "price": "300 BDT",
    "name": "Premium Chicken Breast",
    "quantity": "1 kg",
    "imageName": "assets/images/chicken-breast.jpg",
    "details": "Boneless and skinless chicken breast.",
    "variant": "Boneless",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "11",
    "price": "150 BDT",
    "name": "Local Honey",
    "quantity": "500 gm",
    "imageName": "assets/images/honey.jpg",
    "details": "Pure and natural local honey.",
    "variant": "Organic",
    "net-weight": "500 gm",
    "origin": "Bangladesh"
  }
];

List meatFish = [
  {
    "id": "0",
    "price": "650 BDT",
    "name": "Beef (Bone-in)",
    "quantity": "1 kg",
    "imageName": "assets/images/beef-bone-in.jpg",
    "details": "Fresh and high-quality beef with bone.",
    "variant": "Local Farm",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "1",
    "price": "720 BDT",
    "name": "Beef (Boneless)",
    "quantity": "1 kg",
    "imageName": "assets/images/beef-boneless.jpg",
    "details": "Fresh boneless beef, perfect for steaks and curries.",
    "variant": "Premium Cut",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "2",
    "price": "300 BDT",
    "name": "Chicken Breast",
    "quantity": "1 kg",
    "imageName": "assets/images/chicken-breast.jpg",
    "details": "Boneless, skinless chicken breast.",
    "variant": "Farm Fresh",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "3",
    "price": "270 BDT",
    "name": "Chicken Whole",
    "quantity": "1.5 kg",
    "imageName": "assets/images/chicken-whole.jpg",
    "details": "Fresh whole chicken, cleaned and ready to cook.",
    "variant": "Local",
    "net-weight": "1.5 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "4",
    "price": "550 BDT",
    "name": "Mutton (Bone-in)",
    "quantity": "1 kg",
    "imageName": "assets/images/mutton-bone-in.jpg",
    "details": "Tender mutton with bone, perfect for curries.",
    "variant": "Organic",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "5",
    "price": "580 BDT",
    "name": "Mutton (Boneless)",
    "quantity": "1 kg",
    "imageName": "assets/images/mutton-boneless.jpg",
    "details": "Premium boneless mutton for delicious dishes.",
    "variant": "Premium Cut",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "6",
    "price": "400 BDT",
    "name": "Rohu Fish",
    "quantity": "1.5 kg",
    "imageName": "assets/images/rohu-fish.jpg",
    "details": "Freshwater Rohu fish, cleaned and cut.",
    "variant": "Freshwater",
    "net-weight": "1.5 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "7",
    "price": "650 BDT",
    "name": "Katla Fish",
    "quantity": "1.5 kg",
    "imageName": "assets/images/katla-fish.jpg",
    "details": "Large Katla fish, fresh and healthy.",
    "variant": "Freshwater",
    "net-weight": "1.5 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "8",
    "price": "750 BDT",
    "name": "Hilsha Fish (Medium)",
    "quantity": "1 kg",
    "imageName": "assets/images/hilsha-fish.jpg",
    "details": "Premium quality Hilsha fish, national delicacy.",
    "variant": "River Fresh",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "9",
    "price": "1100 BDT",
    "name": "Hilsha Fish (Large)",
    "quantity": "1.5 kg",
    "imageName": "assets/images/hilsha-fish-large.jpg",
    "details": "Large Hilsha fish, best for traditional dishes.",
    "variant": "Premium",
    "net-weight": "1.5 kg",
    "origin": "Bangladesh"
  },
  {
    "id": "10",
    "price": "350 BDT",
    "name": "Prawns (Small)",
    "quantity": "500 gm",
    "imageName": "assets/images/prawns-small.jpg",
    "details": "Fresh small prawns, ideal for curries and frying.",
    "variant": "Freshwater",
    "net-weight": "500 gm",
    "origin": "Bangladesh"
  },
  {
    "id": "11",
    "price": "850 BDT",
    "name": "King Prawns",
    "quantity": "1 kg",
    "imageName": "assets/images/king-prawns.jpg",
    "details": "Large king prawns, great for grilling and curries.",
    "variant": "Premium",
    "net-weight": "1 kg",
    "origin": "Bangladesh"
  }
];
