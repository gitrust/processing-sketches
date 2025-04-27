
float box_w = 20;
float box_d = 20;
int boxes_x = 10;
int boxes_z = 20;
float min_height = 2;
float max_height = 60;
float[] heights;

void setup() {
  size(640,400,P3D);
  
  heights = new float[boxes_x*boxes_z];
  for (int i =0;i<heights.length;i++) {
    heights[i] = random(min_height,max_height);
  }
  camera(30.0, 35.0, 20.0, 50.0, 50.0, 0.0, 
       0.0, 1.0, 0.0);
}

void draw() {
  background(0);
  lights();
  
  createBoxArea();
  camUpd();
  saveFrame("images/image-####.png");
}

void camUpd(){
  camera(mouseX, mouseY+30, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
}

void createBoxArea() {
   for (int x = 0; x < boxes_x; x++) {
    float xpos = 100 + x * box_w + box_w * x;
    for (int z = 0; z < boxes_z; z++) {
      float zpos = 0 + z * box_w + box_w * z;
      createBox(xpos,height/2+100,heights[x+z],zpos*-1);
    }
  } 
}

void createBox(float x, float y,float h,float zpos) {
  fill(200);
  pushMatrix();  
  translate(x, y-h/2, zpos);
  //rotateY(1.25);
  //rotateX(-0.4);
  noStroke();
  box(box_w,h,box_d);
  popMatrix();
}