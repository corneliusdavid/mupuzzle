namespace MU_Puzzle_WinPhone;

interface

uses
  MU_Puzzle_WinPhone.Resources;

type
  /// <summary>
  /// Provides access to string resources.
  /// </summary>
  LocalizedStrings = public class
  private
    class var _localizedResources: AppResources := new AppResources();

  public
    property LocalizedResources: AppResources read _localizedResources;
  end;

implementation

end.