part of image;

const int FLIP_HORIZONTAL = 0;
const int FLIP_VERTICAL = 1;
const int FLIP_BOTH = 2;

/**
 * Flips the [src] image using the given [mode].
 */
Image flip(Image src, int mode) {
  if (mode < 0 || mode > 2) {
    return src;
  }

  switch (mode) {
    case FLIP_HORIZONTAL:
      flipHorizontal(src);
      break;
    case FLIP_VERTICAL:
      flipVertical(src);
      break;
    case FLIP_BOTH:
      flipVertical(src);
      flipHorizontal(src);
      break;
  }

  return src;
}

/**
 * Flip the [src] image vertically.
 */
Image flipVertical(Image src) {
  int w = src.width;
  int h = src.height;
  int h2 = h ~/ 2;
  for (int y = 0; y < h2; ++y) {
    int y1 = y * w;
    int y2 = (h - 1 - y) * w;
    for (int x = 0; x < w; ++x) {
      int t = src[y1 + x];
      src[y2 + x] = src[y1 + x];
      src[y1 + x] = t;
    }
  }
  return src;
}

/**
 * Flip the src image horizontally.
 */
Image flipHorizontal(Image src) {
  int w = src.width;
  int h = src.height;
  int w2 = src.width ~/ 2;
  for (int y = 0; y < h; ++y) {
    int y1 = y * w;
    for (int x = 0; x < w2; ++x) {
      int x2 = (w - 1 - x);
      int t = src[y1 + x];
      src[y1 + x2] = src[y1 + x];
      src[y1 + x2] = t;
    }
  }
  return src;
}
