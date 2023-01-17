// ignore_for_file: constant_identifier_names

import 'package:untitled1/Models/item_Info.dart';

import '../Helper/color_utils.dart';
import '../Models/Category.dart';


List<Category> DUMMY_CATEGORIES = [
  Category(
    id:1,
    title: 'السجاد',
    color: "#C0504D",
  ),
  Category(
    id:2,
    title: 'منسوجات القماش',
    color: "#C0504D",
  ),
  Category(
    id:3,
    title: 'المسدسات',
    color: "#0000FF",
  ),
  Category(
    id:4,
    title: 'البنادق',
    color: "#0000FF",
  ),
  Category(
    id: 5,
    title: ' السيوف ',
    color: "#0000FF",
  ),
  Category(
    id:6,
    title: 'القامات',
    color: "#0000FF",
  ),
  Category(
    id:7,
    title: 'اليطغان ',
    color: "#0000FF",
  ),
  Category(
    id:8,
    title: ' الحراب',
    color: "#0000FF",
  ),
  Category(
    id:9,
    title: 'الخناجر',
    color: "#0000FF",
  ),
  Category(
    id: 10,
    title: 'سكاكين',
    color: "#0000FF",
  ),
  Category(
    id: 11,
    title: 'الدروع',
    color: "#0000FF",
  ),
  Category(
    id: 12,
    title: 'الخوذ',
    color: "#0000FF",
  ),
  Category(
    id: 13,
    title: 'طبرزون',
    color: "#0000FF",
  ),
  Category(
    id: 14,
    title: 'درع حلقي',
    color: "#0000FF",
  ),
  Category(
    id: 15,
    title: 'خوذ',
    color: "#0000FF",
  ),
  Category(
    id:16,
    title: 'هراوات',
    color: "#0000FF",
  ),
  Category(
    id: 17,
    title: 'كفوف',
    color: "#FFC107",
  ),
  Category(
    id: 18,
    title: 'شمعدان',
    color: "#FFC107",
  ),
  Category(
    id: 19,
    title: 'زيارات',
    color: "#FFC107",
  ),
  Category(
    id: 20,
    title: 'الكشكول',
    color: "#FFC107",
  ),
  Category(
    id: 21,
    title: 'سماور',
    color: "#FFC107",
  ),
  Category(
    id: 22,
    title: 'اوسمة ومداليات',
    color: "#FFC107",
  ),
  Category(
    id: 23,
    title: 'زناجيل',
    color: "#FFC107",
  ),
  Category(
    id: 24,
    title: 'الصولجان',
    color: "#FFC107",
  ),
  Category(
    id: 25,
    title: 'سيتات',
    color: "#FFC107",
  ),
  Category(
    id: 26,
    title: 'اواني معدنية',
    color: "#FFC107",
  ),
  Category(
    id: 27,
    title: 'راس سارية',
    color: "#FFC107",
  ),
  Category(
    id: 28,
    title: 'القرب',
    color: "#FFC107",
  ),
  Category(
    id: 29,
    title: 'مرشة ماء ورد',
    color: "#FFC107",
  ),
  Category(
    id: 30,
    title: 'اقفال و مفاتيح',
    color: "#FFC107",
  ),
  Category(
    id:31,
    title: 'مبخرة',
    color: "#FFC107",
  ),
  Category(
    id: 32,
    title: 'حلي و مصوغات',
    color: "#009688",
  ),
  Category(
    id: 33,
    title: 'المسكوكات',
    color: "#E91E63",
  ),
  Category(
    id: 34,
    title: 'العملات',
    color: "#E91E63",
  ),
  Category(
    id: 35,
    title: 'الطوابع',
    color: "#E91E63",
  ),
  Category(
    id: 36,
    title: 'ثريا',
    color: "#181502",
  ),
  Category(
    id: 37,
    title: 'لوحات',
    color: "#181502",
  ),
  Category(
    id: 38,
    title: 'متفرقة',
    color: "#181502",
  ),
  Category(
    id: 39,
    title: 'مينا',
    color: "#181502",
  ),
  Category(
    id: 40,
    title: 'فخار مزجج',
    color: "#181502",
  ),
  Category(
    id: 41,
    title: 'اجزاء الضريح',
    color: "#181502",
  ),
  Category(
    id: 42,
    title: 'مصباح منضدي',
    color: "#181502",
  ),
  Category(
    id: 43,
    title: 'لالة',
    color: "#181502",
  ),
  Category(
    id: 44,
    title: 'الاجراس',
    color: "#181502",
  ),
  Category(
    id:45,
    title: 'طره',
    color: "#181502",
  ),
  Category(
    id: 46,
    title: 'ريش',
    color: "#181502",
  ),
  Category(
    id: 47,
    title: 'قنديل',
    color: "#181502",
  ),
  Category(
    id: 48,
    title: 'رحلة قرأن',
    color: "#181502",
  ),
  Category(
    id: 49,
    title: 'لوكس',
    color: "#181502",
  ),
  Category(
    id: 50,
    title: 'مرمر',
    color: "#181502",
  ),
  Category(
    id: 51,
    title: 'مرأة',
    color: "#C0504D",
  ),
  Category(
    id: 52,
    title: ' صناديق ',
    color: "#C0504D",
  ),
  Category(
    id: 53,
    title: 'متحجرات وبحريات',
    color: "#C0504D",
  ),
];
 List<ItemInfo> DUMMY_ITEMS = [
  ItemInfo(id: 1, museumNumber: "km1", name: "مشكباد", details: "سجاده نوع (مشكباد )نسج يدوي من الطراز الممتاز عليها نقوش وزخارف نباتية على شكل هندسي تتوسطها طرة ومؤطرة باطارين  واما اللون الغالب فيها (احمر - اصفر - نيلي)", category: 1 ,manufacturersName: 'احمد ',Date: "1850",material: 'قطن'),
  ItemInfo(id: 2, museumNumber: "km2", name: "2", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 3, museumNumber: "km3", name: "3", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 4, museumNumber: "km4", name: "4", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 5, museumNumber: "km5", name: "5", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 6, museumNumber: "km6", name: "6", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 7, museumNumber: "km7", name: "7", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 8, museumNumber: "km8", name: "8", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 9, museumNumber: "km9", name: "9", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 10, museumNumber: "km10", name: "10", details: "details", category: 1 ,manufacturersName: '',Date: "0",material: ''),

  ItemInfo(id: 1, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date:" 0",material: ''),
  ItemInfo(id: 2, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 3, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 4, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 5, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 6, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 7, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 8, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
  ItemInfo(id: 9, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),
   ItemInfo(id: 10, museumNumber: "museumNumber", name: "name", details: "details", category: 2 ,manufacturersName: '',Date: "0",material: ''),


];
// const DUMMY_MEALS = const [
//   Meal(
//     id: 'm1',
//     categories: [
//       'c1',
//       'c2',
//     ],
//     title: 'Spaghetti with Tomato Sauce',
//     affordability: Affordability.Affordable,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
//     duration: 20,
//     ingredients: [
//       '4 Tomatoes',
//       '1 Tablespoon of Olive Oil',
//       '1 Onion',
//       '250g Spaghetti',
//       'Spices',
//       'Cheese (optional)'
//     ],
//     steps: [
//       'Cut the tomatoes and the onion into small pieces.',
//       'Boil some water - add salt to it once it boils.',
//       'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
//       'In the meantime, heaten up some olive oil and add the cut onion.',
//       'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
//       'The sauce will be done once the spaghetti are.',
//       'Feel free to add some cheese on top of the finished dish.'
//     ],
//     isGlutenFree: false,
//     isVegan: true,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm2',
//     categories: [
//       'c2',
//     ],
//     title: 'Toast Hawaii',
//     affordability: Affordability.Affordable,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
//     duration: 10,
//     ingredients: [
//       '1 Slice White Bread',
//       '1 Slice Ham',
//       '1 Slice Pineapple',
//       '1-2 Slices of Cheese',
//       'Butter'
//     ],
//     steps: [
//       'Butter one side of the white bread',
//       'Layer ham, the pineapple and cheese on the white bread',
//       'Bake the toast for round about 10 minutes in the oven at 200°C'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm3',
//     categories: [
//       'c2',
//       'c3',
//     ],
//     title: 'Classic Hamburger',
//     affordability: Affordability.Pricey,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
//     duration: 45,
//     ingredients: [
//       '300g Cattle Hack',
//       '1 Tomato',
//       '1 Cucumber',
//       '1 Onion',
//       'Ketchup',
//       '2 Burger Buns'
//     ],
//     steps: [
//       'Form 2 patties',
//       'Fry the patties for c. 4 minutes on each side',
//       'Quickly fry the buns for c. 1 minute on each side',
//       'Bruch buns with ketchup',
//       'Serve burger with tomato, cucumber and onion'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm4',
//     categories: [
//       'c4',
//     ],
//     title: 'Wiener Schnitzel',
//     affordability: Affordability.Luxurious,
//     complexity: Complexity.Challenging,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
//     duration: 60,
//     ingredients: [
//       '8 Veal Cutlets',
//       '4 Eggs',
//       '200g Bread Crumbs',
//       '100g Flour',
//       '300ml Butter',
//       '100g Vegetable Oil',
//       'Salt',
//       'Lemon Slices'
//     ],
//     steps: [
//       'Tenderize the veal to about 2–4mm, and salt on both sides.',
//       'On a flat plate, stir the eggs briefly with a fork.',
//       'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
//       'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
//       'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
//       'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
//       'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
//     ],
//     isGlutenFree: false,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm5',
//     categories: [
//       'c2'
//           'c5',
//       'c10',
//     ],
//     title: 'Salad with Smoked Salmon',
//     affordability: Affordability.Luxurious,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
//     duration: 15,
//     ingredients: [
//       'Arugula',
//       'Lamb\'s Lettuce',
//       'Parsley',
//       'Fennel',
//       '200g Smoked Salmon',
//       'Mustard',
//       'Balsamic Vinegar',
//       'Olive Oil',
//       'Salt and Pepper'
//     ],
//     steps: [
//       'Wash and cut salad and herbs',
//       'Dice the salmon',
//       'Process mustard, vinegar and olive oil into a dessing',
//       'Prepare the salad',
//       'Add salmon cubes and dressing'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm6',
//     categories: [
//       'c6',
//       'c10',
//     ],
//     title: 'Delicious Orange Mousse',
//     affordability: Affordability.Affordable,
//     complexity: Complexity.Hard,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
//     duration: 240,
//     ingredients: [
//       '4 Sheets of Gelatine',
//       '150ml Orange Juice',
//       '80g Sugar',
//       '300g Yoghurt',
//       '200g Cream',
//       'Orange Peel',
//     ],
//     steps: [
//       'Dissolve gelatine in pot',
//       'Add orange juice and sugar',
//       'Take pot off the stove',
//       'Add 2 tablespoons of yoghurt',
//       'Stir gelatin under remaining yoghurt',
//       'Cool everything down in the refrigerator',
//       'Whip the cream and lift it under die orange mass',
//       'Cool down again for at least 4 hours',
//       'Serve with orange peel',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm7',
//     categories: [
//       'c7',
//     ],
//     title: 'Pancakes',
//     affordability: Affordability.Affordable,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
//     duration: 20,
//     ingredients: [
//       '1 1/2 Cups all-purpose Flour',
//       '3 1/2 Teaspoons Baking Powder',
//       '1 Teaspoon Salt',
//       '1 Tablespoon White Sugar',
//       '1 1/4 cups Milk',
//       '1 Egg',
//       '3 Tablespoons Butter, melted',
//     ],
//     steps: [
//       'In a large bowl, sift together the flour, baking powder, salt and sugar.',
//       'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
//       'Heat a lightly oiled griddle or frying pan over medium high heat.',
//       'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm8',
//     categories: [
//       'c8',
//     ],
//     title: 'Creamy Indian Chicken Curry',
//     affordability: Affordability.Pricey,
//     complexity: Complexity.Challenging,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
//     duration: 35,
//     ingredients: [
//       '4 Chicken Breasts',
//       '1 Onion',
//       '2 Cloves of Garlic',
//       '1 Piece of Ginger',
//       '4 Tablespoons Almonds',
//       '1 Teaspoon Cayenne Pepper',
//       '500ml Coconut Milk',
//     ],
//     steps: [
//       'Slice and fry the chicken breast',
//       'Process onion, garlic and ginger into paste and sauté everything',
//       'Add spices and stir fry',
//       'Add chicken breast + 250ml of water and cook everything for 10 minutes',
//       'Add coconut milk',
//       'Serve with rice'
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: false,
//     isLactoseFree: true,
//   ),
//   Meal(
//     id: 'm9',
//     categories: [
//       'c9',
//     ],
//     title: 'Chocolate Souffle',
//     affordability: Affordability.Affordable,
//     complexity: Complexity.Hard,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
//     duration: 45,
//     ingredients: [
//       '1 Teaspoon melted Butter',
//       '2 Tablespoons white Sugar',
//       '2 Ounces 70% dark Chocolate, broken into pieces',
//       '1 Tablespoon Butter',
//       '1 Tablespoon all-purpose Flour',
//       '4 1/3 tablespoons cold Milk',
//       '1 Pinch Salt',
//       '1 Pinch Cayenne Pepper',
//       '1 Large Egg Yolk',
//       '2 Large Egg Whites',
//       '1 Pinch Cream of Tartar',
//       '1 Tablespoon white Sugar',
//     ],
//     steps: [
//       'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
//       'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
//       'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
//       'Place chocolate pieces in a metal mixing bowl.',
//       'Place bowl over a pan of about 3 cups hot water over low heat.',
//       'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
//       'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
//       'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
//       'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
//       'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
//       'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
//       'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
//       'Transfer a little less than half of egg whites to chocolate.',
//       'Mix until egg whites are thoroughly incorporated into the chocolate.',
//       'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
//       'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
//       'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
//     ],
//     isGlutenFree: true,
//     isVegan: false,
//     isVegetarian: true,
//     isLactoseFree: false,
//   ),
//   Meal(
//     id: 'm10',
//     categories: [
//       'c2',
//       'c5',
//       'c10',
//     ],
//     title: 'Asparagus Salad with Cherry Tomatoes',
//     affordability: Affordability.Luxurious,
//     complexity: Complexity.Simple,
//     imageUrl:
//         'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
//     duration: 30,
//     ingredients: [
//       'White and Green Asparagus',
//       '30g Pine Nuts',
//       '300g Cherry Tomatoes',
//       'Salad',
//       'Salt, Pepper and Olive Oil'
//     ],
//     steps: [
//       'Wash, peel and cut the asparagus',
//       'Cook in salted water',
//       'Salt and pepper the asparagus',
//       'Roast the pine nuts',
//       'Halve the tomatoes',
//       'Mix with asparagus, salad and dressing',
//       'Serve with Baguette'
//     ],
//     isGlutenFree: true,
//     isVegan: true,
//     isVegetarian: true,
//     isLactoseFree: true,
//   ),
// ];
