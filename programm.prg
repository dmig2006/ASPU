public d, pic, lcPath, Langv
local gnFile, test 
SET DATE GERMAN 
SET DELETED ON
SET EXCLUSIVE OFF
SET DATE TO DMY
SET SAFETY Off
SET EXACT ON
SET TALK OFF
SET NOTIFY OFF 
SET RESOURCE OFF
SET AUTOSAVE ON
SET SYSMENU OFF


lcSys16 = SYS(16)
lcPath = substr(lcSys16,1,RAT("\", lcSys16))
	*messagebox("lcPath="+lcPath)
	
*����������� msgcmn()
#include "include\inc_main_bas.h"
CD(lcPath)
SET PATH TO PROGRAM
SET PROCEDURE TO prg_msg_cmn, prg_utility_bas 	
PUBLIC _gaMsgButton
	
	
IF !file(lcPath + "flangvi.txt")
     gnFile = FCREATE(lcPath + 'flangvi.txt') 
     FPUTS(gnFile, 'F')
     FCLOSE(gnFile )
     Langv  = 'F'
ELSE
     gnFile = FOPEN(lcPath + 'flangvi.txt',10)  && If so, open read
     IF gnFile <= 0  && Is file empty?
*!*		    WAIT WINDOW 'This file is empty!' NOWAIT
	    Langv  = 'F'
     ELSE  && If not
	   Langv  = alltrim(FGETS(gnFile))  && Store contents
     ENDIF
     FCLOSE(gnFile )
ENDIF
*!*	lcPath = iif(AT(":", lcSys16)!=0, SUBSTR(lcSys16, AT(":", lcSys16) - 1), substr(lcSys16,1,RAT("\", lcSys16)))
*!*	messagebox("lcSys16 ="+lcSys16)
*!*	messagebox("lcPath ="+lcPath )
set default to (lcPath)
set path to palm, icons, picture
* ���� �� ���� �����
_Screen.WindowState = 2 
_Screen.Icon ="icons\Fr_Last.ico"
_screen.Visible = .T.
_Screen.Caption = "SGA"
*!*	_Screen.Caption = iif(Langv ='R', "������������������ ������� ������  �  ����� ��������� ���������� ��������� ���", ;
*!*	                                   upper("Systeme de gestion des composants du Lot OR collectif automatise"))
Close DataBases
DO FORM fon
CLOSE TABLES
close DATABASE
*!*	if !testdate('passwords.dbf','passwords.cdx')
*!*		indexed('passwords',1)
*!*	endif
*******************************
*!*	if file(lcPath + "passwords.cdx")
*!*	*!*	   if !testdate(lcPath + 'passwords.dbf',lcPath + 'passwords.cdx')
*!*	*!*		   indexed('passwords',5)	
*!*	*!*	   endif
*!*	else
*!*	       indexed('passwords',5)	
*!*	endif
*!*	if !testdate('naklad_inp.dbf','naklad_inp.cdx')
*!*		indexed('naklad_inp',5)
*!*	endif
*******************************
if file(lcPath + "inf_det.cdx")
*!*	   if !testdate(lcPath + 'inf_det.dbf',lcPath + 'inf_det.cdx')
*!*		   indexed('inf_det',5)	
*!*	   endif
else
   indexed('inf_det',5)	
endif
*******************************
*!*	if !testdate('inf_det_reviz.dbf','inf_det_reviz.cdx') or !file("inf_det_reviz.cdx")
*!*		indexed('inf_det_reviz',1)
*!*	endif
if file(lcPath + "inf_det_reviz.cdx")
*!*	   if !testdate(lcPath + 'inf_det_reviz.dbf',lcPath + 'inf_det_reviz.cdx')
*!*		   indexed('inf_det_reviz',5)	
*!*	   endif
else
       indexed('inf_det_reviz',5)	
endif
*******************************
*!*	if !testdate('info_list1.dbf','info_list1.cdx')
*!*		indexed('info_list1',1)
*!*	endif
if file(lcPath + "info_list1.cdx")
*!*	   if !testdate(lcPath + 'info_list1.dbf',lcPath + 'info_list1.cdx')
*!*	       indexed('info_list1',5)
*!*	   endif
else
       indexed('info_list1',5)
endif
*******************************
*!*	if !testdate('naklad_out.dbf','naklad_out.cdx')
*!*		indexed('naklad_out',1)
*!*	endif
if file(lcPath + "naklad_out.cdx")
*!*	   if !testdate(lcPath + 'naklad_out.dbf',lcPath + 'naklad_out.cdx')
*!*		   indexed('naklad_out',5)	
*!*	   endif
else
       indexed('naklad_out',5)	
endif
*******************************
*!*	if !testdate('naklad_out.dbf','naklad_out.cdx')
*!*		indexed('naklad_out',1)
*!*	endif
if file(lcPath + "naklad_inp.cdx")
*!*	   if !testdate(lcPath + 'naklad_out.dbf',lcPath + 'naklad_out.cdx')
*!*		   indexed('naklad_out',5)	
*!*	   endif
else
       indexed('naklad_inp',5)	
endif
*******************************
*!*	if !testdate('inp.dbf','inp.cdx')
*!*		indexed('inp',1)
*!*	endif
if file(lcPath + "inp.cdx")
*!*	   if !testdate(lcPath + 'inp.dbf',lcPath + 'inp.cdx')
*!*		   indexed('inp',5)	
*!*	   endif
else
       indexed('inp',5)	
endif
*******************************
*!*	if !testdate('out.dbf','out.cdx') or !file("out.cdx")
*!*		indexed('out',1)
*!*	endif
if file(lcPath + "out.cdx")
*!*	   if !testdate(lcPath + 'out.dbf',lcPath + 'out.cdx')
*!*		   indexed('out',5)	
*!*	   endif
else
       indexed('out',5)	
endif
*******************************
use kodpan in 0 EXCLUSIVE
select kodpan
pack
use in kodpan
*******************************
* ���������� ��� �������� ����� ������� admin=�������������, user=������������, ''=���� � ������� �� ���������� 
Public slogin as String 
* ���������� ��� �������� Nick_name, passwords, ������ � ��� ��������� ������������
PUBLIC Nick, Passwds, zvan, name_fio
*!*	use 'passwords.dbf' in 0 
* ������ ������ (������ ����� ������������� ������������)
Do Form pass_in To slogin
IF LEN(slogin) <> 0
* ���� � ������� ���������� ������
    CLOSE TABLES ALL 
    use 'inf_det' in 0 
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
*!*	       	LOCATE  FOR  kolich<=ostat
       	LOCATE  FOR  kolich = 0
		* ������� ������, ������� ���������� ���������, �� ��� �� �������� � ������ �� �����	
		IF FOUND()
       	    * Flag_treb=false, �� ���������� ������
       	    if Langv = "R"
       	    	nanswer = msgcmn('��������� �� ��������� ������� ����������, ' +CR+ ;
			                        '�� �� �������� ��� ����������� � ������ �� �����.' +CR+ ;
			                        '������� �����������?','��;���',,'��������',,,,,'N')       	    
			*   nanswer = Messagebox('��������� �� ��������� ������� ����������, ' + Chr(13) + ;
			                       '�� �� �������� ��� ����������� � ������ �� �����.' + Chr(13) + ;
			                       '������� �����������?', 36, "��������")
			ELSE
				nanswer = msgcmn(upper("Certains composants necessitent le restockage,") + Chr(13) + ;
			                        upper("mais sont pas coches pour l")+"'"+upper("affichage sur l")+"'"+upper("ecran.") + Chr(13) + ;
			                        upper("Voulez-vous les voir ?"),'Oui;No',,'ATTENTION',,,,,'N')  			
			*   nanswer = Messagebox(upper("Certains composants necessitent le restockage,") + Chr(13) + ;
			                        upper("mais sont pas coches pour l")+"'"+upper("affichage sur l")+"'"+upper("ecran.") + Chr(13) + ;
			                        upper("Voulez-vous les voir ?"), 36, "ATTENTION")
			endif
			IF  nanswer = 1 
*!*					Set Filter To kolich<=ostat 
				Set Filter To kolich = 0 
				nParam = 1			
*				* �������� 1, ����� ���� ������  � ����������� �������, �� ��� flag_treb=false
				Do Form form_view WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
    *�������� �� ����� ��������
    select inf_det
*!*		LOCATE  FOR  (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
	LOCATE  FOR date() >= GOMONTH(inf_det.data_izg, inf_det.srok_god) AND fl_srok=.T. and kolich > 0
	IF FOUND()
		* ������ ������� (���������� � fl_srok=true)
*!*			Set Filter To (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
		Set Filter To (date() >= GOMONTH(inf_det.data_izg, inf_det.srok_god)) AND fl_srok=.T. and inf_det.kolich >0
		nParam = 0
		* �������� 0, ����� ���� ������  � ����������� ������� � flag_treb=true
		Do Form form_view_data WITH nParam TO nP
	ELSE
		GO TOP 
*!*	       	LOCATE  FOR  inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
       	LOCATE  FOR date() >= GOMONTH(inf_det.data_izg, inf_det.srok_god) and inf_det.kolich >0
		* ������� ������, ������� ���������� ��������, �� ��� �� �������� � ������ �� �����	
		IF FOUND()
*		    * Fl_srok=false, �� ����������	
       	    if Langv = "R"
       	    	nanswer = msgcmn('��������� �� ��������� ������� ������, ' +CR+ ;
			                        '�� �� �������� ��� ����������� � ������ �� �����.' +CR+ ;
			                        '������� �����������?','��;���',,'��������',,,,,'N')
			    *nanswer = Messagebox("��������� �� ��������� ������� ������," + Chr(13) + ;
			                        "�� �� �������� ��� ����������� � ������ �� �����." + Chr(13) + ;
			                        "������� �����������?", 36, "��������")
       	    ELSE
				nanswer = msgcmn(upper("Quelques elements sont a remplacer mais ils ne sont pas") + Chr(13) + ;
			                        upper("selectionnes pour l")+"'"+upper("affichage sur l")+"'"+upper("ecran.") + Chr(13) + ;
			                        upper("Souhaitez-vous les voir ?"),'Oui;No',,'ATTENTION',,,,,'N')       	    
			*   nanswer = Messagebox(upper("Quelques elements sont a remplacer mais ils ne sont pas") + Chr(13) + ;
			                        upper("selectionnes pour l")+"'"+upper("affichage sur l")+"'"+upper("ecran.") + Chr(13) + ;
			                        upper("Souhaitez-vous les voir ?"), 36, "ATTENTION")
       	    endif
			IF  nanswer = 1
*!*					Set Filter To inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
				SET FILTER TO date() >= GOMONTH(inf_det.data_izg, inf_det.srok_god) and inf_det.kolich >0
				nParam = 1			
				* �������� 1, ����� ���� ������  � ����������� �������, �� ��� flag_treb=false
				Do Form form_view_data WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
    use in 'inf_det'
    if used('passwords')
       use in passwords
    endif
*!*	    CLOSE TABLES all
    CLOSE TABLES
    close DATABASE
    DO FORM main
*!*	ELSE
*!*		Messagebox('�� ��������.', 64, '���������')
ENDIF
CLOSE TABLES all
fon.release

function ErrorHandle
  MessageBox(Message(), 0 + 16)
  return .F.
endfunc

FUNCTION indexed()
lparam nfile,mode
set safety off
local cErr,oldError
if mode <>5
	WAIT iif(Langv = "R", ("����� ���� ���������� ����� " + nfile + "!"), ;
	                      ("Veuillez patienter, l")+"'"+upper("indexage du fichier est en cours " + nfile + "!")) WINDOW NOWAIT
endif 	
    oldError = ON('Error')
    On Error cErr = .T.
	do case
		case nFile = "inf_det"
			use (lcPath + "inf_det.dbf")       in 0 alias f00 exclusive
		case nFile = "inf_det_reviz"
			use (lcPath + "inf_det_reviz.dbf") in 0 alias f00 exclusive
		case nFile = "info_list1"
			use (lcPath + "info_list1.dbf")    in 0 alias f00 exclusive
		case nFile = "out"
			use (lcPath + "out.dbf")           in 0 alias f00 exclusive
		case nFile = "inp"
			use (lcPath + "inp.dbf")           in 0 alias f00 exclusive
		case nFile = "naklad_out"
			use (lcPath + "naklad_out.dbf")    in 0 alias f00 exclusive
		case nFile = "naklad_inp"
			use (lcPath + "naklad_inp.dbf")    in 0 alias f00 exclusive
	endcase
    If cErr 
      wait clear
      iif(Langv = "R", Messagebox(upper("���������� ������� ���� ") + nfile + upper(" �����������!"), 64, "���������"), ;
                       Messagebox(upper("Il n")+"'"+upper("est pas possible d")+"'"+upper("ouvrir le fichier ") + nfile + upper(" en mode exclusif!"), 64, "MESSAGE"))
      Use in f00
      return
    EndIf
    On Error &oldError
    select f00
	DELETE TAG ALL
	do case
		case nFile = "inf_det"
		    pack
			INDEX ON kod TAG kod
		case nFile = "inf_det_reviz"			
		    pack
			INDEX ON kod TAG kod
		case nFile = "info_list1"			
		    pack
			INDEX ON cod TAG cod
		case nFile = "naklad_out"
		    pack
			INDEX ON kod_nakl TAG kod_nakl
		case nFile = "inp"
		    pack
			INDEX ON kod_nakl TAG kod_nakl ADDITIVE
			INDEX ON kod TAG kod ADDITIVE
		case nFile = "out"
		    pack
			INDEX ON kod_nakl TAG kod_nakl ADDITIVE
			index on kod tag kod ADDITIVE
		case nFile = "naklad_inp"
		    pack
			INDEX ON kod_nakl TAG kod_nakl ADDITIVE
*!*				ALTER TABLE naklad_inp ADD PRIMARY KEY kod_nakl TAG kod_nakl
		endcase
*!*			case nFile = "passwords"
*!*				ALTER TABLE passwords ADD PRIMARY KEY nick_name+passwords TAG nick_name
	use in f00
	wait clear
	if mode=1
		iif(Langv = "R", messagebox(upper("�������������� ����� ") + nfile + upper(" ���������!"), 64, "���������"), ;
		                 messagebox(upper("Indexage du fichier ") + nfile + upper(" termine!"), 64, upper("Message")))
	endif
endfunc

*!*	function TestDate(cFile1, cFile2,cTag)
function TestDate(cFile1, cFile2,cTag)
local lRet, cPathFile1, cPathFile2
&& ������� ���������, ��� ����2 ������ (�������) ������� �����1
	lRet = .T.
	cPathFile1 = AllTrim(lcPath)+cFile1
	cPathFile2 = AllTrim(lcPath)+cFile2
	if File(cPathFile1) and File(cPathFile2)
		lRet = ctot(dtoc(fdate(cPathFile1))+' '+ftime(cPathFile1)) < ;
		ctot(dtoc(fdate(cPathFile2))+' '+ftime(cPathFile2))
	else
		lRet = .F.
	endif
return lRet
endfunc


 