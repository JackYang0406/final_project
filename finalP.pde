PImage gameMap;
int playerX;
int playerY;
int tileSize = 20;
boolean hasItem;
ArrayList<PVector> items;
ArrayList<PVector> inventory;
ArrayList<String> uritemName;
String[] itemName;

void setup() {
  size(600, 400);
  gameMap = loadImage("game_map.png");  // Load the game map image
  playerX = width/2;  // Start the player in the middle of the screen horizontally
  playerY = height/2;  // Start the player in the middle of the screen vertically
  hasItem = false;
  items = new ArrayList<PVector>();
  inventory = new ArrayList<PVector>();
  placeItems();  // Place the items randomly on the map
  itemName = new String[5];
  itemName[0] = "item1";
  itemName[1] = "item2";
  itemName[2] = "item3";
  itemName[3] = "item4";
  itemName[4] = "item5";  
}

void draw() {
  background(255);
  image(gameMap, 0, 0);  // Display the game map

  
  // Draw the player as a red rectangle
  fill(255, 0, 0);
  rect(playerX, playerY, tileSize, tileSize);
  
  if (key == 'i') {
    displayInventory();
  }
}

void keyPressed() {
  int targetX = playerX;
  int targetY = playerY;

  // Calculate the target position based on the player's movement
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
    //if (hasItem) {
    //  // Player already has an item, cannot pick up another
    //  return;
    //}
    
    // Check if the player is on an item tile
    for (PVector item : items) {
      if (playerX == item.x && playerY == item.y) {
        // Player found an item, add it to the inventory
        inventory.add(item);
        items.remove(item);
        hasItem = true;
        break;
      }
    }
  }
  
  // Check if the target position is within the game boundaries
  if (targetX >= 0 && targetX < width && targetY >= 0 && targetY < height) {
    // Check if the target position is within the walkable areas
    color targetColor = gameMap.get(targetX + tileSize/2, targetY + tileSize/2);
    if (targetColor != color(0)) {
      // Move the player to the target position
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
  
  // Display the items in the inventory
  int inventorySize = inventory.size();
  for (int i = 0; i < inventorySize; i++) {
    PVector item = inventory.get(i);

    text("Item " + (i + 1) + ": " + itemName[i], 20, 60 + i * 30);
  }
  
  if (hasItem) {
 
    text("Current Item: "  + itemName[inventorySize - 1] , 20, 60 + inventorySize * 30);
  }
}
