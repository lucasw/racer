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
  PImage img = loadImage("road.png");
  road.beginShape();
  road.texture(img);
  road.vertex( SZ, 0,  SZ, 0, 0);
  road.vertex(-SZ, 0,  SZ, 100, 0);
  road.vertex(-SZ, 0, -SZ, 100, 100);
  road.vertex( SZ, 0, -SZ, 0, 100);
  road.endShape();
}

void keyPressed() {
  
  if (key == 'j') {
    player.pos.y -= 100;
  }
  if (key == 'k') {
    player.pos.y += 110;
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

  println("pos " + str(player.pos.x) + " " + str(player.pos.y) + " " + str(player.pos.z) );
}

void draw() {
  background(41, 43, 180);
  pushMatrix();
  translate(-player.pos.x, -player.pos.y, player.pos.z);
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
