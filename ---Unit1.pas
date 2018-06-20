unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, INIFiles, MMSystem, ShellAPI, ExtCtrls;

type TOkienko = (toNowaGra, toRekordy, toNowyRekord, toUstawienia, toInfo, toWyjscie,
toKoniecGry, toKasujRekordy);
type
  TForm1 = class(TForm)
	  Check1: TImage;
    Check3: TImage;
    Check2: TImage;
    Opt1: TLabel;
    Opt2: TLabel;
    Opt3: TLabel;
    Opt4: TLabel;
    Ilek1: TImage;
    ilek2: TImage;
    Ilek3: TImage;
    kolor5: TLabel;
    kolor7: TLabel;
    kolor9: TLabel;
    Opt5: TLabel;
    optlang: TLabel;
    langb: TImage;
    langn: TImage;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Plansza: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PokazNowe: TTimer;
    Podskoki: TTimer;
    Ruch: TTimer;
    UsunLinie: TTimer;
    PokazNastepne: TTimer;
    Nastepne: TImage;
    Okno1: TImage;
    okno2: TImage;
    okno2ok: TImage;
    okno2anuluj: TImage;
    okno2caption: TLabel;
    okno2p1: TPanel;
    okno2tekst: TLabel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    oknocaption: TLabel;
    infook: TImage;
    infotext: TLabel;
    InfoKulka: TImage;
    InfoAppName: TLabel;
    InfoCopy: TLabel;
    InfoMail: TLabel;
    Infowww: TLabel;
    ScoreDelete: TImage;
    ScoreOK: TImage;
    ScoreList: TLabel;
    ScorePoints: TLabel;
    NewScoreText: TLabel;
    NewScoreOK: TImage;
    NewScoreEdit: TEdit;
    procedure okno2okClick(Sender: TObject);
    procedure okno2anulujClick(Sender: TObject);
    procedure okno2anulujMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure okno2anulujMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure okno2okMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure okno2okMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PokazNastepneTimer(Sender: TObject);
    procedure Image12Click(Sender: TObject);
    procedure Image10Click(Sender: TObject);
    procedure Image9Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure UsunLinieTimer(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure RuchTimer(Sender: TObject);
    procedure PlanszaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure PodskokiTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PokazNoweTimer(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image11Click(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DisableFontSmoothing(LabelName: TLabel);
    procedure ChangeColor(Sender: TObject; Msg: Integer);
    procedure ChangeColorOk(Sender: TObject; Msg: Integer);
    procedure ChangeColorAnuluj(Sender: TObject; Msg: Integer);
    procedure MyszGora(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure MyszDol(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Okno2P1klik;
    procedure InfoClose;
    procedure PathFind;
    procedure Losuj;
    procedure Zamaluj(x, y: Integer; bitmapa: string);
    procedure Zamaluj2(bitmapa: string);
    procedure Zamaluj3(x, y: Integer; kolor, bitmapa: string);
    procedure WyczyscPlansze;
    procedure KoniecGry;
    procedure SprawdzLinie;
    procedure PokazOkno;
    procedure Pauza(p: Boolean);
    procedure NowaGra;
    procedure GrajDzwiek(s: PAnsiChar);
    procedure WczytajWyniki;
    procedure ZapiszWyniki;
    procedure KasujWyniki;
    procedure infookClick(Sender: TObject);
    procedure infookMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure infookMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure InfoMailClick(Sender: TObject);
    procedure InfowwwClick(Sender: TObject);
    procedure ScoreOKClick(Sender: TObject);
    procedure ScoreDeleteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScoreOKMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScoreDeleteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScoreOKMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ScoreDeleteClick(Sender: TObject);
    procedure NewScoreOKMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NewScoreOKMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure NewScoreOKClick(Sender: TObject);
  private
    procedure WndProc(var Mesg : TMessage); override;
  public
  end;

type
  TPole = packed record
    x, y, wartosc: Integer;
  end;

type
  TGra = packed record
    punkty, ile_kolorow, ile_losuj: Integer;
    pokazuj_nastepne_kolory, dzwiek, czy_usunal: Boolean;
    jezyk: string;
    plansza: array[0..8, 0..8] of Integer;
    nastepne_kolory: array[0..4] of Integer;
    koniec: Boolean;
    nowyrekord: Boolean;
  end;

type
  TUndo = packed record
    punkty: Integer;
    plansza: array[0..8, 0..8] of Integer;
    nastepne_kolory: array[0..2] of Integer;
    czy_cofac: Boolean;
  end;

type
  TGraphicHintWindow = class(THintWindow)
    constructor Create(AOwner: TComponent); override;
  private
    FActivating: Boolean;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
  protected
    procedure Paint; override;
  published
    property Caption;
  end;

var
  Form1: TForm1;
  formx, formy, lx, ly, los, ktora_kulka, przesx, przesy, usun: Integer;
  ruch_kulki: Extended;
  Gra: TGra;
  Undo: TUndo;
  Trasa: array of TPole;
  pktA, pktB: TPoint;
  bmp: TBitmap;
  jest_Trasa: Boolean = False;
  sprawdz_od_pkt, usun_kulki: array of TPole;
  pauza_tab: array[1..5] of Boolean;
  IconNotifyData: TNotifyIconData;
  okno: TOkienko;
  wyniki_arr: array[0..9,0..9] of string;

implementation

{$R *.dfm}
{$R przyciski.RES}
{$R plansza.RES}
{$R kursor.RES}
{$R dzwiek.RES}
{$R kulki.RES}

function StringXOR(const S: string; const Klucz: Byte): string;
var i: Cardinal;
begin
  result:=S;
  for i:=1 to Length(result) do
    result[i]:=Chr(Ord(result[i]) xor Klucz);
end;

function CzyGraAktywna: Boolean;
var x, y: Integer;
    war: Boolean;
begin
  war:=False;
  for x:=0 to 8 do
  begin
    for y:=0 to 8 do
    begin
      if Gra.plansza[x,y]<>0 then
      begin
        war:=True;
        Break;
      end;
    end;
  end;
  result := war;
end;

constructor TGraphicHintWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  with Canvas.Font do
  begin
    Name:='Arial';
    Style:=Style+[fsBold];
    Color:=clBlack;
  end;
end;

procedure TGraphicHintWindow.Paint;
var
  R: TRect;
  bmp2: TBitmap;
begin
  R:=ClientRect;
  Inc(R.Left, 2);
  Inc(R.Top, 2);
  bmp2:=TBitmap.Create;
  bmp2.LoadFromResourceName(hInstance, 'hint');
  with Canvas do
  begin
    Brush.Style:=bsSolid;
    Brush.Color:=clSilver;
    Pen.Color:=clGray;
    Pen.Width:=1;
    Pen.Style:=psSolid;
    Rectangle(0, 0, 24, R.Bottom+1);
    Draw(2, (R.Bottom div 2)-(bmp2.Height div 2), bmp2);
  end;
  bmp2.Free;
  Color:=clWhite;
  Canvas.Brush.Style:=bsClear;
  Canvas.TextOut(26, (R.Bottom div 2)-(Canvas.Textheight(Caption) div 2), Caption);
end;

procedure TGraphicHintWindow.ActivateHint(Rect: TRect; const AHint: string);
begin
  FActivating:=True;
  try
    Caption:=AHint;
    Inc(Rect.Bottom, 14);
    Rect.Right:=Rect.Right+26;
    UpdateBoundsRect(Rect);
    if Rect.Top+Height>Screen.DesktopHeight then
      Rect.Top:=Screen.DesktopHeight-Height;
    if Rect.Left+Width>Screen.DesktopWidth then
      Rect.Left:=Screen.DesktopWidth-Width;
    if Rect.Left<Screen.DesktopLeft then
      Rect.Left:=Screen.DesktopLeft;
    if Rect.Bottom < Screen.DesktopTop then
      Rect.Bottom:=Screen.DesktopTop;
    SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height, SWP_SHOWWINDOW or SWP_NOACTIVATE);
    Invalidate;
  finally
    FActivating:=False;
  end;
end;

function BitmapToRegion(Bitmap: TBitmap; KolorTla: TColor): HRGN;
var x, y, startx, endx, wd: Integer;
    rgn2: HRGN;
begin
  Result:=CreateRectRgn(0, 0, 0, 0);
  for y:=0 to Bitmap.Height-1 do
  begin
    x:=0;
    wd:=BitMap.Width;
    while x<wd do
    begin
      while (Bitmap.Canvas.Pixels[x,y]=KolorTla) and (x<=wd) do
        Inc(x);
      startx:=x;
      Inc(x);
      while (Bitmap.Canvas.Pixels[x,y]<>KolorTla) and (x<=wd) do
        Inc(x);
      endx:=x;
      if startx<wd then
      begin
        rgn2:=CreateRectRgn(startx+1, y, endx,y+1);
        if rgn2<>0 then
          CombineRgn(Result, Result, rgn2, RGN_OR);
        DeleteObject(rgn2);
      end;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var Region: HRGN;
    petla: Byte;
    ustawienia: TINIFile;
begin
  HintWindowClass := TGraphicHintWindow;
  Application.ShowHint := False;
  Application.ShowHint := True;
  Plansza.Enabled:=False;
  Screen.Cursors[1]:=LoadCursor(hInstance, 'kursor');
  Form1.Cursor:=1;
  Form1.DoubleBuffered:=True;
  Image1.Picture.Bitmap.LoadFromResourceName(hInstance, 'plansza');
  Region:=BitmapToRegion(Image1.Picture.Bitmap, clFuchsia);
  SetWindowRgn(Form1.Handle, Region, True);
  for petla:=0 to ComponentCount-1 do
  begin
    if Components[petla] is TLabel then
    begin
      TLabel(Components[petla]).Font.Name:='Arial';
      DisableFontSmoothing(TLabel(Components[petla]));
    end;
  end;
  for petla:=2 to 12 do
    TImage(FindComponent('Image'+IntToStr(petla))).Picture.Bitmap.LoadFromResourceName(hInstance, 'L'+IntToStr(TImage(FindComponent('Image'+IntToStr(petla))).Tag));
  ustawienia:=TINIFile.Create(ExtractFilePath(Application.ExeName)+'settings.ini');
  Gra.ile_kolorow:=ustawienia.ReadInteger('SETTINGS', 'colors', 5);
  Gra.pokazuj_nastepne_kolory:=ustawienia.ReadBool('SETTINGS', 'next_colors', True);
  Gra.dzwiek:=ustawienia.ReadBool('SETTINGS', 'SOUND', True);
  Gra.jezyk:=ustawienia.ReadString('SETTINGS', 'language', 'polski');
  ustawienia.Free;
  bmp:=TBitmap.Create;
  WyczyscPlansze;
  InfoKulka.Picture.Icon.Assign(application.Icon);
  WczytajWyniki;
end;

procedure TForm1.DisableFontSmoothing(LabelName: TLabel);
var tagLOGFONT: TLogFont;
begin
  GetObject(LabelName.Font.Handle, SizeOf(TLogFont), @tagLOGFONT);
  tagLOGFONT.lfQuality:=ANTIALIASED_QUALITY;
  LabelName.Font.Handle:=CreateFontIndirect(tagLOGFONT);
end;

procedure TForm1.Label1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  formx:=X;
  formy:=Y;
end;

procedure TForm1.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if HiWord(GetAsyncKeyState(VK_LBUTTON))>0 then
  begin
    Form1.Left:=Form1.Left+X-formx;
    Form1.Top:=Form1.Top+Y-formy;
  end;
end;

procedure TForm1.Image11Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Application.Minimize;
end;

procedure TForm1.WndProc(var Mesg: TMessage);
begin
  if (Mesg.Msg=WM_USER+1)and((Mesg.lParam=WM_LBUTTONDOWN)) then
  begin
    Form1.Show;
    Pauza(False);
    Shell_NotifyIcon(NIM_DELETE, @IconNotifyData);
  end;
  if Mesg.LParam = Longint(Image2) then
    ChangeColor(Image2, Mesg.Msg);
  if Mesg.LParam = Longint(Image3) then
    ChangeColor(Image3, Mesg.Msg);
  if Mesg.LParam = Longint(Image4) then
    ChangeColor(Image4, Mesg.Msg);
  if Mesg.LParam = Longint(Image5) then
    ChangeColor(Image5, Mesg.Msg);
  if Mesg.LParam = Longint(Image6) then
    ChangeColor(Image6, Mesg.Msg);
  if Mesg.LParam = Longint(Image7) then
    ChangeColor(Image7, Mesg.Msg);
  if Mesg.LParam = Longint(Image8) then
    ChangeColor(Image8, Mesg.Msg);
  if Mesg.LParam = Longint(Image9) then
    ChangeColor(Image9, Mesg.Msg);
  if Mesg.LParam = Longint(Image10) then
    ChangeColor(Image10, Mesg.Msg);
  if Mesg.LParam = Longint(Image11) then
    ChangeColor(Image11, Mesg.Msg);
  if Mesg.LParam = Longint(Image12) then
    ChangeColor(Image12, Mesg.Msg);
  if Mesg.LParam = Longint(okno2ok) then
    ChangeColorOk(okno2ok, Mesg.Msg);
  if Mesg.LParam = Longint(okno2anuluj) then
    ChangeColorAnuluj(okno2anuluj, Mesg.Msg);
  if Mesg.LParam = Longint(infook) then
    ChangeColorOk(infook, Mesg.Msg);
  if Mesg.LParam = Longint(ScoreOK) then
    ChangeColorOk(ScoreOK, Mesg.Msg);
  if Mesg.LParam = Longint(ScoreDelete) then
    ChangeColorAnuluj(ScoreDelete, Mesg.Msg);
  if Mesg.LParam = Longint(NewScoreOK) then
    ChangeColorOk(NewScoreOK, Mesg.Msg);
  inherited WndProc(Mesg) ;
end;

procedure TForm1.ChangeColorOk(Sender: TObject; Msg: Integer);
Begin
  if Sender is TImage then
  begin
    if((Okno1.Visible=True) and (Okno2.Visible=True)) then
    begin
      ScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
      if (Sender as TImage).Name <> 'ScoreOK' then
      begin
        if(Msg=CM_MOUSELEAVE) then
          (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL')
        else
        if (Msg=CM_MOUSEENTER) then
          (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
      end;
    end else
    begin
      if(Msg=CM_MOUSELEAVE) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL')
      else
      if (Msg=CM_MOUSEENTER) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
    end;
  end;
end;

procedure TForm1.ChangeColorAnuluj(Sender: TObject; Msg: Integer);
Begin
  if Sender is TImage then
  begin
    if((Okno1.Visible=True) and (Okno2.Visible=True)) then
    begin
       ScoreDelete.ShowHint:=False;
       ScoreDelete.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
       if (Sender as TImage).Name <> 'ScoreDelete' then
       begin
         if(Msg=CM_MOUSELEAVE) then
            (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL')
        else
          if (Msg=CM_MOUSEENTER) then
            (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'ANE');
       end;
    end else
    begin
      ScoreDelete.ShowHint:=True;
      if(Msg=CM_MOUSELEAVE) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL')
      else
      if (Msg=CM_MOUSEENTER) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'ANE');
    end;
  end;
end;

procedure TForm1.ChangeColor(Sender: TObject; Msg: Integer);
Begin
  if Sender is TImage then
  begin
    if((Okno1.Visible=False) and (Okno2.Visible=False)) then
    begin
      (Sender as TImage).ShowHint:=True;
      if(Msg=CM_MOUSELEAVE) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'L'+IntToStr((Sender as TImage).Tag))
      else
      if (Msg=CM_MOUSEENTER) then
        (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'E'+IntToStr((Sender as TImage).Tag));
    end else
    begin
      (Sender as TImage).ShowHint:=False;
      (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'L'+IntToStr((Sender as TImage).Tag));
    end;
  end;
end;

procedure TForm1.MyszGora(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'E'+IntToStr((Sender as TImage).Tag));
end;

procedure TForm1.MyszDol(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TImage).Picture.Bitmap.LoadFromResourceName(hInstance, 'D'+IntToStr((Sender as TImage).Tag));
end;

function SprawdzCzyPunktB(px, py: Integer): Boolean;
begin
  if (px=pktB.X) and (py=pktB.Y) then
    result:=True
  else
    result:=False;
end;

procedure TForm1.PathFind;
var temp_tab: array[0..8, 0..8] of Integer;
    x, y, k: Integer;
    szukaj: Boolean;
begin
  for x:=0 to 8 do
  begin
    for y:=0 to 8 do
    begin
      if Gra.plansza[x,y]<>0 then
        temp_tab[x,y]:=-1
      else
        temp_tab[x,y]:=0;
    end;
  end;

  if (pktA.X+1<9) and (temp_tab[pktA.X+1,pktA.Y]=0) then
    temp_tab[pktA.X+1,pktA.Y]:=1;
  if (pktA.X-1>-1) and (temp_tab[pktA.X-1,pktA.Y]=0) then
    temp_tab[pktA.X-1,pktA.Y]:=1;
  if (pktA.Y+1<9) and (temp_tab[pktA.X,pktA.Y+1]=0) then
    temp_tab[pktA.X,pktA.Y+1]:=1;
  if (pktA.Y-1>-1) and (temp_tab[pktA.X,pktA.Y-1]=0) then
    temp_tab[pktA.X,pktA.Y-1]:=1;

  k:=0;
  szukaj:=True;
  jest_trasa:=False;

  while szukaj do
  begin
    szukaj:=False;
    k:=k+1;
    for x:=0 to 8 do
    begin
      for y:=0 to 8 do
      begin
        if temp_tab[x,y]=k then
        begin
          if (x=pktB.X) and (y=pktB.Y) then
          begin
            jest_trasa:=True;
            Break;
          end;
          if (y+1<9) and (temp_tab[x,y+1]=0) then
          begin
            szukaj:=True;
            temp_tab[x,y+1]:=k+1;
          end;
          if (y-1>-1) and (temp_tab[x,y-1]=0) then
          begin
            szukaj:=True;
            temp_tab[x,y-1]:=k+1;
          end;
          if (x-1>-1) and (temp_tab[x-1,y]=0) then
          begin
            szukaj:=True;
            temp_tab[x-1,y]:=k+1;
          end;
          if (x+1<9) and (temp_tab[x+1,y]=0) then
          begin
            szukaj:=True;
            temp_tab[x+1,y]:=k+1;
          end;
        end;
      end;
      if jest_trasa then Break;
    end;
  end;
  temp_tab[pktA.X, pktA.Y]:=0;

  if jest_trasa then
  begin
    SetLength(Trasa, temp_tab[pktB.X,pktB.Y]+1);
    Trasa[High(Trasa)].x:=pktB.X;
    Trasa[High(Trasa)].y:=pktB.Y;
    Trasa[High(Trasa)].wartosc:=Gra.plansza[pktA.X, pktA.Y];
    for x:=High(Trasa) downto 2 do
    begin
      if (Trasa[x].X+1<9) and (temp_tab[Trasa[x].X+1, Trasa[x].Y]=x-1) then
      begin
        Trasa[x-1].X:=Trasa[x].X+1;
        Trasa[x-1].Y:=Trasa[x].Y;
        Trasa[x-1].wartosc:=Gra.plansza[pktA.X, pktA.Y];
      end else
      if (Trasa[x].X-1>-1) and (temp_tab[Trasa[x].X-1, Trasa[x].Y]=x-1) then
      begin
        Trasa[x-1].X:=Trasa[x].X-1;
        Trasa[x-1].Y:=Trasa[x].Y;
        Trasa[x-1].wartosc:=Gra.plansza[pktA.X, pktA.Y];
      end else
      if (Trasa[x].Y-1>-1) and (temp_tab[Trasa[x].X, Trasa[x].Y-1]=x-1) then
      begin
        Trasa[x-1].X:=Trasa[x].X;
        Trasa[x-1].Y:=Trasa[x].Y-1;
        Trasa[x-1].wartosc:=Gra.plansza[pktA.X, pktA.Y];
      end else
      if (Trasa[x].Y+1<9) and (temp_tab[Trasa[x].X, Trasa[x].Y+1]=x-1) then
      begin
        Trasa[x-1].X:=Trasa[x].X;
        Trasa[x-1].Y:=Trasa[x].Y+1;
        Trasa[x-1].wartosc:=Gra.plansza[pktA.X, pktA.Y];
      end;
    end;
    Trasa[0].x:=pktA.X;
    Trasa[0].y:=pktA.Y;
    Trasa[0].wartosc:=Gra.plansza[pktA.X, pktA.Y];
  end;
end;

procedure TForm1.NowaGra;
var x, y: Integer;
begin
  Undo.czy_cofac := False;
  for x:=0 to 8 do
  begin
    for y:=0 to 8 do
    begin
      Gra.plansza[x,y]:=0;
    end;
  end;
  for x:=1 to 5 do
    pauza_tab[x]:=False;
  Pauza(False);
  PokazNowe.Enabled:=False;
  Podskoki.Enabled:=False;
  Ruch.Enabled:=False;
  UsunLinie.Enabled:=False;
  PokazNastepne.Enabled:=False;
  Plansza.Enabled:=True;
  WyczyscPlansze;
  Gra.koniec := False;
  pktA.X:=-1;
  pktA.Y:=-1;
  pktB.X:=-1;
  pktB.Y:=-1;
  Gra.punkty:=0;
  Label4.Caption:='0';
  Gra.ile_losuj:=5;
  Gra.nowyrekord:=False;
  SetLength(sprawdz_od_pkt, 5);
  Gra.czy_usunal:=False;
  ktora_kulka:=1;
  Losuj;
  PokazNowe.Enabled:=True;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Pauza(True);
  if (CzyGraAktywna=False) or (gra.koniec=true) then
  begin
    NowaGra;
  end else
  begin
    okno:=toNowaGra;
    PokazOkno;
  end;
end;

procedure TForm1.Losuj;
var x: Integer;
begin
  Randomize;
  for x:=0 to Gra.ile_losuj-1 do
  begin
    Gra.nastepne_kolory[x]:=Random(Gra.ile_kolorow)+1;
  end;
end;

procedure TForm1.PokazNoweTimer(Sender: TObject);
var pola: TStringList;
    x, y: Integer;
begin
  pola:=TStringList.Create;
  if Gra.ile_losuj>0 then
  begin
    if ktora_kulka>3 then
      ktora_kulka:=1;
    case ktora_kulka of
      1: begin
           Randomize;
           for x:=0 to 8 do
           begin
             for y:=0 to 8 do
             begin
               if Gra.plansza[x,y]=0 then
                 pola.Add(IntToStr(x)+';'+IntToStr(y));
             end;
           end;
           if pola.Count>0 then
           begin
             GrajDzwiek('pokaz');
             los:=Random(pola.Count);
             lx:=StrToInt(Copy(pola.Strings[los], 0, Pos(';', pola.Strings[los])-1));
             ly:=StrToInt(Copy(pola.Strings[los], Pos(';', pola.Strings[los])+1, Length(pola.Strings[los])));
             Zamaluj(lx*45, ly*45, 'b'+IntToStr(Gra.nastepne_kolory[Gra.ile_losuj-1])+IntToStr(ktora_kulka));
             sprawdz_od_pkt[Gra.ile_losuj-1].x:=lx;
             sprawdz_od_pkt[Gra.ile_losuj-1].y:=ly;
             sprawdz_od_pkt[Gra.ile_losuj-1].wartosc:=Gra.nastepne_kolory[Gra.ile_losuj-1];
           end else
             Gra.ile_losuj:=0;
         end;
      2: begin
           Zamaluj(lx*45, ly*45, 'b'+IntToStr(Gra.nastepne_kolory[Gra.ile_losuj-1])+IntToStr(ktora_kulka));
         end;
      3: begin
           Zamaluj(lx*45, ly*45, 'b'+IntToStr(Gra.nastepne_kolory[Gra.ile_losuj-1])+IntToStr(ktora_kulka));
           Gra.plansza[lx,ly]:=Gra.nastepne_kolory[Gra.ile_losuj-1];
           Dec(Gra.ile_losuj, 1);
         end;
    end;
    Inc(ktora_kulka, 1);
  end else
  begin
    PokazNowe.Enabled:=False;
    SprawdzLinie;
    if not Gra.czy_usunal then
    begin
      Gra.ile_losuj:=3;
      SetLength(sprawdz_od_pkt, 3);
      ktora_kulka:=1;
      Losuj;
      PokazNastepne.Enabled:=True;
    end;
  end;
  pola.Free;
end;

procedure TForm1.Zamaluj(x, y: Integer; bitmapa: string);
var bit: TBitmap;
begin
  if bitmapa='' then
    Plansza.Picture.Bitmap.Canvas.Rectangle(x, y, x+45, y+45)
  else
  begin
    bit:=TBitmap.Create;
    bit.LoadFromResourceName(hInstance, bitmapa);
    Plansza.Picture.Bitmap.Canvas.Draw(x, y, bit);
    bit.Free;
  end;
end;

procedure TForm1.Zamaluj2(bitmapa: string);
var b: array[0..2] of TBitmap;
    x, y: Integer;
begin
  y:=0;
  for x:=2 downto 0 do
  begin
    b[x]:=TBitmap.Create;
    b[x].LoadFromResourceName(hInstance, 'b'+IntToStr(Gra.nastepne_kolory[y])+bitmapa);
    Nastepne.Picture.Bitmap.Canvas.Draw(x*45, 0, b[x]);
    Inc(y, 1);
  end;
  for x:=0 to 2 do
    b[x].Free;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  bmp.Free;
  Finalize(sprawdz_od_pkt);
  Finalize(usun_kulki);
  Finalize(Trasa);
end;

procedure TForm1.WyczyscPlansze;
begin
  bmp.Width:=Plansza.Width;
  bmp.Height:=Plansza.Height;
  bmp.Canvas.Brush.Color:=clSilver;
  bmp.Canvas.Brush.Style:=bsSolid;
  bmp.Canvas.Pen.Width:=1;
  bmp.Canvas.Pen.Style:=psSolid;
  bmp.Canvas.Pen.Color:=clSilver;
  bmp.Canvas.Rectangle(0, 0, bmp.Width, bmp.Height);
  Plansza.Picture.Bitmap.Assign(bmp);
  Plansza.Picture.Bitmap.Canvas.Brush.Color:=clSilver;
  Plansza.Picture.Bitmap.Canvas.Brush.Style:=bsSolid;
  Plansza.Picture.Bitmap.Canvas.Pen.Width:=1;
  Plansza.Picture.Bitmap.Canvas.Pen.Style:=psSolid;
  Plansza.Picture.Bitmap.Canvas.Pen.Color:=clSilver;
  bmp.Width:=135;
  bmp.Height:=45;
  bmp.Canvas.Rectangle(0, 0, bmp.Width, bmp.Height);
  Nastepne.Picture.Bitmap.Assign(bmp);
  bmp.Width:=45;
  bmp.Height:=45;
end;

procedure TForm1.PlanszaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var ux, uy: Byte;
begin
  if (PokazNowe.Enabled=False) and (Ruch.Enabled=False) and (PokazNastepne.Enabled=False) and (UsunLinie.Enabled=False)then
  begin
    if Gra.plansza[X div 45,Y div 45]>0 then
    begin
      if (X div 45<>pktA.X) or (Y div 45<>pktA.Y) then
      begin
        GrajDzwiek('klik');
        Undo.punkty := Gra.punkty;
        for ux := 0 to 8 do
        begin
          for uy := 0 to 8 do
          begin
            Undo.plansza[ux,uy] := Gra.plansza[ux,uy];
          end;
          if(ux < 3) then
          begin
            Undo.nastepne_kolory[ux] := Gra.nastepne_kolory[ux];
          end;
        end;
        Podskoki.Enabled:=False;
        ktora_kulka:=0;
        if pktA.X<>-1 then
          Zamaluj(pktA.X*45, pktA.Y*45, 'b'+IntToStr(Gra.plansza[pktA.X,pktA.Y])+'3');
        pktA.X:=X div 45;
        pktA.Y:=Y div 45;
        Podskoki.Enabled:=True;
      end;
    end else
    begin
      if pktA.X<>-1 then
      begin
        GrajDzwiek('klik');
        pktB.X:=X div 45;
        pktB.Y:=Y div 45;
        PathFind;
        if jest_trasa then
        begin
          Undo.czy_cofac := True;
          Podskoki.Enabled:=False;
          Gra.plansza[pktA.X,pktA.Y]:=0;
          pktA.X:=-1;
          pktA.Y:=-1;
          ruch_kulki:=0.5;
          Ruch.Enabled:=True;
        end;
      end;  
    end;
  end;
end;

procedure TForm1.PodskokiTimer(Sender: TObject);
const grafika: array[0..3] of string = ('4','3','5','3');
begin
  if ktora_kulka>3 then
    ktora_kulka:=0;
  Zamaluj(pktA.X*45, pktA.Y*45, 'b'+IntToStr(Gra.plansza[pktA.X,pktA.Y])+grafika[ktora_kulka]);
  Inc(ktora_kulka, 1);
end;

procedure TForm1.RuchTimer(Sender: TObject);
begin
  if ruch_kulki<=High(Trasa) then
  begin
    if Frac(ruch_kulki)=0 then
    begin
      Zamaluj(Trasa[Trunc(ruch_kulki)].X*45+przesx, Trasa[Trunc(ruch_kulki)].Y*45+przesy, '');
      Zamaluj(Trasa[Trunc(ruch_kulki)].X*45, Trasa[Trunc(ruch_kulki)].Y*45, 'b'+IntToStr(Trasa[0].wartosc)+'3');
    end else
    begin
      if Trasa[Trunc(ruch_kulki)+1].X>Trasa[Trunc(ruch_kulki)].X then
      begin
        przesx:=-22;
        przesy:=0;
      end else
      if Trasa[Trunc(ruch_kulki)+1].X<Trasa[Trunc(ruch_kulki)].X then
      begin
        przesx:=22;
        przesy:=0;
      end else
      if Trasa[Trunc(ruch_kulki)+1].Y>Trasa[Trunc(ruch_kulki)].Y then
      begin
        przesx:=0;
        przesy:=-22;
      end else
      if Trasa[Trunc(ruch_kulki)+1].Y<Trasa[Trunc(ruch_kulki)].Y then
      begin
        przesx:=0;
        przesy:=22;
      end;
      Zamaluj(Trasa[Trunc(ruch_kulki)].X*45, Trasa[Trunc(ruch_kulki)].Y*45, '');
      Zamaluj(Trasa[Trunc(ruch_kulki)+1].X*45+przesx, Trasa[Trunc(ruch_kulki)+1].Y*45+przesy, 'b'+IntToStr(Trasa[0].wartosc)+'2');
    end;
    ruch_kulki:=ruch_kulki+0.5;
  end else
  begin
    Gra.plansza[Trasa[High(Trasa)].X, Trasa[High(Trasa)].Y]:=Trasa[High(Trasa)].wartosc;
    Ruch.Enabled:=False;
    SetLength(sprawdz_od_pkt, 1);
    sprawdz_od_pkt[0].x:=Trasa[High(Trasa)].X;
    sprawdz_od_pkt[0].y:=Trasa[High(Trasa)].Y;
    sprawdz_od_pkt[0].wartosc:=Trasa[High(Trasa)].wartosc;
    SprawdzLinie;
    if not Gra.czy_usunal then
    begin
      Gra.ile_losuj:=3;
      SetLength(sprawdz_od_pkt, 3);
      ktora_kulka:=1;
      PokazNowe.Enabled:=True;
    end;
  end;
end;

procedure TForm1.SprawdzLinie;
var pola: TStringList;
    x, y, petla, punkt, odkad, licznik: Integer;
    temp: array[0..8] of TPole;
begin
  Gra.czy_usunal:=False;
  SetLength(usun_kulki, 1);
  odkad:=0;

  for punkt:=0 to High(sprawdz_od_pkt) do
  begin
    //poziom prawo
    licznik:=0;
    if sprawdz_od_pkt[punkt].x+1<9 then
    begin
      for petla:=sprawdz_od_pkt[punkt].x+1 to 8 do
      begin
        if Gra.plansza[petla, sprawdz_od_pkt[punkt].y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=petla;
          temp[licznik].y:=sprawdz_od_pkt[punkt].y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
        end else
          Break;
      end;
    end;
    //poziom lewo
    if sprawdz_od_pkt[punkt].x-1>-1 then
    begin
      for petla:=sprawdz_od_pkt[punkt].x-1 downto 0 do
      begin
        if Gra.plansza[petla, sprawdz_od_pkt[punkt].y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=petla;
          temp[licznik].y:=sprawdz_od_pkt[punkt].y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
        end else
          Break;
      end;
    end;
    if licznik>=4 then
    begin
      temp[licznik].x:=sprawdz_od_pkt[punkt].x;
      temp[licznik].y:=sprawdz_od_pkt[punkt].y;
      temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
      Inc(licznik, 1);
      SetLength(usun_kulki, High(usun_kulki)+licznik);
      y:=0;
      for x:=odkad to High(usun_kulki) do
      begin
        usun_kulki[x].x:=temp[y].x;
        usun_kulki[x].y:=temp[y].y;
        usun_kulki[x].wartosc:=temp[y].wartosc;
        Inc(y, 1);
      end;
      odkad:=High(usun_kulki)+1;
      Gra.czy_usunal:=True;
    end;
    //koniec poziom

    //pion gora
    licznik:=0;
    if sprawdz_od_pkt[punkt].y+1<9 then
    begin
      for petla:=sprawdz_od_pkt[punkt].y+1 to 8 do
      begin
        if Gra.plansza[sprawdz_od_pkt[punkt].x, petla]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=sprawdz_od_pkt[punkt].x;
          temp[licznik].y:=petla;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
        end else
          Break;
      end;
    end;
    //pion dol
    if sprawdz_od_pkt[punkt].y-1>-1 then
    begin
      for petla:=sprawdz_od_pkt[punkt].y-1 downto 0 do
      begin
        if Gra.plansza[sprawdz_od_pkt[punkt].x, petla]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=sprawdz_od_pkt[punkt].x;
          temp[licznik].y:=petla;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
        end else
          Break;
      end;
    end;
    if licznik>=4 then
    begin
      temp[licznik].x:=sprawdz_od_pkt[punkt].x;
      temp[licznik].y:=sprawdz_od_pkt[punkt].y;
      temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
      Inc(licznik, 1);
      SetLength(usun_kulki, High(usun_kulki)+licznik);
      y:=0;
      for x:=odkad to High(usun_kulki) do
      begin
        usun_kulki[x].x:=temp[y].x;
        usun_kulki[x].y:=temp[y].y;
        usun_kulki[x].wartosc:=temp[y].wartosc;
        Inc(y, 1);
      end;
      odkad:=High(usun_kulki)+1;
      Gra.czy_usunal:=True;
    end;
    //koniec pion

    //skos \ lewo
    licznik:=0;
    if (sprawdz_od_pkt[punkt].x-1>-1) and (sprawdz_od_pkt[punkt].y-1>-1) then
    begin
      x:=sprawdz_od_pkt[punkt].x-1;
      y:=sprawdz_od_pkt[punkt].y-1;
      while (x>-1) and (y>-1) do
      begin
        if Gra.plansza[x,y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=x;
          temp[licznik].y:=y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
          Dec(x, 1);
          Dec(y, 1);
        end else
        begin
          x:=-1;
          y:=-1
        end;
      end;
    end;
    //skos \ prawo
    if (sprawdz_od_pkt[punkt].x+1<9) and (sprawdz_od_pkt[punkt].y+1<9) then
    begin
      x:=sprawdz_od_pkt[punkt].x+1;
      y:=sprawdz_od_pkt[punkt].y+1;
      while (x<9) and (y<9) do
      begin
        if Gra.plansza[x,y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=x;
          temp[licznik].y:=y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
          Inc(x, 1);
          Inc(y, 1);
        end else
        begin
          x:=9;
          y:=9
        end;
      end;
    end;
    if licznik>=4 then
    begin
      temp[licznik].x:=sprawdz_od_pkt[punkt].x;
      temp[licznik].y:=sprawdz_od_pkt[punkt].y;
      temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
      Inc(licznik, 1);
      SetLength(usun_kulki, High(usun_kulki)+licznik);
      y:=0;
      for x:=odkad to High(usun_kulki) do
      begin
        usun_kulki[x].x:=temp[y].x;
        usun_kulki[x].y:=temp[y].y;
        usun_kulki[x].wartosc:=temp[y].wartosc;
        Inc(y, 1);
      end;
      odkad:=High(usun_kulki)+1;
      Gra.czy_usunal:=True;
    end;
    //koniec skos \

    //skos / lewo
    licznik:=0;
    if (sprawdz_od_pkt[punkt].x-1>-1) and (sprawdz_od_pkt[punkt].y+1<9) then
    begin
      x:=sprawdz_od_pkt[punkt].x-1;
      y:=sprawdz_od_pkt[punkt].y+1;
      while (x>-1) and (y<9) do
      begin
        if Gra.plansza[x,y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=x;
          temp[licznik].y:=y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
          Dec(x, 1);
          Inc(y, 1);
        end else
        begin
          x:=-1;
          y:=9;
        end;
      end;
    end;
    //skos / prawo
    if (sprawdz_od_pkt[punkt].x+1<9) and (sprawdz_od_pkt[punkt].y-1>-1) then
    begin
      x:=sprawdz_od_pkt[punkt].x+1;
      y:=sprawdz_od_pkt[punkt].y-1;
      while (x<9) and (y>-1) do
      begin
        if Gra.plansza[x,y]=sprawdz_od_pkt[punkt].wartosc then
        begin
          temp[licznik].x:=x;
          temp[licznik].y:=y;
          temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
          Inc(licznik, 1);
          Inc(x, 1);
          Dec(y, 1);
        end else
        begin
          x:=9;
          y:=-1;
        end;
      end;
    end;
    if licznik>=4 then
    begin
      temp[licznik].x:=sprawdz_od_pkt[punkt].x;
      temp[licznik].y:=sprawdz_od_pkt[punkt].y;
      temp[licznik].wartosc:=sprawdz_od_pkt[punkt].wartosc;
      Inc(licznik, 1);
      SetLength(usun_kulki, High(usun_kulki)+licznik);
      y:=0;
      for x:=odkad to High(usun_kulki) do
      begin
        usun_kulki[x].x:=temp[y].x;
        usun_kulki[x].y:=temp[y].y;
        usun_kulki[x].wartosc:=temp[y].wartosc;
        Inc(y, 1);
      end;
      odkad:=High(usun_kulki)+1;
      Gra.czy_usunal:=True;
    end;
    //koniec skos /
  end;

  if Gra.czy_usunal then
  begin
    GrajDzwiek('usun');
    usun:=2;
    UsunLinie.Enabled:=True;
  end;

  pola:=TStringList.Create;
  for x:=0 to 8 do
  begin
    for y:=0 to 8 do
    begin
      if Gra.plansza[x,y]=0 then
        pola.Add(IntToStr(x)+';'+IntToStr(y));
    end;
  end;
  if pola.Count=81 then
  begin
    Gra.ile_losuj:=3;
    ktora_kulka:=1;
    PokazNowe.Enabled:=True;
  end;
  if (pola.Count=0) then
    KoniecGry;
  pola.Free;
end;

procedure TForm1.PokazNastepneTimer(Sender: TObject);
begin
  if ktora_kulka<=3 then
  begin
    Zamaluj2(IntToStr(ktora_kulka));
    Inc(ktora_kulka, 1);
  end else
    PokazNastepne.Enabled:=False;
end;

procedure TForm1.Zamaluj3(x, y: Integer; kolor, bitmapa: string);
var b: array[1..9] of TBitmap;
    z: Integer;
begin
  if bitmapa='' then
  begin
    Plansza.Picture.Bitmap.Canvas.Rectangle(x*45, y*45, x*45+45, y*45+45)
  end else
  begin
    for z:=1 to 9 do
    begin
      b[z]:=TBitmap.Create;
      b[z].LoadFromResourceName(hInstance, 'b'+IntToStr(z)+bitmapa);
    end;
    Plansza.Picture.Bitmap.Canvas.Draw(x*45, y*45, b[StrToInt(kolor)]);
    for z:=1 to 9 do
      b[z].Free;
  end;
end;

procedure TForm1.UsunLinieTimer(Sender: TObject);
var x: Integer;
begin
  if usun>0 then
  begin
    for x:=0 to High(usun_kulki) do
    begin
      Zamaluj3(usun_kulki[x].x, usun_kulki[x].y, IntToStr(usun_kulki[x].wartosc), IntToStr(usun));
    end;
  Dec(usun, 1);
  end else
  begin
    UsunLinie.Enabled:=False;
    for x:=0 to High(usun_kulki) do
    begin
      Zamaluj3(usun_kulki[x].x, usun_kulki[x].y, '', '');
      Gra.plansza[usun_kulki[x].x, usun_kulki[x].y]:=0;
    end;
    x:=0;
    case Gra.ile_kolorow of
      5: x:=(High(usun_kulki)+1);
      7: x:=(High(usun_kulki)+1)*2;
      9: x:=(High(usun_kulki)+1)*4;
    end;
    if Gra.pokazuj_nastepne_kolory then
      x:=x-Round(x/3);
    Inc(Gra.punkty, x);
    Label4.Caption:=IntToStr(Gra.punkty);
  end;
end;

procedure TForm1.KoniecGry;
begin
  Gra.koniec := True;
  Plansza.Enabled := False;
  Undo.czy_cofac := False;
  if gra.punkty > StrToInt(wyniki_arr[9,1]) then
  begin
      Gra.nowyrekord:=True;
      okno:=toNowyRekord;
      Pauza(True);
      PokazOkno;
  end else
  begin
    Pauza(True);
    okno:=toKoniecGry;
    PokazOkno;
  end;
end;

procedure TForm1.Image3Click(Sender: TObject);
var s: TStringList;
    x, y: Integer;
    temp: string;
    b: TBitmap;
begin
  GrajDzwiek('klik');
  if OpenDialog1.Execute then
  begin
    Pauza(True);
    s:=TStringList.Create;
    s.LoadFromFile(OpenDialog1.FileName);
    s.Text:=StringXOR(s.Text, 183);
    if s.Strings[0]='KulkiEx' then
    begin
      WyczyscPlansze;
      for x:=2 to 12 do
        TImage(FindComponent('Image'+IntToStr(x))).Enabled:=True;
      Plansza.Enabled:=True;
      pktA.X:=-1;
      pktA.Y:=-1;
      pktB.X:=-1;
      pktB.Y:=-1;
      Gra.ile_losuj:=3;
      SetLength(sprawdz_od_pkt, 3);
      Gra.czy_usunal:=False;
      ktora_kulka:=1;
      for y:=0 to 8 do
      begin
        temp:=s.Strings[y+1];
        for x:=0 to 8 do
        begin
          Gra.plansza[x,y]:=StrToInt(temp[x+1]);
          if Gra.plansza[x,y]>0 then
            Zamaluj(x*45, y*45, 'b'+temp[x+1]+'3');
        end;
      end;
      Gra.punkty:=StrToInt(s.Strings[10]);
      Label4.Caption:=IntToStr(Gra.punkty);
      for x:=0 to 2 do
      begin
        Gra.nastepne_kolory[x]:=StrToInt(s.Strings[x+11]);
        b:=TBitmap.Create;
        b.LoadFromResourceName(hInstance, 'b'+s.Strings[x+11]+'3');
        Nastepne.Canvas.Draw(x*45, 0, b);
        b.Free;
      end;
      if s.Strings[15]='True' then
      begin
        Gra.pokazuj_nastepne_kolory:=True;
        Nastepne.Visible:=True;
      end else
        Gra.pokazuj_nastepne_kolory:=False;
      Gra.ile_kolorow:=StrToInt(s.Strings[14]);
    end else
    begin
      s.Free;
      Application.MessageBox('To nie jest plik gry KulkiEx!', 'B³¹d', MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure TForm1.Image4Click(Sender: TObject);
var s: TStringList;
    x, y: Integer;
    temp: string;
    war: Boolean;
begin
  GrajDzwiek('klik');
  war:= CzyGraAktywna;
  if war and SaveDialog1.Execute then
  begin
    Pauza(True);
    s:=TStringList.Create;
    s.Add('KulkiEx');
    for y:=0 to 8 do
    begin
      temp:='';
      for x:=0 to 8 do
      begin
        temp:=temp+IntToStr(Gra.plansza[x,y]);
      end;
      s.Add(temp);
    end;
    s.Add(IntToStr(Gra.punkty));
    for x:=0 to 2 do
      s.Add(IntToStr(Gra.nastepne_kolory[x]));
    s.Add(IntToStr(Gra.ile_kolorow));
    if Gra.pokazuj_nastepne_kolory then
      s.Add('True')
    else
      s.Add('False');
    s.Text:=StringXOR(s.Text, 183);
    s.SaveToFile(SaveDialog1.FileName);
    s.Free;
    Pauza(False);
  end;
end;

procedure TForm1.Image5Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Pauza(True);
  okno:=toRekordy;
  PokazOkno;
end;

procedure TForm1.Image6Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Pauza(True);
  okno := toUstawienia;
  PokazOkno;
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  with IconNotifyData do
  begin
    hIcon:=Application.Icon.Handle;
    uCallbackMessage:=WM_USER+1;
    cbSize:=SizeOf(IconNotifyData);
    Wnd:=Handle;
    uID:=100;
    uFlags:=NIF_MESSAGE+NIF_ICON+NIF_TIP;
  end;
  StrPCopy(IconNotifyData.szTip, Application.Title);
  Shell_NotifyIcon(NIM_ADD, @IconNotifyData);
  Pauza(True);
  Form1.Hide;
end;

procedure TForm1.Image8Click(Sender: TObject);
var ux, uy: Byte;
begin
  GrajDzwiek('klik');
  if((Undo.czy_cofac=true) and (PokazNowe.Enabled=False) and (Ruch.Enabled=False) and (PokazNastepne.Enabled=False) and (UsunLinie.Enabled=False)) then
  begin
    Podskoki.Enabled := False;
    Gra.punkty := Undo.punkty;
    Label4.Caption := IntToStr(Gra.punkty);
    for ux := 0 to 8 do
    begin
      for uy := 0 to 8 do
      begin
        Gra.plansza[ux,uy] := Undo.plansza[ux,uy];
        if Gra.plansza[ux,uy] = 0 then
          Zamaluj(ux*45, uy*45, '')
        else
          Zamaluj(ux*45, uy*45, 'b'+IntToStr(Gra.plansza[ux,uy])+'3');
      end;
      if(ux < 3) then
      begin
        Gra.nastepne_kolory[ux] := Undo.nastepne_kolory[ux];
      end;
    end;
    Zamaluj2('3');
    Undo.czy_cofac := False;
  end;
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Pauza(True);
  okno:=toInfo;
  PokazOkno;
end;

procedure TForm1.Image10Click(Sender: TObject);
begin
  GrajDzwiek('klik');
//-wyswietl plik pomocy
end;

procedure TForm1.Image12Click(Sender: TObject);
begin
  GrajDzwiek('klik');
  Pauza(True);
  okno:=toWyjscie;
  PokazOkno;
end;

procedure TForm1.PokazOkno;
var x: Byte;
    tmp: string;
begin
  case okno of
    toNowaGra: begin
                 okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                 okno2ok.Visible:=True;
                 okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                 okno2anuluj.Visible:=True;
                 okno2.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko2');
                 okno2.Visible:=True;
                 okno2caption.Caption:='Potwierdzenie';
                 okno2caption.Visible:=True;
                 okno2tekst.Caption:='Czy chcesz przerwaæ aktualn¹ grê?';
                 okno2p1.Visible:=True;
               end;
    toRekordy: begin
                  ScoreList.Caption := '';
                  ScorePoints.Caption := '';
                  okno1.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko');
                  okno1.Visible:=True;
                  oknocaption.Caption:='Tabela Wyników';
                  oknocaption.Visible:=True;
                  ScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                  ScoreOK.Visible:=True;
                  ScoreDelete.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                  ScoreDelete.Visible:=True;
                  ScoreDelete.Hint := 'Skasuj wyniki';
                  ScoreList.Visible:=true;
                  ScorePoints.Visible:=true;
                  for x:=0 to 9 do
                  begin
                    if x < 9 then tmp := '0' else tmp := '';
                    ScoreList.Caption := ScoreList.Caption + tmp + IntToStr(x+1) + '. ' + wyniki_arr[x,0];
                    ScorePoints.Caption := ScorePoints.Caption + wyniki_arr[x,1];
                    if x < 9 then
                    begin
                      ScoreList.Caption := ScoreList.Caption + #13#10;
                      ScorePoints.Caption := ScorePoints.Caption + #13#10;
                    end;
                  end;
            end;
    toKasujRekordy: begin
                      okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                      okno2ok.Visible:=True;
                      okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                      okno2anuluj.Visible:=True;
                      okno2.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko2');
                      okno2.Visible:=True;
                      okno2caption.Caption:='Potwierdzenie';
                      okno2caption.Visible:=True;
                      okno2tekst.Caption:='Czy chcesz skasowaæ wyniki?';
                      okno2p1.Visible:=True;
                      ScoreDelete.Enabled:=False;
                      ScoreOK.Enabled:=False;
                    end;
    toNowyRekord: begin
                    NewScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                    NewScoreOK.Visible:=True;
                    okno2.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko2');
                    okno2.Visible:=True;
                    okno2caption.Caption:='Nowy rekord!';
                    okno2caption.Visible:=True;
                    NewScoreText.Caption:='Podaj swoje imiê:';
                    NewScoreText.Visible:=True;
                    NewScoreEdit.Visible:=True;
                    NewScoreEdit.SetFocus;
                  end;
    toUstawienia: begin
                    okno1.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko');
                    okno1.Visible:=True;
                    oknocaption.Caption:='Ustawienia';
                    oknocaption.Visible:=True;
                    ScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                    ScoreOK.Visible:=True;
                    ScoreDelete.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                    ScoreDelete.Visible:=True;
                    //Opt1.Caption:='';
                    Opt1.Visible:=True;
                    //Opt2.Caption:='';
                    Opt2.Visible:=True;
                    //Opt3.Caption:='';
                    Opt3.Visible:=True;
                    //Opt4.Caption:='';
                    Opt4.Visible:=True;
                    //Opt5.Caption:='';
                    Opt5.Visible:=True;
                    Check1.Visible:=true;
                    Check2.Visible:=true;
                    Check3.Visible:=true;
                    ilek1.Visible:=true;
                    ilek2.Visible:=true;
                    ilek3.Visible:=true;
                    kolor5.Visible:=true;
                    kolor7.Visible:=true;
                    kolor9.Visible:=true;
                    langb.Picture.Bitmap.LoadFromResourceName(hInstance, 'CHECK1');
                    langb.Visible:=true;
                    langn.Picture.Bitmap.LoadFromResourceName(hInstance, 'CHECK1');
                    langn.Visible:=true;
                    //optlang.Caption:='';
                    optlang.Visible:=true;
                  end;
    toInfo: begin
              okno1.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko');
              okno1.Visible:=True;
              oknocaption.Caption:='Informacje';
              oknocaption.Visible:=True;
              infook.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
              infook.Visible:=True;
              infoappname.Visible:=true;
              infocopy.Visible:=true;
              infokulka.Visible:=true;
              infomail.Visible:=true;
              infowww.Visible:=true;
              infotext.Caption:='Program napisany w Delphi 7 Personal'+#13#10#13#10+'Program udostêpniony jako Freeware.'+#13#10+'Autor nie bierze odpowiedzialnoœci za ewentualne szkody powsta³e w skutek jego dzia³ania.';
              infotext.Visible:=True;
            end;
    toWyjscie: begin
                 okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                 okno2ok.Visible:=True;
                 okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                 okno2anuluj.Visible:=True;
                 okno2.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko2');
                 okno2.Visible:=True;
                 okno2caption.Caption:='Potwierdzenie';
                 okno2caption.Visible:=True;
                 okno2tekst.Caption:='Zamkn¹æ grê KulkiEx?';
                 okno2p1.Visible:=True;
               end;
    toKoniecGry:  begin
                     okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKL');
                     okno2ok.Visible:=True;
                     okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANL');
                     okno2anuluj.Visible:=True;
                     okno2.Picture.Bitmap.LoadFromResourceName(hInstance, 'okienko2');
                     okno2.Visible:=True;
                     okno2caption.Caption:='Potwierdzenie';
                     okno2caption.Visible:=True;
                     okno2tekst.Caption:='Koniec gry. Chcesz zagraæ jeszcze raz?';
                     okno2p1.Visible:=True;;
                  end;
  end;
end;

procedure TForm1.Pauza(p: Boolean);
var x: Byte;
    war: Boolean;
begin
  if p then
  begin
    pauza_tab[1]:=PokazNowe.Enabled;
    pauza_tab[2]:=Podskoki.Enabled;
    pauza_tab[3]:=Ruch.Enabled;
    pauza_tab[4]:=UsunLinie.Enabled;
    pauza_tab[5]:=PokazNastepne.Enabled;
    PokazNowe.Enabled:=False;
    Podskoki.Enabled:=False;
    Ruch.Enabled:=False;
    UsunLinie.Enabled:=False;
    PokazNastepne.Enabled:=False;
    for x:=2 to 12 do
      TImage(FindComponent('Image'+IntToStr(x))).Enabled:=False;
    Plansza.Enabled:=False;
  end else
  begin
    if gra.koniec=false then
    begin
      PokazNowe.Enabled:=pauza_tab[1];
      Podskoki.Enabled:=pauza_tab[2];
      Ruch.Enabled:=pauza_tab[3];
      UsunLinie.Enabled:=pauza_tab[4];
      PokazNastepne.Enabled:=pauza_tab[5];
      war := CzyGraAktywna;
      if war then
        Plansza.Enabled:=True;
    end;
    for x:=2 to 12 do
      TImage(FindComponent('Image'+IntToStr(x))).Enabled:=True;
  end;
end;

procedure TForm1.okno2okMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKD');
end;

procedure TForm1.okno2okMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  okno2ok.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
end;

procedure TForm1.okno2anulujMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'AND');
end;

procedure TForm1.okno2anulujMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  okno2anuluj.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANE');
end;

procedure TForm1.Okno2P1klik;
begin
  okno2ok.Visible:=False;
  okno2anuluj.Visible:=False;
  okno2.Visible:=False;
  okno2caption.Visible:=False;
  okno2p1.Visible:=False;
end;

procedure TForm1.okno2anulujClick(Sender: TObject);
var x: Byte;
begin
  GrajDzwiek('klik');
  case okno of
    toNowaGra: begin
                 Okno2P1klik;
                 Pauza(False);
               end;
    toWyjscie: begin
                 Okno2P1klik;
                 Pauza(False);
               end;
    toKasujRekordy: begin
                      Okno2P1klik;
                      ScoreDelete.Enabled:=True;
                      ScoreOK.Enabled:=True;
                      okno:=toRekordy;
                    end;
    toKoniecGry: begin
                    Okno2P1klik;
                    for x:=2 to 12 do
                      TImage(FindComponent('Image'+IntToStr(x))).Enabled:=True;
                 end;
  end;
end;

procedure TForm1.okno2okClick(Sender: TObject);
var x: Byte;
    tmp: string;
begin
  GrajDzwiek('klik');
  case okno of
    toNowaGra: begin
                 Okno2P1klik;
                 NowaGra;
               end;
    toWyjscie: begin
                 ZapiszWyniki;    
                 Application.Terminate;
               end;
    toKasujRekordy: begin
                      KasujWyniki;
                      ZapiszWyniki;
                      ScoreList.Caption := '';
                      ScorePoints.Caption := '';
                      for x:=0 to 9 do
                      begin
                        if x < 9 then tmp := '0' else tmp := '';
                        ScoreList.Caption := ScoreList.Caption + tmp + IntToStr(x+1) + '. ' + wyniki_arr[x,0];
                        ScorePoints.Caption := ScorePoints.Caption + wyniki_arr[x,1];
                        if x < 9 then
                        begin
                          ScoreList.Caption := ScoreList.Caption + #13#10;
                          ScorePoints.Caption := ScorePoints.Caption + #13#10;
                        end;
                      end;
                      Okno2P1klik;
                      ScoreDelete.Enabled:=True;
                      ScoreOK.Enabled:=True;
                      okno:=toRekordy;
                    end;
      toKoniecGry: begin
                     Okno2P1klik;
                     for x:=2 to 12 do
                        TImage(FindComponent('Image'+IntToStr(x))).Enabled:=True;
                     NowaGra;
                   end;
  end;
end;

procedure TForm1.InfoClose;
begin
  okno1.Visible:=False;
  oknocaption.Visible:=False;
  infook.Visible:=False;
  infotext.Visible:=False;
  infoappname.Visible:=False;
  infocopy.Visible:=False;
  infokulka.Visible:=False;
  infomail.Visible:=False;
  infowww.Visible:=False;
end;

procedure TForm1.infookClick(Sender: TObject);
begin
  GrajDzwiek('klik');
  InfoClose;
  Pauza(False);
end;

procedure TForm1.infookMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  infook.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKD');
end;

procedure TForm1.infookMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  infook.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
end;

procedure TForm1.InfoMailClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open','mailto:pinio@icpnet.pl', '', '', sw_Normal);
end;

procedure TForm1.InfowwwClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.pinio.user.icpnet.pl', '', '', sw_Normal);
end;

procedure TForm1.ScoreOKClick(Sender: TObject);
begin
  GrajDzwiek('klik');
  okno1.Visible:=False;
  oknocaption.Visible:=False;
  ScoreOK.Visible:=False;
  ScoreDelete.Visible:=False;
  ScoreList.Visible:=False;
  ScorePoints.Visible:=False;
  ScoreDelete.Hint := '';
  if Gra.nowyrekord = True then
  begin
    Gra.nowyrekord := False;
    okno := toKoniecGry;
    PokazOkno;
  end else
    Pauza(False);
end;

procedure TForm1.ScoreDeleteMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ScoreDelete.Picture.Bitmap.LoadFromResourceName(hInstance, 'AND');
end;

procedure TForm1.ScoreOKMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKD');
end;

procedure TForm1.ScoreDeleteMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ScoreDelete.Picture.Bitmap.LoadFromResourceName(hInstance, 'ANE');
end;

procedure TForm1.ScoreOKMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
end;

procedure TForm1.WczytajWyniki;
var s: TStringList;
    x: Byte;
begin
  if FileExists(ExtractFilePath(Application.ExeName)+'wyniki.dat') then
  begin
     s:=TStringList.Create;
    s.LoadFromFile(ExtractFilePath(Application.ExeName)+'wyniki.dat');
    s.Text:=StringXor(s.Text, 183);
    for x:=0 to 9 do
    begin
      s.Strings[x]:=trim(s.Strings[x]);
      wyniki_arr[x,0]:=Copy(s.Strings[x], 1, Pos(';', s.Strings[x])-1);
      wyniki_arr[x,1]:=Copy(s.Strings[x], Pos(';', s.Strings[x])+1, Length(s.Strings[x])-Pos(';', s.Strings[x]));
    end;
    s.Free;
  end else
  begin
    KasujWyniki;
    ZapiszWyniki;
  end
end;

procedure TForm1.ZapiszWyniki;
var s: TStringList;
    x: Byte;
begin
  s:=TStringList.Create;
  for x:=0 to 9 do
    s.Add(wyniki_arr[x,0]+';'+wyniki_arr[x,1]);
  s.Text:=StringXOR(s.Text, 183);
  s.SaveToFile(ExtractFilePath(Application.ExeName)+'wyniki.dat');
  s.Free;
end;

procedure TForm1.KasujWyniki;
var x: byte;
begin
   for x:=0 to 9 do
    begin
      wyniki_arr[x,0]:='Piniol';
      wyniki_arr[x,1]:= IntToStr(100 - (x * 10));
    end;
    ZapiszWyniki;
end;

procedure TForm1.ScoreDeleteClick(Sender: TObject);
begin
  GrajDzwiek('klik');
  okno:=toKasujRekordy;
  PokazOkno;
end;

procedure TForm1.GrajDzwiek(s: PAnsiChar);
begin
  if Gra.dzwiek then
  try
    PlaySound(s, HInstance, SND_ASYNC+SND_NOWAIT+SND_RESOURCE);
  except
  end;
end;

procedure TForm1.NewScoreOKMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
NewScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKD');
end;

procedure TForm1.NewScoreOKMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
NewScoreOK.Picture.Bitmap.LoadFromResourceName(hInstance, 'OKE');
end;

procedure TForm1.NewScoreOKClick(Sender: TObject);
var i, z, idx: Byte;
begin
  idx := 0;
  for i:=0 to 9 do
  begin
    if Gra.punkty >= StrToInt(wyniki_arr[i,1]) then
    begin
      idx := i;
      break;
    end;
  end;
  for z:=9 downto idx do
  begin
    wyniki_arr[z,0] := wyniki_arr[z-1,0];
    wyniki_arr[z,1] := wyniki_arr[z-1,1];
  end;
  wyniki_arr[idx,0] := NewScoreEdit.Text;
  wyniki_arr[idx,1] := IntToStr(Gra.punkty);
  ZapiszWyniki;
  NewScoreOK.Visible:=False;
  okno2.Visible:=False;
  okno2caption.Visible:=False;
  NewScoreText.Visible:=False;
  NewScoreEdit.Visible:=False;
  okno := toRekordy;
  PokazOkno;
end;

end.
