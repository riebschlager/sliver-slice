public class Slice implements Comparable<Slice> {

  float averageBrightness = 0;
  PImage img;
  int w, h;

  Slice(PImage _img) {
    w = _img.width;
    h = _img.height;
    img = createImage(w, h, RGB);
    img.set(0, 0, _img);
    averageBrightness = getAverageBrightness(img);
  }

  float getAverageBrightness(PImage _src) {
    float total = 0;
    for (int i=0; i<_src.pixels.length; i++) {
      total += hue(_src.pixels[i]);
    }
    return total/_src.pixels.length;
  }

  public int compareTo(Slice another) {
    Float thisAverageBrightness = averageBrightness;
    Float anotherAverageBrightness = another.averageBrightness;
    return thisAverageBrightness.compareTo(anotherAverageBrightness);
  }
  /*
  public int compareTo(Slice another) {
   Float thisAverageBrightness = new Float(averageBrightness);
   Float anotherAverageBrightness = new Float(another.averageBrightness);
   return thisAverageBrightness.compareTo(anotherAverageBrightness);
   }
   */
}

