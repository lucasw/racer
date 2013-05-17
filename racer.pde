/*
   Copyright 2013 Lucas Walter

 --------------------------------------------------------------------
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

class Car
{
  
  PVector pos;

  Car() {
    pos = new PVector(0,0,0);
  }
}

Car player;

PShape road;
final int SZ = 100;

void setup() {
  size(800, 600, P3D);

  player = new Car();

  road = createShape();
  PImage img = loadImage("road_px.png");
  road.beginShape();
  road.noStroke();
  road.texture(img);
  road.vertex( SZ, 0,  SZ, 0, 0);
  road.vertex(-SZ, 0,  SZ, 100, 0);
  road.vertex(-SZ, 0, -SZ, 100, 100);
  road.vertex( SZ, 0, -SZ, 0, 100);
  road.endShape();
}

void keyPressed() {
  
  if (key == 'j') {
    player.pos.y -= 20;
  }
  if (key == 'k') {
    player.pos.y += 21;
  }
  if (key == 'h') {
    player.pos.x -= 10;
  }
  if (key == 'l') {
    player.pos.x += 11;
  }
  if (key == 'i') {
    player.pos.z -= 10;
  }
  if (key == 'o') {
    player.pos.z += 11;
  }

  if (key == 's') {
    rotx += 0.01;
  }
  if (key == 'd') {
    rotx -= 0.011;
  }

  println("pos " + str(player.pos.x) + " " + str(player.pos.y) + " " + str(player.pos.z) );
}

float rotx = -PI/8;

void draw() {
  background(41, 43, 180);
  translate(width/2, height/2, 0);
  rotateX(rotx);
  translate(0, -height/2, 0);
  pushMatrix();
  translate(-player.pos.x, -player.pos.y + height/2, player.pos.z);
  for (int i = -10; i < 10; i++) {
  for (int j = -10; j < 10; j++) {
    pushMatrix();
    translate(i*SZ*2, 0, j*SZ*2);
    //road.draw();
    shape(road, 0, 0); //i*(SZ*2), 0, j*(SZ*2), 0);
    popMatrix();
  }
  }
  popMatrix();
}
