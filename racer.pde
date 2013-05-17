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
  PVector vel;
  float wheel_dir;
  float wheel_vel;

  Car() {
    pos = new PVector(0,0,0);
    wheel_vel = 0;
    wheel_dir = 0;
  }

  void draw() {
    //pos = pos + vel;
    //vel *= 0.95;

    pos.z += wheel_vel * cos(wheel_dir);
    pos.x += wheel_vel * sin(wheel_dir);

    pushMatrix();
    final int ht = 50;
    translate(pos.x, pos.y - ht/2, pos.z);
    rotateY(wheel_dir);
    fill(200,200,33);
    box(100, 70, 250);
    popMatrix();
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
    player.wheel_vel -= 0.21;
  }
  if (key == 'k') {
    player.wheel_vel += 0.2;
  }
  if (key == 'h') {
    player.wheel_dir -= 0.010;
  }
  if (key == 'l') {
    player.wheel_dir += 0.011;
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
  //translate(0, -height/2, 0);
  int pz = (int)player.pos.z;
  pushMatrix();
  translate(-player.pos.x, -player.pos.y, -player.pos.z);
  for (int i = -6; i < 6; i++) {
  for (int j = - 15; j <  4; j++) {
    pushMatrix();
    translate(i*SZ*2, 0, j*SZ*2);
    //road.draw();
    shape(road, 0, 0); //i*(SZ*2), 0, j*(SZ*2), 0);
    popMatrix();
  }
  }

  player.draw();
  popMatrix();
}
