PVector Avatar;
PImage img;
PImage backgroundimg;

void setup() {
  size(480, 352);
  noStroke();
  fill(0);
  Avatar = new PVector(0, 0);
  img = loadImage("advatar.png");
  backgroundimg = loadImage("background.png");

  //img.loadPixels();

  //for (int i = 0; i < img.width * img.height; i++) {
  //  float r = red(img.pixels[i]);
  //  float g = green(img.pixels[i]);
  //  float b = blue(img.pixels[i]);

  //  if ((r+g+b)/3 >= 255) {

  //    img.pixels[i] = color(0, 0, 0);
  //  }
  //}

  //img.updatePixels();


        noStroke();
      fill(0);
    }

    void draw() {
      background(backgroundimg);
      image(img, Avatar.x, Avatar.y, 40, 40);

      updateAvatar();
    }

    void updateAvatar() {
      image(img, Avatar.x, Avatar.y, 40, 40);
    }

    void keyPressed() {
      if (key == 'w') Avatar.y -= 20;
      else if (key == 's') Avatar.y += 20;
      else if (key == 'a') Avatar.x -= 20;
      else if (key == 'd') Avatar.x += 20;
    }
