import gifAnimation.*;
Gif[] loopingGif = new Gif[10];

import processing.sound.*;
SoundFile[] someMusicFile = new SoundFile[6];

boolean play[] = new boolean[6];
PFont myFont;
int mode=0;


void setup() {
  fullScreen();
  myFont=createFont("Drop the best", 100);
  textFont(myFont);

  //load gif file
  for (int i = 0; i < loopingGif.length; i++) {
    String file_name = i + ".gif";
    loopingGif[i] = new Gif(this, file_name);
    loopingGif[i].loop();
  }

  //load music file
  for (int j  = 0; j < someMusicFile.length; j++) {
    String music_file = j + ".mp3";
    someMusicFile[j] = new SoundFile(this, music_file);
    play[j] = false;
  }
}

void draw() {
  background(0);
  tint(0, (int)map(mouseX, 0, width, 55, 255), (int)map(mouseY, 0, height, 55, 255));
  switch(mode) {
  case 0:
    loadMode();
    break;

  case 1:
    zzzMode();
    break;

  case 2:
    xxxMode();
    break;

  case 3:
    cccMode();
    break;

  case 4:
    nnnMode();
    break;
  }
}

void loadMode() {
  image(loopingGif[0], 0, 0, 750, 800);
  fill(random(255), 0, 255);
  textAlign(CENTER);
  textSize(100);
  noStroke();
  text("Drop the beat", width/2+170, height/2+200);
}

void zzzMode() {
  image(loopingGif[1], 0, 0, 1300, 800);
  if (play[0]) {
    someMusicFile[0].play();
    play[0] = false;
  }
}
void xxxMode() {  
  image(loopingGif[2], 0, 0, 1300, 800);
  if (play[1]) {
    someMusicFile[1].play();
    play[1] = false;
  }
}
void cccMode() {  
  image(loopingGif[3], 0, 0, 1300, 800);
  if (play[2]) {
    someMusicFile[2].play();
    play[2] = false;
  }
}



void nnnMode() {
  image(loopingGif[9], 0, 0);
  fill(random(255), 0, 255);
  textAlign(CENTER);
  textSize(100);
  noStroke();
  text("Ears:", width/2, height/2-300);
  text("I need", width/2, height/2);
  text("some rest!", width/2, height/2+150);
}


void mousePressed() {
  if (mode==0) {
    mode=1;
    play[0] = true;
  } else {

    if (mode==1) {
      mode=2;
      play[1] = true;
      someMusicFile[0].stop();
    } else { 
      if (mode==2) {
        mode=3;
        play[2] = true;
        someMusicFile[1].stop();
      } else {
        if (mode==3) {
          mode=4;
        } else {
        }
      }
    }
  }
}