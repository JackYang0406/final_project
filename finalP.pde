PVector Avatar;
PImage img;
PImage backgroundimg;
int dir;

void setup() {
  size(480, 350);
  noStroke();
  fill(0);
  Avatar = new PVector(220, 250);
  img = loadImage("avatarpixel.png");
  backgroundimg = loadImage("backgroundpixel.png");

        noStroke();
      fill(0);
    }

    void draw() {
      background(backgroundimg);
      image(img, Avatar.x, Avatar.y, 25, 25);
      
      checkPos();
      updateAvatar();
    }

    void updateAvatar() {
      image(img, Avatar.x, Avatar.y, 25, 25);
    }
    
    void checkPos(){
      int width = backgroundimg.width;
      int height = backgroundimg.height; 
     backgroundimg.loadPixels();
     for( int y  = 0; y < height ; y++) {
       for (int x = 0 ; x < width; x++) {
         float r  = red(backgroundimg.pixels[y * width + x]) ; 
         float g  = green(backgroundimg.pixels[y * width + x]) ; 
         float b  = blue(backgroundimg.pixels[y * width + x] );          
      if ((r == 201 && g == 94 && b == 40) || (r == 0 && g == 0 & b == 0)) {
        PVector barrierPos = new PVector(x, y);
        if (barrierPos == Avatar) {
          if (dir == 1) {
            Avatar.y += 10;
          }
          if (dir == 2) {
            Avatar.y -= 10;
          }
          if (dir == 3) {
            Avatar.x += 10;
          }
          if (dir == 4) {
            Avatar.x -= 10;
          }
        }
        }          
      }     
     }
    }
      
    void keyPressed() {
      if (key == 'w'){
        Avatar.y -= 10;
        dir = 1;
      }
      else if (key == 's') {
        Avatar.y += 10;
        dir = 2;
      }
      else if (key == 'a') {
        Avatar.x -= 10;
        dir = 3;
      }
      else if (key == 'd') {
        Avatar.x += 10;
        dir = 4;
      }
    }
