namespace com.corneliusconcepts.mupuzzle;

interface

uses
  java.util,
  android.app,
  android.content,
  android.os,
  android.util,
  android.view,
  android.widget;

type
  MainActivity = public class(Activity)
  private
    Count: Integer := 0;
  public
    method onCreate(savedInstanceState: Bundle); override;
    method ButtonOnClick(v: View);
  end;

implementation

method MainActivity.onCreate(savedInstanceState: Bundle);
begin
  inherited;

  // Set our view from the "main" layout resource
  ContentView := R.layout.main;

  // Get our button from the layout resource,
  // and attach an event to it
  //var myButton: Button := Button(findViewById(R.id.MyButton));
  //myButton.OnClickListener := new interface View.OnClickListener(onClick := @ButtonOnClick);
end;

method MainActivity.ButtonOnClick(v: View);
begin
  inc(Count);
  //(v as Button).Text := WideString.format(String[R.string.my_button_text_2], Count);
end;

end.
