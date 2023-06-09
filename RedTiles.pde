class RedTile {
  int x;
  int y;
  int speedX;
  int speedY;
  PImage cover; 
  
  RedTile(int startX, int startY) {
    x = startX;
    y = startY;

    speedX = (int) random(1, 5);  
    speedY = (int) random(1, 5);  
  }

  void update() {
    int newX = x + speedX;
    int newY = y + speedY;
    
    if (newX >= 0 && newX < width && newY >= 0 && newY < height) {

      color tileColor = gameMap.get(newX + tileSize/2, newY + tileSize/2);
      if (tileColor != color(0)) {

        x = newX;
        y = newY;
      } else {

        speedX *= -1;
        speedY *= -1;
      }
    } else {

      speedX *= -1;
      speedY *= -1;
    }
  }
  
  void display() {

    fill(255, 0, 0);
    rect(x, y, tileSize, tileSize);
  }
  
  boolean isPlayerContact(int playerX, int playerY) {
    return dist(playerX, playerY, x, y) < tileSize;
  }
}
