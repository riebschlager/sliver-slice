import java.util.*;

PImage src;
PImage slice = new PImage();
ArrayList<Slice> slices = new ArrayList<Slice>();
Random generator = new Random();

void setup() {
  src = loadImage("2936125672_073fdd9f6c_o.jpg");
  size(src.width, src.height);
  image(src, 0, 0);
}

void mousePressed() {
  sliceVerticalRandom();
  int r = (int) random(1000000000);
  //save("output/"+r+".tif");
}

void draw() {
  smooth();
}

void sliceHorizontalRandom() {
  int currentY = 0;
  while (currentY < height) {
    int randomSliceSize = (int) random(height/5);
    if (randomSliceSize + currentY > height) randomSliceSize = height - currentY;
    slice = get(0, currentY, width, randomSliceSize);
    slices.add(new Slice(slice));
    currentY += randomSliceSize;
  }
  currentY = 0;
  Collections.sort(slices);
  Collections.reverse(slices);
  int i = 0;
  while (currentY < height) {
    //Slice img = slices.get((int) random(slices.size()));
    Slice img = slices.get(i);
    image(img.img, 0, currentY, width, img.h);
    currentY += img.h;
    i++;
  }
  slices.clear();
}


void sliceVerticalRandom() {
  int currentX = 0;
  while (currentX < width) {
    int randomSliceSize = (int) random(width/5);
    if (randomSliceSize + currentX > width) randomSliceSize = width - currentX;
    slice = get(currentX, 0, randomSliceSize, height);
    slices.add(new Slice(slice));
    currentX += randomSliceSize;
  }
  currentX = 0;
  Collections.sort(slices);
  Collections.reverse(slices);
  int i = 0;
  while (currentX < width) {
    Slice img = slices.get((int) random(slices.size()));
    //Slice img = slices.get(i);
    image(img.img, currentX, 0, img.w, height);
    currentX += img.w;
    i++;
  }
  slices.clear();
}

void sliceCube(int _size) {
  for (int ix = 0; ix < round(width/_size); ix++) {
    for (int iy = 0; iy < (int) (height/_size); iy++) {
      slice = get(ix*_size, iy*_size, _size, _size);
      slices.add(new Slice(slice));
    }
  }
  Collections.sort(slices);
  int i=0;
  for (int ix = 0; ix < round(width/_size); ix++) {
    for (int iy = 0; iy < (int) (height/_size); iy++) {
      image(slices.get(i).img, ix*_size, iy*_size);
      i++;
    }
  }
  slices.clear();
}

void sliceVerticalReverse(int _slices) {
  int size = (int) (width/_slices);
  for (int i=0; i<_slices; i++) {
    slice = get(i*size, 0, size, height);
    slices.add(new Slice(slice));
  }
  for (int i=0; i<slices.size(); i++) {
    image(slices.get(slices.size()-i-1).img, i*size, 0);
  }
  slices.clear();
}


void sliceVertical(int _size) {
  int numberOfSlices = (int) (width/_size);
  for (int i=0; i<numberOfSlices; i++) {
    slice = get(i*_size, 0, _size, height);
    slices.add(new Slice(slice));
  }
  Collections.sort(slices);
  for (int i=0; i<slices.size(); i++) {
    image(slices.get(i).img, i*_size, 0);
  }
  slices.clear();
}

void sliceHorizontal(int _size) {
  int numberOfSlices = (int) (height/_size);
  for (int i=0; i<numberOfSlices; i++) {
    slice = get(0, i*_size, width, _size);
    slices.add(new Slice(slice));
  }
  Collections.sort(slices);
  for (int i=0; i<slices.size(); i++) {
    image(slices.get(i).img, 0, i*_size);
  }
  slices.clear();
}

