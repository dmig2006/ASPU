SET EXCLUSIVE OFF
SET DATE TO DMY
SET SAFETY OFF
SET EXACT ON
SET TALK OFF
SET NOTIFY OFF 
SET RESOURCE OFF
IF  !File('assa.exe')
* ��������� ������� �������
	cCurrentProcedure = Sys(16,1)
	nPathStart = At(":",cCurrentProcedure)- 1
	nLenOfPath = Rat("\", cCurrentProcedure) - (nPathStart)
	Set Default To (Substr(cCurrentProcedure, nPathStart, nLenOfPath))
ENDIF 
set path to ('Palm\')
_Screen.WindowState = 2
*!*	_Screen.Icon ="�����\icon1.ICO"

  iif(file(GetTablePath('table1.dbf')),FileKod('table1.dbf'),messagebox("��� ����� table1.dbf!"))
  iif(file(GetTablePath('table3.dbf')),FileKod('table3.dbf'),messagebox("��� ����� table3.dbf!"))  
* �������� ������� �������
DO FORM fon

* ���������� ��� �������� ����� ������� admin=�������������, user=������������, ''=���� � ������� �� ���������� 
Public slogin as String 

* ���������� ��� �������� Nick_name, passwords, ������ � ��� ��������� ������������
PUBLIC Nick, Passwds, zvan, name_fio

* ������ ������ (������ ����� ������������� ������������)
Do Form pass_in To slogin

IF LEN(slogin) <> 0
* ���� � ������� ���������� ������
    CLOSE TABLES ALL 
	Use mzip1!inf_det
	SELECT inf_det
	
	* ���� ������, � ������� ��������� ���������� ������� ������ ���������� ������������ ��� =0
	* � ��� ������ �������� ��� ������ �� ����� 

	LOCATE  FOR  (kolich<=ostat) AND (fl_treb=.t.)
	IF FOUND()
		* ������ ������� (���������� ������ � flag_treb=true)
		Set Filter To kolich<=ostat  And fl_treb = .T.
		nParam = 0
		* �������� 0, ����� ���� ������  � ����������� ������� � flag_treb=true
		Do Form form_view WITH nParam TO nP
	ELSE
		GO TOP 
       	LOCATE  FOR  kolich<=ostat
		* ������� ������, ������� ���������� ���������, �� ��� �� �������� � ������ �� �����	
		IF FOUND()

*		    * Flag_treb=false, �� ���������� ������	
		    ttl = 'Warning!'
			txt = '��������� �� ��������� ������� ����������, ';
			+ Chr(13) + '�� �� �������� ��� ����������� � ������ �� �����.';
			+ Chr(13) + '������� �����������?'
			nanswer = Messagebox(txt, 36, ttl)
			IF  nanswer = 6
				Set Filter To kolich<=ostat 
				nParam = 1			
*				* �������� 1, ����� ���� ������  � ����������� �������, �� ��� flag_treb=false
				Do Form form_view WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
    
    *�������� �� ����� ��������
    
	LOCATE  FOR  (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
	IF FOUND()
		* ������ ������� (���������� � fl_srok=true)
		Set Filter To (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
		nParam = 0
		* �������� 0, ����� ���� ������  � ����������� ������� � flag_treb=true
		Do Form form_view_data WITH nParam TO nP
	ELSE
		GO TOP 
       	LOCATE  FOR  inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
		* ������� ������, ������� ���������� ��������, �� ��� �� �������� � ������ �� �����	
		IF FOUND()

*		    * Fl_srok=false, �� ����������	
		    ttl = 'Warning!'
			txt = '��������� �� ��������� ������� ������, ';
			+ Chr(13) + '�� �� �������� ��� ����������� � ������ �� �����.';
			+ Chr(13) + '������� �����������?'
			nanswer = Messagebox(txt, 36, ttl)
			IF  nanswer = 6
				Set Filter To inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
				nParam = 1			
*				* �������� 1, ����� ���� ������  � ����������� �������, �� ��� flag_treb=false
				Do Form form_view_data WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
        
    CLOSE TABLES all 
    DO FORM main 

ELSE 

    ttl = '���������!'
	txt = '�� ��������!'
	nanswer = Messagebox(txt, 32, ttl)
	
ENDIF 

CLOSE TABLES all
fon.release

function FileKod()  && ����������� ������� ��������
lParam cFile
local PathFile, nFile
PathFile=GetTablePath(cFile)
nFile=substr(cfile,2,len(cfile)-1)
use &PathFile in 0
if cpdbf()=0 &&���������� ������� ��������, � �������� �������� �������(0, ���� ������� � ��������� ������� �� �������)
   use
   cpzero((PathFile), 866) && ������� ����� ������� ��������
else
   use
endif   

FUNCTION GetTablePath()&& ��������� ���� ����� pathPTN.dbf
  lparam Tbl
  local aPath, CurArea, cStr
  if  !used('pathkpm')
	  use (pathes) in 0 alias 'pathkpm'
  endif
  CurArea = select()
  select('pathKPM')
*  cStr=iif(Tbl='f8058old.dbf'or Tbl='f8069old.dbf'or Tbl='dinamika.dbf',' and paths.note = sn','')
  cStr=iif(Tbl='dinamika.dbf',' and pathkpm.note = sn','')
  locate for upper(pathKPM.task) = RIGHT(m.task,LEN(m.task)-RAT("\",m.task)) and pathkpm.nameFile = Tbl &cStr
  if Found()
    aPath = AllTrim(pathkpm.pathFile)
    if Right(aPath, 1) != '\'
      aPath = aPath + '\'
    endif
    aPath = aPath + Tbl
  else
    aPath =Tbl
  endif
  use in ('pathkpm')
  select(CurArea)
  return aPath
ENDFUNC

