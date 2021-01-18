String storyLabel = "STORY MODE";
String survivalLabel = "SURVIVAL MODE";
String howToLabel = "HOW TO PLAY";
String quitLabel = "Exit";

PFont mainFont;

String gameState = "menu";

boolean mouseOver=false;
boolean dragged=false;

color background,splant,dplant,opensquares;

byte w=11,h=6,bs=90;

byte [][] squares=new byte [10][5];

ArrayList <Plants> plants=new ArrayList <Plants>();
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
ArrayList <Enemy> enemies = new ArrayList<Enemy>();
ArrayList <Plants> shieldPlants = new ArrayList <Plants>();
ArrayList <Plants> sunPlants = new ArrayList <Plants>();
ArrayList <Money> money=new ArrayList <Money>();

int numOfZombies;
int roundNum= 0;

String roundLabel = "Round ";
String zombiesLabel = "Zombies left: ";

color lockColour = color(128,128,128);
int time;
int timeDelay;
int quickDelay;
int quickTime;
int coinDelay;
int coinTime;
int attackTime, attackDelay, sunDelay, sunTime;

int spawn;
int spawnDelay=3000;
int zombieType;
Player player = new Player(100);

int lvl2 = 1, lvl3 = 1, lvl4 = 1, lvl5 = 1, lvl6 = 1, lvl7 = 1, lvl8 = 1, lvl9 = 1, lvl10 =1;
int level = 0;
        

PImage storyBackground, lockImage, storyScreen, gameBackground, playerImage, doubleImage, nutImage, sunFlowerImage, snowImage, backgroundImage, logoImage, helpImage, signImage, exitImage, zombieImage;
int storyZombies;

void setup(){
  coinTime = millis();
  sunTime = millis();
  
  attackTime = millis();
  attackDelay = 1000;
  
  timeDelay = 2000;
  quickDelay = 500;
  time = millis();
  spawn = millis();
  quickTime = millis();
  
  mainFont = createFont("Name Smile.otf", 32);
  
  lockImage = loadImage("lock.png");
  lockImage.resize(75,75);
  
  storyBackground = loadImage("StoryBack.png");
  storyBackground.resize(1280,660);
  
  gameBackground = loadImage("GameBackground.png");
  gameBackground.resize(1280,660);
  
  signImage = loadImage("sign.png");
  signImage.resize(1280,660);
  
  storyScreen = loadImage("storyScreen.png");
  storyScreen.resize(1280,660);
  
  zombieImage = loadImage("Zombie.jpeg");
  zombieImage.resize(75,75);
  
  helpImage = loadImage("help.png");
  helpImage.resize(1280,660);
  
  backgroundImage = loadImage("summer.png");
  backgroundImage.resize(1280,660);
  
  logoImage = loadImage("logo.png");
  logoImage.resize(300,150);
  
  playerImage = loadImage("Shooter2.gif");
  playerImage.resize(75, 75);
  
  doubleImage = loadImage("4.png");
  doubleImage.resize(75, 75);
  
  nutImage = loadImage("nut.png");
  nutImage.resize(75, 75);
  
  sunFlowerImage = loadImage("sunflower.png");
  sunFlowerImage.resize(75, 75);
  
  snowImage = loadImage("snow.png");
  snowImage.resize(75, 75);
  
  backgroundImage = loadImage("summer.png");
  backgroundImage.resize(1280,660);
  
  exitImage = loadImage("exit.png");
  exitImage.resize(40,40);
  
  size (1280,660);
  smooth();
  colorMode (RGB);
  splant= color(0, 255, 0);
  dplant= color(0, 153, 51);
  
  if (level == 1){
    storyZombies = 7;
  }else if (level == 2){
    storyZombies = 12;
  }else if (level == 3){
    storyZombies = 15;
  }else if (level == 4){
    storyZombies = 15;
  }else if (level == 5){
    storyZombies = 21;
  }else if (level == 6){
    storyZombies = 27;
  }else if (level == 7){
    storyZombies = 34;
  }else if (level == 8){
    storyZombies = 40;
  }else if (level == 9){
    storyZombies = 47;
  }else if (level == 10){
    storyZombies = 55;
  }
  
  if (roundNum == 0){
    numOfZombies = 5;
  }else{
    numOfZombies = 10 + roundNum;
  }
  
  
}

boolean allowMovement = true;

void draw(){
  if (gameState.equals("menu")){   
    
    mouseFunctions();
    
    image(backgroundImage, 0,0);
    image (logoImage, 100,50);
  
    fill(255,255,0);
    rect(100,220,300,70);
    rect(100,320,300,70);
    rect(100,420,300,70);
    rect(100,520,300,70);

    textFont(mainFont);
    textSize(28);
    fill(0);
    text (storyLabel, 139, 265);
    text (survivalLabel, 110, 365);
    text (howToLabel, 135, 465);
    text (quitLabel, 210, 565);    
    
    
}

if (gameState.equals("StoryMode")){
  image(storyScreen,0,0);
  mouseFunctions();
  
  if (lvl2 == 1){
    image(lockImage, 348,170);
  }if (lvl3 == 1){
    image(lockImage, 598,170);
  }if (lvl4 == 1){
    image(lockImage, 848,170);
  }if (lvl5 == 1){
    image(lockImage, 1098,170);
  }if (lvl6 == 1){
    image(lockImage, 95,380);
  }if (lvl7 == 1){
    image(lockImage, 348,380);
  }if (lvl8 == 1){
    image(lockImage, 598,380);
  }if (lvl9 == 1){
    image(lockImage, 848,380);
  }if (lvl10 == 1){
    image(lockImage, 1098,380);
  }
}

if (gameState.equals("StoryGame")){
  coinDelay = 10000;
  sunDelay = 8500;
  
  image(storyBackground, 0,0);
  mouseFunctions();
  displayStory();
  
  if (level == 1){
    spawnDelay = 13000;
  }else if (level == 2){
    spawnDelay = 10000;
  }else if (level == 3){
    spawnDelay = 9000;
  }else if (level == 4){
    spawnDelay = 8000;
  }else if (level == 5){
    spawnDelay = 7000;
  }else if (level == 6){
    spawnDelay = 6000;
  }else if (level == 7){
    spawnDelay = 5000;
  }else if (level == 8){
    spawnDelay = 2500;
  }else if (level == 9){
    spawnDelay = 1500;
  }else if (level == 10){
    spawnDelay = 850;
  }
  
  fill(0);
  text("100", 108,190);
  if (lvl3 == 0){
    text("200", 108,285);
  }
  if(lvl5 == 0){
    text("175", 108,380);
  }
  if (lvl7 == 0){
    text("150", 108,475);
  }
  text("50", 108,570);
  
  if (player.getCoins()>= 100){
    fill(splant);
    rect(10,105,bs,bs);
    image(playerImage,20,120,60,60);
  }else {
    fill(lockColour);
    rect(10,105,bs,bs);
  }
  
  if (lvl3 == 0){
    if (player.getCoins()>= 200){
      fill(255,0,0);
      rect(10,200,bs,bs);
      image(doubleImage,23,215,60,60);
    }else{
      fill(lockColour);
      rect(10,200,bs,bs);
    }
  }

if (lvl5 == 0){
if (player.getCoins()>=150){
  fill(0,0,255);
  rect(10,295,bs,bs);
  image(snowImage,23,310,60,60);
}else{
  fill(lockColour);
  rect(10,295,bs,bs);
}
}
    
if (lvl7 == 0){
if (player.getCoins() >= 150){
  fill(160,32,240);
  rect(10,390,bs,bs);
  image(nutImage,23,405,60,60);
}else{
  fill(lockColour);
  rect(10,390,bs,bs);
}
}

if (player.getCoins() >= 50){
  fill(255,255,0);
  rect(10,485,bs,bs);
  image(sunFlowerImage,23,500,60,60);
}else {
  fill(lockColour);
  rect(10,485,bs,bs);
}

byte o=0;

if (player.getCoins() < 1000){
  if (millis() > coinDelay + coinTime){
    generateCoin();
    coinTime = millis();
  }
}

if (player.getCoins() < 1000){
for (int i=0;i<money.size();i++){
    money.get(i).display();
if (dist(money.get(i).getx(),money.get(i).gety(),mouseX,mouseY)<15){
  if (mousePressed) {
  player.pickupcoin();
  money.remove(i);  
}

}
 o++;
}
}

fill (0);
textSize(18);
if (player.getCoins() >= 1000){
  fill (0);
  text ("MAX",355,25);
}else{
  fill (0);
  text (player.getCoins(),355,25);
}
fill (0);
text (player.getLives(), 85, 82);

//grid
for (byte i=0;i<h;i++) line(190,105+i*bs,1090,105+i*bs);
for (byte i=0; i<w; i++) line(190+i*bs,105,190+i*bs,555);
//For mouse things
mouseFunctions();
//For displaying the plants

for (Plants player:plants){
  player.display();
}

for (Plants player:shieldPlants){
  player.display();
}

for (Plants p:sunPlants){
  p.display();
  if (player.getCoins() < 800){
    if (millis() > sunTime + sunDelay){
      sunCoin();
      sunTime = millis();
    }
  }
}

//Nick's shit
if (lvl2 == 0){
  zombieType = int(random(1));
} else if (lvl4 == 0){
  zombieType = int(random(3));
} else if (lvl5 == 0){
  zombieType = int(random(4));
} else if (lvl7 == 0){
  zombieType = int(random(6));
}else if (lvl8 == 0){
  zombieType = int(random(8));
}else if (lvl10 == 0){
  zombieType = int(random(10));
}

Enemy c = new Enemy();

if (millis() > spawn + spawnDelay){
if (zombieType == 0){
  BasicZombie e = new BasicZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 1){
  BasicZombie e = new BasicZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 2){
  ToughZombie e = new ToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
}else if (zombieType == 3){
  RunnerZombie e = new RunnerZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 4){
  ToughZombie e = new ToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
}else if (zombieType == 5){
  ExtremeToughZombie e = new ExtremeToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
} else if (zombieType == 6){
  RunnerZombie e = new RunnerZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
} else if (zombieType == 7){
  ExtremeFastZombie e = new ExtremeFastZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 8){
  ExtremeFastZombie e = new ExtremeFastZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 9){
  ExtremeToughZombie e = new ExtremeToughZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}
  spawn = millis();
}

  if(millis() > time + timeDelay) {
    for (Plants i: plants){
      for (int j = 0; j < enemies.size(); j++){
        Enemy currEnemy = enemies.get(j);
        if (i.y+45 == currEnemy.y){
          Bullet b = new Bullet(i.getX()+90, i.getY()+45);       
          shoot(b);
          time = millis();
      }
    }
  }
  }
  
  for (int j = 0; j < enemies.size(); j++){
        Enemy currEnemy = enemies.get(j);  
  if (currEnemy.getX() < 200){
        removeEnemy(currEnemy);
      }
  }
  
  
  for (Enemy enemy : enemies){
    enemy.display();
    enemy.update();
  }
  
  
  for (Bullet bullet : bullets) {
    bullet.display();
    bullet.update();
  }
  
  for (int i = 0; i < plants.size(); i++){
    Plants plant = plants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y ) < 120){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          removePlant(plant);
          currEnemy.setSpeed(-1);
        }
      }
    }
  }
  
  for (int i = 0; i < shieldPlants.size(); i++){
    Plants plant = shieldPlants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y) < 120){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          removeShieldPlant(plant);
          currEnemy.setSpeed(-1);
        }
      } 
    }
  }
  
  for (int i = 0; i < sunPlants.size(); i++){
    Plants plant = sunPlants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y) < 120){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          removeSunPlant(plant);
          currEnemy.setSpeed(-1);
        }
      } 
    }
  }
  
  //if bullet intersects with enemy
   for (int i = 0; i < bullets.size(); i++){
    Bullet currBullet = bullets.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (currBullet.x, currBullet.y, currEnemy.x, currEnemy.y) < 40){
        removeBullet(currBullet);
        currEnemy.health = currEnemy.health - 1;
        if(currEnemy.health <= 0){
          storyRemoval(currBullet, currEnemy);
        }
      }
    }
  }
  
  if (storyZombies == 0){
    if (level == 10){
      gameState = ("level10Complete");
      removeAll();
      roundNum = 0;
      numOfZombies = 10;
      spawnDelay = 14000;
      player.setLives(5);
      player.setCoins(100);
      spawn = millis();
      removeAll();
    }else{
    gameState = ("Storycomplete");
    removeAll();
    roundNum = 0;
    numOfZombies = 10;
    spawnDelay = 14000;
    player.setLives(5);
    player.setCoins(100);
    removeAll();
    spawn = millis();
    if (level == 1){
      lvl2 = 0;
    }
    if (level == 2){
      lvl3 = 0;
    }
    if (level == 3){
      lvl4 = 0;
    }
    if (level == 4){
      lvl5 = 0;
    }
    if (level == 5){
      lvl6 = 0;
    }
    if (level == 6){
      lvl7 = 0;
    }
    if (level == 7){
      lvl8 = 0;
    }
    if (level == 8){
      lvl9 = 0;
    }
    if (level == 9){
      lvl10 = 0;
    }
    }
  }
  
  if (player.getLives() == 0){
    gameState = ("Storyfail");
    removeAll();
    roundNum = 0;
    numOfZombies = 10;
    spawnDelay = 14000;
    player.setLives(5);
    player.setCoins(100); 
    spawn = millis();
    removeAll();
  }
  image(exitImage, 1220, 610);


}


if (gameState.equals("waveMode")){ 

  if (roundNum == 0){
    spawnDelay = 13000;
  }
  else if(roundNum == 1){
                spawnDelay = 4000;
            }else if (roundNum == 2){
                spawnDelay = 3500;
            }else if (roundNum == 3){
                spawnDelay = 3000;
            }else if (roundNum == 4){
                spawnDelay = 2900;
            }else if (roundNum == 5){
                spawnDelay = 2800;
            }else if (roundNum == 6){
                spawnDelay = 2700;
            }else if (roundNum == 7){
                spawnDelay = 2600;
            }else if (roundNum == 8){
                spawnDelay = 2500;
            }else if (roundNum == 9){
                spawnDelay = 2400;
            }else if (roundNum == 10){
                spawnDelay = 2300;
            }else if (roundNum == 11){
                spawnDelay = 2200;
            }else if (roundNum == 12){
                spawnDelay = 2100;
            }else if (roundNum == 13){
                spawnDelay = 2000;
            }else if (roundNum == 14){
                spawnDelay = 1900;
            }else if (roundNum == 15){
                spawnDelay = 1800;
            }else if (roundNum == 16){
                spawnDelay = 1700;
            }else if (roundNum == 17){
                spawnDelay = 1600;
            }else if (roundNum == 18){
                spawnDelay = 1500;
            }else if (roundNum == 19){
                spawnDelay = 1400;
            }else if (roundNum == 20){
                spawnDelay = 1300;
            }else if (roundNum == 21){
                spawnDelay = 1200;
            }else if (roundNum == 22){
                spawnDelay = 1100;
            }else if (roundNum == 23){
                spawnDelay = 1000;
            }else if (roundNum == 24){
                spawnDelay = 1000;
            }else if (roundNum == 25){
                spawnDelay = 900;
            }else if (roundNum >= 26){
                spawnDelay = 900;
            }
            
           if (roundNum == 0){
            coinDelay = 10000;
            sunDelay = 8500;
           }else if (roundNum > 0){
            coinDelay = 20000;
            sunDelay = 17000;
           }
  
            
            
//Background color
textSize(12);
image(gameBackground,0,0);
displayRound();

//ADD THIS TO NEW
text("100", 108,190);
text("200", 108,285);
text("175", 108,380);
text("150", 108,475);
text("50", 108,570);

//Plant Selection with plant colour
if (player.getCoins()>= 100){
  fill(splant);
  rect(10,105,bs,bs);
  image(playerImage,20,120,60,60);
}else {
  fill(lockColour);
  rect(10,105,bs,bs);
}
if (player.getCoins()>= 200){
  fill(255,0,0);
  rect(10,200,bs,bs);
  image(doubleImage,23,215,60,60);
}else{
  fill(lockColour);
  rect(10,200,bs,bs);
}
if (player.getCoins()>=150){
  fill(0,0,255);
  rect(10,295,bs,bs);
  image(snowImage,23,310,60,60);
}else{
  fill(lockColour);
  rect(10,295,bs,bs);
}
if (player.getCoins() >= 150){
  fill(160,32,240);
  rect(10,390,bs,bs);
  image(nutImage,23,405,60,60);
}else{
  fill(lockColour);
  rect(10,390,bs,bs);
}
if (player.getCoins() >= 50){
  fill(255,255,0);
  rect(10,485,bs,bs);
  image(sunFlowerImage,23,500,60,60);
}else {
  fill(lockColour);
  rect(10,485,bs,bs);
}

byte o=0;

if (player.getCoins() < 500){
  if (millis() > coinDelay + coinTime){
    generateCoin();
    coinTime = millis();
  }
}

if (player.getCoins() < 500){
for (int i=0;i<money.size();i++){
    money.get(i).display();
if (dist(money.get(i).getx(),money.get(i).gety(),mouseX,mouseY)<15){
  if (mousePressed) {
  player.pickupcoin();
  money.remove(i);  
}

}
 o++;
}
}

//ADD THIS TO NEW
fill (0);
textSize(18);
if (player.getCoins() >= 500){
  fill (0);
  text ("MAX",355,25);
}else{
  fill (0);
  text (player.getCoins(),355,25);
}
fill (0);

text (player.getLives(), 85, 82);

//grid
for (byte i=0;i<h;i++) line(190,105+i*bs,1090,105+i*bs);
for (byte i=0; i<w; i++) line(190+i*bs,105,190+i*bs,555);
//For mouse things
mouseFunctions();
//For displaying the plants

for (Plants player:plants){
  player.display();
}

for (Plants player:shieldPlants){
  player.display();
}

for (Plants p:sunPlants){
  p.display();
  if (player.getCoins() < 800){
    if (millis() > sunTime + sunDelay){
      sunCoin();
      sunTime = millis();
    }
  }
}

//Nick's shit
if (roundNum == 0){
  zombieType = int(random(1));
} else if (roundNum > 0 && roundNum <= 5){
  zombieType = int(random(3));
} else if (roundNum > 5 && roundNum <= 10){
  zombieType = int(random(4));
} else if (roundNum > 10 && roundNum < 15){
  zombieType = int(random(6));
}else if (roundNum >= 15 && roundNum < 21){
  zombieType = int(random(8));
}else if (roundNum >= 21){
  zombieType = int(random(10));
}

Enemy c = new Enemy();

if (millis() > spawn + spawnDelay){
if (zombieType == 0){
  BasicZombie e = new BasicZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 1){
  BasicZombie e = new BasicZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 2){
  ToughZombie e = new ToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
}else if (zombieType == 3){
  RunnerZombie e = new RunnerZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 4){
  ToughZombie e = new ToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
}else if (zombieType == 5){
  ExtremeToughZombie e = new ExtremeToughZombie(c.getX(),c.getY(),c.getS()); 
  spawn(e);
} else if (zombieType == 6){
  RunnerZombie e = new RunnerZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
} else if (zombieType == 7){
  ExtremeFastZombie e = new ExtremeFastZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 8){
  ExtremeFastZombie e = new ExtremeFastZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}else if (zombieType == 9){
  ExtremeToughZombie e = new ExtremeToughZombie(c.getX(),c.getY(),c.getS());
  spawn(e);
}
  spawn = millis();
}

 
 
  
  if(millis() > time + timeDelay) {
    for (Plants i: plants){
      for (int j = 0; j < enemies.size(); j++){
        Enemy currEnemy = enemies.get(j);
        if (i.y+45 == currEnemy.y){
          Bullet b = new Bullet(i.getX()+90, i.getY()+45);       
          shoot(b);
          time = millis();
      }
    }
  }
  }
  
  for (int j = 0; j < enemies.size(); j++){
        Enemy currEnemy = enemies.get(j);  
  if (currEnemy.getX() < 200){
        removeEnemy(currEnemy);
      }
  }
  
  
  for (Enemy enemy : enemies){
    enemy.display();
    enemy.update();
  }
  
  
  for (Bullet bullet : bullets) {
    bullet.display();
    bullet.update();
  }
  
  for (int i = 0; i < plants.size(); i++){
    Plants plant = plants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y ) < 45){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          squares[(plant.getX()-190)/90][(plant.getY()-105)/90]=0;
          removePlant(plant);
          currEnemy.setSpeed(-1);
        }
      }
    }
  }
  
  for (int i = 0; i < shieldPlants.size(); i++){
    Plants plant = shieldPlants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y) < 45){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          squares[(plant.getX()-190)/90][(plant.getY()-105)/90]=0;
          removeShieldPlant(plant);
          currEnemy.setSpeed(-1);
        }
      } 
    }
  }
  
  for (int i = 0; i < sunPlants.size(); i++){
    Plants plant = sunPlants.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (plant.x, plant.y, currEnemy.x, currEnemy.y) < 45){
        currEnemy.setSpeed(0);
        if (millis() > attackTime + attackDelay){
          plant.setHealth(plant.getHealth() - 1);
          attackTime = millis();
        }
        if (plant.getHealth() <= 0){
          squares[(plant.getX()-190)/90][(plant.getY()-105)/90]=0;
          removeSunPlant(plant);
          currEnemy.setSpeed(-1);
        }
      } 
    }
  }
  
  //if bullet intersects with enemy
   for (int i = 0; i < bullets.size(); i++){
    Bullet currBullet = bullets.get(i);
    for (int k = 0; k < enemies.size(); k++){
      Enemy currEnemy = enemies.get(k);
      if (dist (currBullet.x, currBullet.y, currEnemy.x, currEnemy.y) < 40){
        removeBullet(currBullet);
        currEnemy.health = currEnemy.health - 1;
        if(currEnemy.health <= 0){
          removal(currBullet, currEnemy);
        }
      }
    }
  }
  
  if (roundNum == 30){
    gameState = ("complete");
    removeAll();
    roundNum = 0;
    numOfZombies = 10;
    spawnDelay = 4000;
    player.setLives(5);
    player.setCoins(100);
    spawn = millis();
  }
  
  if (player.getLives() == 0){
    gameState = ("fail");
    removeAll();
    roundNum = 0;
    numOfZombies = 10;
    spawnDelay = 4000;
    player.setLives(5);
    player.setCoins(100); 
    spawn = millis();
  }
  
  image(exitImage, 1220, 610);
}
if (gameState.equals("complete")){
  image(signImage,0,0);
  
  mouseFunctions();
  textFont(mainFont);
  textSize(45);
  fill(255);
  text ("CONGRATULATIONS", 355, 135);
  textSize(20);
  text ("YOU HAVE SURVIVED THE ZOMBIE ATTACK", 367, 170);
  text (player.getLives() + " LIVES LEFT", 550, 200);
  textSize(30);
  text ("BACK TO MENU", 495, 330);
}

if (gameState.equals("fail")){
  image(signImage,0,0);
  
  mouseFunctions();
  textFont(mainFont);
  textSize(42);
  fill(255,0,0);
  text ("YOU RAN OUT OF LIVES", 340, 135);
  textSize(20);
  text ("You Survived " + roundNum + " Rounds", 478, 170);
  textSize(30);
  fill(255);
  text ("BACK TO MENU", 495, 330);
}
if (gameState.equals("helpMode")){
  image(helpImage, 0,0);
  mouseFunctions();
}

if (gameState.equals("pause")){
  image(signImage,0,0);
  
  mouseFunctions();
  textSize(45);
  fill(255);
  text ("CONTINUE", 480, 175);
  fill(255,0,0);
  text ("QUIT", 560, 330);
}

if (gameState.equals("betweenRounds")){
  mouseFunctions();
  time = millis();
  textSize(55);
  fill(0);
  text ("ROUND " + roundNum, 470 , 60);
  textSize(28);
  text ("CLICK ANYWHERE TO CONTINUE", 340, 300); 
}

if (gameState.equals("Storycomplete")){
  image(signImage,0,0);
  
  mouseFunctions();
  textFont(mainFont);
  textSize(45);
  fill(255);
  text ("CONGRATULATIONS", 355, 135);
  textSize(20);
  text ("YOU HAVE HELPED JACK SURVIVE", 367, 170);
  text (player.getLives() + " LIVES LEFT", 550, 200);
  textSize(30);
  text ("BACK TO MENU", 495, 330);
}

if (gameState.equals("Storyfail")){
  image(signImage,0,0);
  
  mouseFunctions();
  textFont(mainFont);
  textSize(42);
  fill(255,0,0);
  text ("YOU RAN OUT OF LIVES", 340, 135);
  textSize(20);
  textSize(30);
  fill(255);
  text ("BACK TO MENU", 495, 330);
}

if (gameState.equals("level10Complete")){
  image(signImage,0,0);
  
  mouseFunctions();
  textFont(mainFont);
  textSize(45);
  fill(255);
  text ("CONGRATULATIONS", 355, 135);
  textSize(20);
  text ("YOU HELPED STOP THE ZOMBIE INVASION", 367, 170);
  text (player.getLives() + " LIVES LEFT", 550, 200);
  textSize(30);
  text ("BACK TO MENU", 495, 330);
}
}



//functions for mouse moving around
void mouseFunctions (){
  
  if (gameState.equals("StoryMode")){
    if (mouseX>=50 && mouseX<=230 && mouseY>=125 &&mouseY<=280 || mouseX >= 295 && mouseX <= 485 && mouseY>=125 && mouseY<=280 || mouseX >= 540 && mouseX <= 735 && mouseY>=125 && mouseY<=280 || mouseX >= 785 && mouseX <= 980 && mouseY>=125 && mouseY<=280 || mouseX >= 1030 && mouseX <= 1225 && mouseY>=125 && mouseY<=280 || mouseX>=50 && mouseX<=230 && mouseY>=345 &&mouseY<=495 || mouseX >= 295 && mouseX <= 485 && mouseY>=345 && mouseY<=495|| mouseX >= 540 && mouseX <= 735 && mouseY>=345 && mouseY<=495 || mouseX >= 785 && mouseX <= 980 && mouseY>=345 && mouseY<=495 || mouseX >= 1030 && mouseX <= 1225 && mouseY>=345 && mouseY<=495 || mouseX>=1110 && mouseX<=1290 && mouseY>=600 &&mouseY<=650){
      cursor(HAND);
  }else if (!mousePressed){
      cursor(ARROW);
}
  }
  
  if (gameState.equals("pause")){
    if (mouseX>=480 && mouseX<=770 && mouseY>=135 &&mouseY<=175 || mouseX>=560 && mouseX<=700 && mouseY>=290 &&mouseY<=340){
    cursor(HAND);
  mouseOver=true;
}else if (!mousePressed){
  //changes hand again
  cursor(ARROW);
  mouseOver=false;
  dragged=false;
}
    
  }
  if (gameState.equals("waveMode") || gameState.equals("StoryGame")){
if (mouseX>=10 && mouseX<=100 && mouseY>=105 &&mouseY<=195 || mouseX>= 10 && mouseX <= 100 && mouseY>= 200 && mouseY<=290 || mouseX>= 10 && mouseX <= 100 && mouseY>= 295 && mouseY<=390 || mouseX>= 10 && mouseX <= 100 && mouseY>= 395 && mouseY<=490 || mouseX>= 10 && mouseX <= 100 && mouseY>= 495 && mouseY<=590 || mouseX>= 1220 && mouseX <= 1260 && mouseY>= 610 && mouseY<=650 ){
  //changes hand and mouseover
  cursor(HAND);
  mouseOver=true;
}else if (!mousePressed){
  //changes hand again
  cursor(ARROW);
  mouseOver=false;
  dragged=false;
}
//Creating the moving square
if (dragged==true && mouseOver==true){
 for(byte i=0;i<squares.length;i++){for(byte j=0;j<squares[i].length;j++){
   if (squares[i][j]==0){
     fill (0,255,0);
     rect(190+i*bs,105+j*bs,bs,bs);
   }
 }
 
 }
 
  //snapping on the selectable squares
 if (mouseX>190 && mouseX<190+900 && mouseY>105 && mouseY<105+450){
   //If it doesn't have a plant in it
   if (squares[(mouseX-190)/90][(mouseY-105)/90]==0){
   fill (splant);
     if (plantType == 1){
       image(playerImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 2){
       image(doubleImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 3){
       image(snowImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 4){
       image(nutImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 5){
       image(sunFlowerImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }
   }
 }else{
 //moving square fluid
 
 fill (dplant);
 if (plantType == 1){
  image(playerImage,mouseX-30,mouseY-30,bs/1.5,bs/1.5);
 }else if (plantType == 2){
   image(doubleImage,mouseX-30,mouseY-30,bs/1.5,bs/1.5);
 }else if (plantType == 3){
       image(snowImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 4){
       image(nutImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }else if (plantType == 5){
       image(sunFlowerImage,((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,bs,bs);
     }
 }
}
  
}if (gameState.equals("menu")){
  if (mouseX >=100 && mouseX<=400 && mouseY>= 220 && mouseY<= 295 || mouseX >=100 && mouseX<=400 && mouseY>= 320 && mouseY<= 395 || mouseX >=100 && mouseX<=400 && mouseY>= 420 && mouseY<= 495 || mouseX >=100 && mouseX<=400 && mouseY>= 520 && mouseY<= 595){
    cursor(HAND);
  }else if (!mousePressed){
    cursor(ARROW);
  }
}
if (gameState.equals("complete") || gameState.equals("fail") || gameState.equals("Storyfail") || gameState.equals("Storycomplete")){
  if (mouseX>=495 && mouseX<=770 && mouseY>=300 &&mouseY<=330){
    cursor(HAND);
  }else if (!mousePressed){
    cursor(ARROW);
  }
}

if (gameState.equals("helpMode")){
  if (mouseX>=1070 && mouseX<=1240 && mouseY>=580 &&mouseY<=630){
    cursor(HAND);
  }else if (!mousePressed){
    cursor(ARROW);
  }
}
  
}
//functions for when mouse is pressed
int plantType;
void mousePressed (){
  
  if (gameState.equals("StoryMode")){
    if(mouseX>=1110 && mouseX<=1290 && mouseY>=600 &&mouseY<=650){
      gameState = "menu";
    }
    if(mouseX>=50 && mouseX<=230 && mouseY>=125 &&mouseY<=280){
      spawn = millis();
      gameState = "StoryGame";
      level = 1;
      player.setCoins(100);
      storyZombies = 7; 
    }
    if(mouseX >= 295 && mouseX <= 485 && mouseY>=125 && mouseY<=280){
      spawn = millis();
      gameState = "StoryGame";
      level = 2;
      player.setCoins(200);
      storyZombies = 12;
    }
    if(mouseX >= 540 && mouseX <= 735 && mouseY>=125 && mouseY<=280){
      spawn = millis();
      gameState = "StoryGame";
      level = 3;
      player.setCoins(300);
      storyZombies = 15;
    }
    if(mouseX >= 785 && mouseX <= 980 && mouseY>=125 && mouseY<=280){
      spawn = millis();
      gameState = "StoryGame";
      level = 4;
      player.setCoins(400);
      storyZombies = 21;
    }
    if(mouseX >= 1030 && mouseX <= 1225 && mouseY>=125 && mouseY<=280){
      spawn = millis();
      gameState = "StoryGame";
      level = 5;
      player.setCoins(500);
          storyZombies = 27;
    }
    if(mouseX>=50 && mouseX<=230 && mouseY>=345 &&mouseY<=495){
      spawn = millis();
      gameState = "StoryGame";
      level = 6;
      player.setCoins(600);
          storyZombies = 34;
    }
    if(mouseX >= 295 && mouseX <= 485 && mouseY>=345 && mouseY<=495){
      spawn = millis();
      gameState = "StoryGame";
      level = 7;
      player.setCoins(700);
          storyZombies = 40;
    }
    if(mouseX >= 540 && mouseX <= 735 && mouseY>=345 && mouseY<=495){
      spawn = millis();
      gameState = "StoryGame";
      level = 8;
      player.setCoins(800);
       
    storyZombies = 47;
    }
    if(mouseX >= 785 && mouseX <= 980 && mouseY>=345 && mouseY<=495 ){
      spawn = millis();
      gameState = "StoryGame";
      level = 9;
      player.setCoins(900);
          storyZombies = 55;
    }
    if(mouseX >= 1030 && mouseX <= 1225 && mouseY>=345 && mouseY<=495){
      spawn = millis();
      gameState = "StoryGame";
      level = 10;
      player.setCoins(1000);
      storyZombies = 60;
    }

  }
  
  if (gameState.equals("StoryGame")){
    if (mouseX>= 1220 && mouseX <= 1260 && mouseY>= 610 && mouseY<=650){
  gameState = ("pause");
}
    if (player.getCoins() >= 100){
if (mouseX>=10 && mouseX<=100 && mouseY>=105 &&mouseY<=195){
  dragged=true;
  plantType = 1;
}
    }
    if (lvl3 == 0){
if (player.getCoins() >= 200){
 if (mouseX>= 10 && mouseX <= 100 && mouseY>= 200 && mouseY<=290){
  dragged = true;
  plantType= 2;
}
} 
    }
    if (lvl5 == 0){
if (player.getCoins() >= 175){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 295 && mouseY<=390){
  dragged = true;
  plantType= 3;
}
}
    }
    if (lvl7 == 0){
if (player.getCoins() >= 150){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 395 && mouseY<=490){
  dragged = true;
  plantType= 4;
}
}
}
if (player.getCoins() >= 50){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 495 && mouseY<=590){
  dragged = true;
  plantType= 5;
}
}
    
  }
  if (gameState.equals("waveMode")){
    
if (mouseX>= 1220 && mouseX <= 1260 && mouseY>= 610 && mouseY<=650){
  gameState = ("pause");
}
    if (player.getCoins() >= 100){
if (mouseX>=10 && mouseX<=100 && mouseY>=105 &&mouseY<=195){
  dragged=true;
  plantType = 1;
}
    }
if (player.getCoins() >= 200){
 if (mouseX>= 10 && mouseX <= 100 && mouseY>= 200 && mouseY<=290){
  dragged = true;
  plantType= 2;
}
} 
if (player.getCoins() >= 175){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 295 && mouseY<=390){
  dragged = true;
  plantType= 3;
}
}
if (player.getCoins() >= 150){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 395 && mouseY<=490){
  dragged = true;
  plantType= 4;
}
}
if (player.getCoins() >= 50){
if (mouseX>= 10 && mouseX <= 100 && mouseY>= 495 && mouseY<=590){
  dragged = true;
  plantType= 5;
}
}
  }
if (gameState.equals("menu")){
  if (mouseX >=100 && mouseX<=400 && mouseY>= 220 && mouseY<= 295){
    gameState = ("StoryMode");
  }else if (mouseX >=100 && mouseX<=400 && mouseY>= 320 && mouseY<= 395){
    spawn = millis();
    gameState = ("waveMode");
  }else if (mouseX >=100 && mouseX<=400 && mouseY>= 420 && mouseY<= 495){
    gameState = ("helpMode");
  }else if (mouseX >=100 && mouseX<=400 && mouseY>= 520 && mouseY<= 595){
    exit();
  }
}
if (gameState.equals("complete") || gameState.equals("fail") || gameState.equals("Storyfail") || gameState.equals("Storycomplete")){
  if (mouseX>=495 && mouseX<=770 && mouseY>=300 &&mouseY<=330){
    gameState = ("menu");
}
}
if (gameState.equals("helpMode")){
  if (mouseX>=1070 && mouseX<=1240 && mouseY>=580 &&mouseY<=630){
    gameState = ("menu");
  }
}

if (gameState.equals("pause")){
  if (mouseX>=480 && mouseX<=770 && mouseY>=135 &&mouseY<=175){
    gameState = ("waveMode");
  }else if (mouseX>=560 && mouseX<=700 && mouseY>=290 &&mouseY<=340){
    gameState = ("menu");
    removeAll();
    roundNum = 0;
    numOfZombies = 10;
    spawnDelay = 4000;
    player.setLives(5);
    player.setCoins(100);
    time = millis();
  }
}

if (gameState.equals("betweenRounds")){
  if (mouseX>=0 && mouseX<=1280 && mouseY>=0 &&mouseY<=660){
    gameState = ("waveMode");
  }
}
  
}
void mouseReleased(){
 //If its over the selectable and being dragged and released
if (mouseX>190 && mouseX<190+900 && mouseY>105 && mouseY<105+450&&dragged==true)
{
//Creates a plant object when mouse is released
if (squares[(mouseX-190)/90][(mouseY-105)/90]==0){
  squares[(mouseX-190)/90][(mouseY-105)/90]=1; 
  if (plantType ==1){
    Peashooter plant = new Peashooter(((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,(int)bs);
    plants.add(plant);
    player.setCoins(player.getCoins()-100);
  }else if (plantType == 2){
    doubleShooter plant = new doubleShooter(((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,(int)bs);
    plants.add(plant);
    player.setCoins(player.getCoins()-200);
  }else if (plantType == 3){
    SnowShooter plant = new SnowShooter(((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,(int)bs);
    plants.add(plant);
    player.setCoins(player.getCoins()-175);
  }else if (plantType == 4){
    NutPlant plant = new NutPlant(((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,(int)bs);
    shieldPlants.add(plant);
    player.setCoins(player.getCoins()-150);
  }else if (plantType == 5){
    SunFlower plant = new SunFlower(((mouseX-10)/bs)*bs+10,((mouseY-15)/bs)*bs+15,(int)bs);
    sunPlants.add(plant);
    player.setCoins(player.getCoins()-50);
  }
}
}
}
//Nick's Methods
public void shoot(Bullet b){ 
    bullets.add(b);
    redraw();
}

public void displayRound(){
  textSize(20);
  fill (0);
  text (roundNum, 100,25);
  text(numOfZombies, 165, 55);
  redraw();
}

public void displayStory(){
  textSize(20);
  fill (0);
  text (level, 100,25);
  text(storyZombies, 165, 55);
  redraw();
}

public void spawn(Enemy e){
  enemies.add(e);
  e.colour = color(0,255,0);
  e.display(); 
  redraw();
}

public void storyRemoval(Bullet b, Enemy e){
  bullets.remove(b);
  enemies.remove(e);
  storyZombies = storyZombies - 1;
  
  redraw();
}


public void removal(Bullet b, Enemy e){
  bullets.remove(b);
  enemies.remove(e);
  numOfZombies = numOfZombies - 1;
  
  if (numOfZombies == 0){
    numOfZombies = 10 + roundNum;
    roundNum = roundNum + 1;
    gameState = ("betweenRounds");
  }
  redraw();
}

public void removeEnemy(Enemy e){
  enemies.remove(e);
  player.setLives(player.getLives() - 1);
  numOfZombies = numOfZombies - 1;
  if (numOfZombies == 0){
    numOfZombies = 10 + roundNum;
    roundNum = roundNum + 1;
  }
  redraw();
}

public void removePlant (Plants p){
  plants.remove(p);
  redraw();
}

public void removeSunPlant (Plants p){
  sunPlants.remove(p);
  redraw();
}

public void removeShieldPlant (Plants p){
  shieldPlants.remove(p);
  redraw();
}

public void removeBullet(Bullet b){
  bullets.remove(b);
  redraw();
}

public void removeEnemyFunc(Enemy e){
  enemies.remove(e);
  redraw();
}

public void removeCoin(Money c){
  money.remove(c);
  redraw();
}

public void removeAll(){
  
  for (int k = 0; k < 5; k++){
    for (int i = 0; i < plants.size(); i++){
      Plants currPlant = plants.get(i);
      removePlant(currPlant);
    }
  
    for (int i = 0; i < shieldPlants.size(); i++){
      Plants currPlant = shieldPlants.get(i);
      removeShieldPlant(currPlant);
    }
  
    for (int i = 0; i < sunPlants.size(); i++){
      Plants currPlant = sunPlants.get(i);
      removeSunPlant(currPlant);
    }
  
    for (int i = 0; i < bullets.size(); i++){
      Bullet currBullet = bullets.get(i);
      removeBullet(currBullet);
    }
  
    for (int i = 0; i < enemies.size(); i++){
      Enemy currEnemy = enemies.get(i);
      removeEnemyFunc(currEnemy);
    }
  
    for (int i = 0; i < money.size(); i++){
      Money currCoin = money.get(i);
      removeCoin(currCoin);
    }
  }  
}

void generateCoin(){
  int x=0,y=0;
  x=(int)random(1260);
  y=(int)random(660);
  Money coin=new Money(x,y);
  money.add(coin);  
}

void sunCoin(){
  for (Plants plant: sunPlants){
    int x,y;
    x= plant.x + 80;
    y= plant.y + 10;
    Money coin=new Money(x,y);
    money.add(coin);  
  }
}
