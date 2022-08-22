
void main()
{
  String a = "hello";
  int b = 0;
  int c = 20;

  try{
    int d = int.parse(a);
    print(d);
  }
  catch(e)
  {
    print("Enter valid Value $e");
  }
}