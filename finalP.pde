PImage gameMap;
PImage AvatarImg;
int playerX;
int playerY;
int tileSize = 20;
ArrayList<PVector> items;
ArrayList<PVector> inventory;
ArrayList<String> uritemName;
String[] itemName;
ArrayList<RedTile> redTiles;
ArrayList<PVector> removedItem;


void setup() {
  size(600, 400);
  AvatarImg = loadImage("advatar.png");
  gameMap = loadImage("game_map.png");  
  playerX = width/2;  
  playerY = height/2;  
  


  items = new ArrayList<PVector>();
  inventory = new ArrayList<PVector>();
  placeItems(); 
  itemName = new String[5];
  itemName[0] = "apple";
  itemName[1] = "trash";
  itemName[2] = "candy";
  itemName[3] = "key";
  itemName[4] = "book";  
  
  redTiles = new ArrayList<RedTile>();
  generateRedTiles();
  
}
 
void draw() {
  background(255);
  image(gameMap, 0, 0); 


  fill(0, 0, 255);
  rect(playerX, playerY, tileSize, tileSize);
  
  if (key == 'i') {
    displayInventory();
  }
  
  for (RedTile tile : redTiles) {
    tile.update();
    tile.display();
    
    if (tile.isPlayerContact(playerX, playerY)) {
      playerX = width/2;
      playerY = height/2;
      if (inventory.size() > 0) {
        PVector temp = inventory.get(inventory.size() - 1);
        inventory.remove(inventory.size() - 1);
        items.add(temp) ; 
      }
      
    }
  }
  image(AvatarImg, playerX, playerY, tileSize, tileSize);
    if (gameMap.get(playerX, playerY) ==  color(0, 0, 255) && inventory.size() > 3) {
      displayWinScreen();
    }
}

void displayWinScreen() {
  background(0);
  textSize(32);
  fill(255);
  textAlign(CENTER, CENTER);
  text("You Win!", width/2, height/2);
}


void keyPressed() {
  int targetX = playerX;
  int targetY = playerY;

  if (keyCode == UP) {
    targetY -= tileSize;
  } 
  else if (keyCode == DOWN) {
    targetY += tileSize;
  } 
  else if (keyCode == LEFT) {
    targetX -= tileSize;
  } 
  else if (keyCode == RIGHT) {
    targetX += tileSize;
  } 

  else if (keyCode == ' ') {

    for (PVector item : items) {
      if (playerX == item.x && playerY == item.y) {

        inventory.add(item);       
        items.remove(item);

        break;
      }
    }
  }
  

  if (targetX >= 0 && targetX < width && targetY >= 0 && targetY < height) {
    color targetColor = gameMap.get(targetX + tileSize/2, targetY + tileSize/2);
    if (targetColor != color(0)) {
      playerX = targetX;
      playerY = targetY;
    }
  }
}

void placeItems() {
  int mapWidth = gameMap.width;
  int mapHeight = gameMap.height;
  
  for (int x = 0; x < mapWidth; x++) {
    for (int y = 0; y < mapHeight; y++) {
      color tileColor = gameMap.get(x, y);
      if (tileColor == color(0, 255, 0)) {
        items.add(new PVector(x, y));
      }
    }
  }
}

void displayInventory() {
  textSize(20);
  fill(400, 200, 200);
  text("Inventory:", 20, 30);
  
  for (int i = 0; i < inventory.size(); i++) {
    text("Item " + (i + 1) + ": " + itemName[i], 20, 60 + i * 30);
  }

  if (inventory.size() > 0 ) {
 
    text("Current Item: "  + itemName[inventory.size() - 1] , 20, 60 + inventory.size() * 30);
  }
}

void generateRedTiles() {
  int numTiles = 5; 
  for (int i = 0; i < numTiles; i++) {
    int startX = (int) random(0, width);
    int startY = (int) random(0, height);
    if (gameMap.get(startX, startY) != color(0)) {
      RedTile tile = new RedTile(startX, startY);
      redTiles.add(tile);
    }
    else {
      numTiles += 1; 
    }
  }
}


  
