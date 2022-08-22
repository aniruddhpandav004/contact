
void main()
{
  String a = "hello";

  try{
    int b = int.parse(a);
    print(b);
  }
  on FormatException
  {
    print("Enter valid Value");
  }
}