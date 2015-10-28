// ���� 3�̃p�X�����g���̊��ɍ��킹�ď��������Ă��������B

// ruby.exe �̏ꏊ
var envPath = "C:\\ruby\\bin\\ruby.exe";

// �T�N���G�f�B�^�̃}�N����u���Ă���t�H���_
var macroDir = "C:\\apps\\sakuraW_rXXXX\\macros\\";

// anbt-sql-formatter �̃t�H���_
var asfHome = "C:\\apps\\anbt-sql-formatter\\";


//================================


function checkPath( path ){
  if( ! path.match( /\\$/ ) ){
    path += "\\";
  }
  
  return path;
}

macroDir = checkPath( macroDir );
asfHome  = checkPath( asfHome );


//================================


var scriptPath   = asfHome + "bin\\anbt-sql-formatter";
var libDir       = asfHome + "lib";

var macroPath    = macroDir + "anbt-sql-formatter-for-sakura-editor.js";
var tempFileSrc  = macroDir + "____temp_src.txt";
var tempFileDest = macroDir + "____temp_dest.txt";

var timeoutSec   = 10;


//================================


var ForReading = 1;
var ForWriting = 2;

var wShell = new ActiveXObject( "WScript.Shell" );


//================================


function pathExists( varName, type ){
  var path = eval(varName);
  var fso = new ActiveXObject( "Scripting.FileSystemObject" );
  var typeMsg;
  var result = true;

  switch(type){
  case "file":
    typeMsg = "�t�@�C��";
    if( ! fso.FileExists( path ) ){
      result = false;
    }
    break;
  case "folder":
    typeMsg = "�t�H���_";
    if( ! fso.FolderExists( path ) ){
      result = false;
    }
    break;
  default:
    wShell.Popup( "�ϐ� type �̎w�肪�Ԉ���Ă��܂��B" );
    return;
  }

  if( ! result ){
    wShell.Popup( typeMsg + ' "' + path + "\" ��������܂���B\n�ϐ� " + varName + " �̃p�X�w����m�F���Ă��������B" );
    return false;
  }else{
    return true;
  }
}


//================================


function writeFile( path, content ){
  var fso = new ActiveXObject( "Scripting.FileSystemObject" );
  var fout = fso.CreateTextFile( path );
  fout.WriteLine( content );
  fout.Close();
}


function readFile( path ){
  var fso = new ActiveXObject( "Scripting.FileSystemObject" ); 
  var fout = fso.OpenTextFile( path, ForReading ); 
  var content = fout.ReadAll();
  fout.Close(); 
  return content;
}


//================================


function callFromSakuraEditor(){
  if(    ! pathExists( "envPath" , "file" )
      || ! pathExists( "macroDir", "folder" )
      || ! pathExists( "asfHome" , "folder" )
  ){
    return;
  }

  var selectedStr = GetSelectedString(0);
  var fso = new ActiveXObject( "Scripting.FileSystemObject" );
  if( fso.FileExists( tempFileSrc  ) ){ fso.GetFile( tempFileSrc  ).Delete(); }
  if( fso.FileExists( tempFileDest ) ){ fso.GetFile( tempFileDest ).Delete(); }

  writeFile( tempFileSrc, selectedStr );

  var commandStr = 'cscript "' + macroPath + '"';
  var vbHide = 0; //�E�B���h�E���\��
  wShell.Run( commandStr, vbHide, true );

  insText( readFile( tempFileDest ) );

  if( fso.FileExists( tempFileSrc  ) ){ fso.GetFile( tempFileSrc  ).Delete(); }
  if( fso.FileExists( tempFileDest ) ){ fso.GetFile( tempFileDest ).Delete(); }
}


function callFromCScript(){
  var commandStr = 'cmd /c  ' + envPath + ' -I ' + libDir + ' "' + scriptPath +'"  "'+ tempFileSrc + '"' ;
  var execObj = wShell.Exec( commandStr );

  // �������I�����邩�A�܂��̓^�C���A�E�g����܂ő҂�
  var startSec = (new Date()).getTime();
  while( execObj.status == 0){
    WScript.Sleep( 500 );
    if( (new Date()).getTime() - startSec > timeoutSec ){ break; }
  }

  var result;
  if( execObj.exitCode == 0){
    result = execObj.StdOut.ReadAll();
  }else{
    result = execObj.StdErr.ReadAll();
  }
  writeFile( tempFileDest, result );
}


//================================


if( typeof(Editor) != "undefined" ){
  callFromSakuraEditor();
}else if( typeof(WScript) != "undefined" ){
  callFromCScript();
}else{
  wShell.Popup( "�Ăяo�������킩��܂���B" );
}
