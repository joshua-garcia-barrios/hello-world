int size = 100000;
int[] nArray = new int[size]; 
int t = millis();
//----------------------------------------------------------------------
void setup() {
  background(0);
  textSize(45);
  size(1000, 1000);
  //  initArray();
  //  printArray(100);
  // //************ DO BUBBLE SORT**************
  //  printArray(200);
  //  t = millis();
  //  bubbleSort();
  //  t=(millis()-t)/1000;
  //  text("Bubble Sorted in: " + t + " Seconds",400,250); 
  //  //************ DO SELECTION SORT**************
  //  initArray();
  //  printArray(300);
  //   t = millis();
  //  selectionSort();
  //  t=(millis()-t)/1000;
  //  println(t);
  //  text(" Selection Sorted in: " + t + " Seconds",400,450); 
  //  printArray(400);
  //************ DO INSERTION SORT**************
  initArray();
  printArray(300);
  t = millis();
  quickSort(0, size-1);
  t=(millis()-t)/1000;
  println(t);
  text(" Insertion Sorted in: " + t + " Seconds", 200, 450); 
  printArray(400);
}
/*void draw() {
 for (int i = 0;i<6;i++) { 
 for (int j = 0; j<5;j++) {
 int s=255;
 if (mouseX>i*100+100&&mouseX<i*100+200&&mouseY>j*50+50&&mouseY<j*50+100) {
 s=155;
 }
 fill(s);
 rect(i*100+100, j*50+50, 100, 50);
 }
 }
 textSize(15);
 fill(0);
 text("Bubble Sort", 110, 125);
 text("Selection Sort", 102, 175);
 text("Insertion Sort", 102, 225);
 text("Quick Sort", 110, 275);
 }
 */
//----------------------------------------------------------------------
void quickSort(int low, int high) {
  int pivot = nArray[low+(high-low)/2];
  int i = low; 
  int j = high;
  while (i<=j) {

    while (nArray[i] < pivot) i++;
    while (nArray[j] >pivot) j--;

    if (i <=j) {
      swap(i, j);
      i++;
      j--;
    }
  }
  if (low<j)
    quickSort(low, j);
  if (i < high)
    quickSort(i, high);
}
//----------------------------------------------------------------------
void insertionSort() {
  for (int i=0; i<size; i++) {
    int val = nArray[i];
    int j = i-1;
    while (j>=0 && nArray[j]>val) {
      nArray[j+1] = nArray[j];
      j--;
    }
    nArray[j+1]= val;
  }
}
//----------------------------------------------------------------------
void selectionSort() {
  int minPos;
  for (int i=0; i<size-1; i++)
  {
    minPos=i;
    for (int j=i+1;j<size;j++) {
      if (nArray[j]<nArray[minPos]) {
        minPos = j;
      } 
      swap(i, minPos);
    }
  }
}
//----------------------------------------------------------------------
void bubbleSort() {
  for (int j=0;j<size; j++) {
    for (int i=0;i<size-j-1; i++) {
      if (nArray[i]>nArray[i+1]) {
        swap(i, i+1);
      }
    }
  }
}
//----------------------------------------------------------------------
void swap(int a, int b) {

  int t = 0;
  t = nArray[a];
  nArray[a] = nArray[b];
  nArray[b]=t;
}

//----------------------------------------------------------------------
void initArray() {
  for (int i=0;i<size; i++) {
    nArray[i] = (int)random(1, 10);
  }
}
//----------------------------------------------------------------------
void printArray(float y) {
  for (int i=0;i<size; i++) {
    text(nArray[i], i*50+100, y);
  }
}

