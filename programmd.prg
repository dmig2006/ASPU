SET EXCLUSIVE OFF
SET DATE TO DMY
SET SAFETY OFF
SET EXACT ON
SET TALK OFF
SET NOTIFY OFF 
SET RESOURCE OFF
IF  !File('assa.exe')
* установим текущий каталог
	cCurrentProcedure = Sys(16,1)
	nPathStart = At(":",cCurrentProcedure)- 1
	nLenOfPath = Rat("\", cCurrentProcedure) - (nPathStart)
	Set Default To (Substr(cCurrentProcedure, nPathStart, nLenOfPath))
ENDIF 
set path to ('Palm\')
_Screen.WindowState = 2
*!*	_Screen.Icon ="ярлык\icon1.ICO"

  iif(file(GetTablePath('table1.dbf')),FileKod('table1.dbf'),messagebox("Нет файла table1.dbf!"))
  iif(file(GetTablePath('table3.dbf')),FileKod('table3.dbf'),messagebox("Нет файла table3.dbf!"))  
* запустим фоновый рисунок
DO FORM fon

* Переменная для хранения права доступа admin=администратор, user=пользователь, ''=вход в систему не произведен 
Public slogin as String 

* Переменные для хранения Nick_name, passwords, звания и ФИО вошедшего пользователя
PUBLIC Nick, Passwds, zvan, name_fio

* Запрос пароля (запуск формы идентификации пользователя)
Do Form pass_in To slogin

IF LEN(slogin) <> 0
* Вход в систему произведен удачно
    CLOSE TABLES ALL 
	Use mzip1!inf_det
	SELECT inf_det
	
	* Ищем записи, в которых имеющееся количество деталей меньше минимально необходимого или =0
	* и эти детали отмечены для вывода на экран 

	LOCATE  FOR  (kolich<=ostat) AND (fl_treb=.t.)
	IF FOUND()
		* Записи найдены (количество меньше и flag_treb=true)
		Set Filter To kolich<=ostat  And fl_treb = .T.
		nParam = 0
		* Параметр 0, когда есть записи  с количеством меньшим и flag_treb=true
		Do Form form_view WITH nParam TO nP
	ELSE
		GO TOP 
       	LOCATE  FOR  kolich<=ostat
		* найдены детали, которые необходимо пополнить, но они не помечены к выводу на экран	
		IF FOUND()

*		    * Flag_treb=false, но количество меньше	
		    ttl = 'Warning!'
			txt = 'Некоторые из элементов требуют пополнения, ';
			+ Chr(13) + 'но не отмечены как необходимые к выводу на экран.';
			+ Chr(13) + 'Желаете просмотреть?'
			nanswer = Messagebox(txt, 36, ttl)
			IF  nanswer = 6
				Set Filter To kolich<=ostat 
				nParam = 1			
*				* Параметр 1, когда есть записи  с количеством меньшим, но все flag_treb=false
				Do Form form_view WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
    
    *проверка по сроку годности
    
	LOCATE  FOR  (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
	IF FOUND()
		* Записи найдены (просрочены и fl_srok=true)
		Set Filter To (inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)) AND fl_srok=.T.
		nParam = 0
		* Параметр 0, когда есть записи  с количеством меньшим и flag_treb=true
		Do Form form_view_data WITH nParam TO nP
	ELSE
		GO TOP 
       	LOCATE  FOR  inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
		* найдены детали, которые необходимо заменить, но они не помечены к выводу на экран	
		IF FOUND()

*		    * Fl_srok=false, но просрочены	
		    ttl = 'Warning!'
			txt = 'Некоторые из элементов требуют замены, ';
			+ Chr(13) + 'но не отмечены как необходимые к выводу на экран.';
			+ Chr(13) + 'Желаете просмотреть?'
			nanswer = Messagebox(txt, 36, ttl)
			IF  nanswer = 6
				Set Filter To inf_det.srok_god < ((MONTH(DATE())-MONTH(inf_det.data_izg))+(year(DATE())-year(inf_det.data_izg))*12)
				nParam = 1			
*				* Параметр 1, когда есть записи  с количеством меньшим, но все flag_treb=false
				Do Form form_view_data WITH nParam TO nP
			ENDIF 
		ENDIF 
    ENDIF 
        
    CLOSE TABLES all 
    DO FORM main 

ELSE 

    ttl = 'Сообщение!'
	txt = 'До свидания!'
	nanswer = Messagebox(txt, 32, ttl)
	
ENDIF 

CLOSE TABLES all
fon.release

function FileKod()  && Проставляет кодовую страницу
lParam cFile
local PathFile, nFile
PathFile=GetTablePath(cFile)
nFile=substr(cfile,2,len(cfile)-1)
use &PathFile in 0
if cpdbf()=0 &&Возвращает кодовую страницу, к помечена открытая таблица(0, если таблица в указанной области не открыта)
   use
   cpzero((PathFile), 866) && удаляет метку кодовой страницы
else
   use
endif   

FUNCTION GetTablePath()&& считывает файл путей pathPTN.dbf
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

