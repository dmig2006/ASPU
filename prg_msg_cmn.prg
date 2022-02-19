#INCLUDE "..\include\inc_main_bas.h"

PUBLIC  CR
CR	= CHR(13)
*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgButtonInitCmn()
*----------------------------------------------------------------------------------------
PROCEDURE MsgButtonInitCmn
*----------------------------------------------------------------------------------------
* Описание.......: Функция вызывается функцией MsgCmn() всегда если массив
*                  PUBLIC _gaMsgButton[] не определен.Текст стандартных кнопок.
*                  Их количество зависит от размерности массива.
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 09.07.2001
* Модификация....:
*----------------------------------------------------------------------------------------

PUBLIC _gaMsgButton
DECLARE _gaMsgButton[28]
	_gaMsgButton[1]  = 'Ok'
	_gaMsgButton[2]  = 'annulation'
	_gaMsgButton[3]  = "Oui"
	_gaMsgButton[4]  = "No"
	_gaMsgButton[5]  = 'appliquer'
	_gaMsgButton[6]  = 'annuler'
	_gaMsgButton[7]  = 'continuer'
	_gaMsgButton[8]  = 'abandonner'
	_gaMsgButton[9]  = 'effectuer'
	_gaMsgButton[10] = 'finir'
	_gaMsgButton[11] = 'repeter'
	_gaMsgButton[12] = 'ignorer'
	_gaMsgButton[13] = 'accepter'
	_gaMsgButton[14] = 'refuser'
	_gaMsgButton[15] = 'creer'
	_gaMsgButton[16] = 'supprimer'
	_gaMsgButton[17] = 'telecharger'
	_gaMsgButton[18] = 'sauvegarder'
	_gaMsgButton[19] = 'sortie'
	_gaMsgButton[20] = 'restaurer'
	_gaMsgButton[21] = 'ajouter'
	_gaMsgButton[22] = 'definir'
	_gaMsgButton[23] = 'remplacer'
	_gaMsgButton[24] = 'changer'
	_gaMsgButton[25] = 'arreter'
	_gaMsgButton[26] = 'transformer'
	_gaMsgButton[27] = 'clarifier'
	_gaMsgButton[28] = 'rafraichir'

ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgPrmDefaultCmn()
*----------------------------------------------------------------------------------------
PROCEDURE MsgPrmDefaultCmn()
*----------------------------------------------------------------------------------------
* Описание.......: Процедура объявляющая параметры по умолчанию
*                  для работы функции MsgCmn()
*                  Функция вызывается функцией MsgCmn() всегда если массив
*                  PUBLIC _gaMsgDefault[] не определен.
*                  Данный массив хранит параметры используемые функцией MsgCmn()
*                  в качестве параметров по умолчанию
*                  _gaMsgDefault[1] - шрифт сообщения
*			                    [2] - размер шрифта сообщения
*			                    [3] - стиль шрифта сообщения
*			                    [4] - икона для простого сообщения
*			                    [5] - икона для сообщения с кнопками
*			                    [6] - позиции табуляции
*			                    [7] - шрифт сообщения кнопок
*			                    [8] - размер шрифта сообщения кнопок
*			                    [9] - стиль шрифта сообщения кнопок
*			                   [10] - сделать кнопки одинаковой ширины в N пиксел
*			                   [11] - центрировать кнопки по отношению к ширине окна
*                              [12] - расстояние в пикселах между строками для указанного црифта
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей    09.07.2001
* Модификация....: Ганорский Дмитрий 06.07.2005 Убран 12 параметр - кнопка с троеточием
*                                               Изменен параметр 6 с 40.. на 30..
*                                               Изменен параметр 2 с 8 на 9
*				   Гринько Сергей    25.06.2006 Добавлен параметр 12
*----------------------------------------------------------------------------------------

PUBLIC _gaMsgDefault
DECLARE _gaMsgDefault[12]
* шрифт сообщения
_gaMsgDefault[1] = 'Arial Cyr'
* размер шрифта сообщения
_gaMsgDefault[2] = 9
* стиль шрифта сообщения
_gaMsgDefault[3] = 'N'
* икона для простого сообщения
_gaMsgDefault[4] = MSG_ICONCLOCK
* икона для сообщения с кнопками
_gaMsgDefault[5] = MSG_ICONQUESTION
* табуляции
_gaMsgDefault[6] = '30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,' + ;
	'510,540,570,600,630,660,690'
* шрифт сообщения кнопок
_gaMsgDefault[7] = 'Arial Cyr'
* размер шрифта сообщения кнопок
_gaMsgDefault[8] = 8
* стиль шрифта сообщения кнопок
_gaMsgDefault[9] = 'N'
* сделать кнопки одинаковой ширины в N пиксел
_gaMsgDefault[10] = 70
* центрировать кнопки по отношению к ширине окна
_gaMsgDefault[11] = .T.
* расcчитываем константу: расстояние между линиями в пикселах
_gaMsgDefault[12] = FONTMETRIC(6, _gaMsgDefault[1], _gaMsgDefault[2], _gaMsgDefault[3])

ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgCmn
*----------------------------------------------------------------------------------------
PROCEDURE MsgCmn
LPARAMETERS _lcString, _lcButton, _lcIcon, _lcCaption, _lnXCoord, _lnYCoord, ;
	_lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* Описание.......: Процедура предназначена для организации интерфейса с пользователем.
*                  Может выводить окошко с сообщением и небольшим изображением слева.
*                  Может быть выведено с разным количеством кнопок. При этом дальнейшее
*                  выполнение програм-мы приостанавливается пока пользователь не сделает
*                  какого-нибудь выбора. В этом случае возвращается номер нажатой кнопки
*                  (счёт слева - направо ). Текст может быть отображён различными
*                  цветами.В тексте допускаются символы <ENTER>,<TAB>, CHR(7).
*                  Функция использует в своей работе массивы _gaMsgWnd[*,2], в котором
*                  сохраняется уникальное имя окна [*,1] и ссылка типа "объект" на
*                  окно [*,2]. _gaMsgButton[*] хранит стандартные наименования для
*                  кнопок в ваших сообщениях. _gaMsgDefault[11]  - хранит параметры
*                  используемые данной функцией по умолчанию.
*                  Все параметры по умолчанию опредяются фунцией MsgPrmDefaultCmn().
* 	               шрифт сообщения					  - _gaMsgDefault[1]="Arial Cyr"
* 	               размер шрифта сообщения			  - _gaMsgDefault[2]=8
* 	               стиль шрифта сообщения			  - _gaMsgDefault[3]="N"
* 	               икона для простого сообщения		  - _gaMsgDefault[4]=MSG_ICONCLOCK
* 	               икона для сообщения с кнопками	  - _gaMsgDefault[5]=MSG_ICONQUESTION
* 	               табуляции в пикселах				  - _gaMsgDefault[6]="30,60,90,....."
* 	               шрифт сообщения кнопок			  - _gaMsgDefault[7]="Arial Cyr"
* 	               размер шрифта сообщения кнопок	  - _gaMsgDefault[8]=8
* 	               стиль шрифта сообщения кнопок			       - _gaMsgDefault[9]="N"
* 	               сделать кнопки одинаковой ширины в N пиксел. Значение ноль указывает
*                  на выравнивание ширин кнопок по длине текста.   - _gaMsgDefault[10]=90
* 	               центрировать кнопки по отношению к ширине окна  - _gaMsgDefault[11]=.T.
*----------------------------------------------------------------------------------------
* Параметры......:  _lcString - строка текста. Непосредственно в строке можно указывать
*                               каким цветом необходимо выводить далее текст.
*                               Это делается вставкой в строку следующего текста:
*                               '@B/G ' - начинается символом '@' и заканчивается
*                               пробелом, все между этими символами рассматривается как
*                               указание на цвет - до символа '/' цвет пера,после него
*                               - цвет фона. Если цвет пера и/или цвет фона равно  '-1',
*                               то это	указание на возврат к цветам по умолчанию.Цвет
*                               пера или фона может быть опущен - '@/W' '@R+/' '@R+'.
*                               Также цвет может быть указан в виде
*                               RGB(Rf,Gf,Bf, Rb,Gb,Bb), где первая тройка
*		                        чисел это указание на цвет пера, а следующая тройка чисел
*                               указание на цвет фона.В тексте допускаются символы
*                               табуляции и возврата каретки.
*                   _lcButton - указание для кнопок, номера из набора или текст если
*                               заданы кнопки то функция переходит в режим ожидания и ждет
*                               реакции пользователя. Возвращает номер нажатой кнопки,
*                               счет слева-направо.Окно после работы закрывается. Текст
*                               каждой кнопки отделяется ';'
*                               Примерный вид : 'Ok!;1;Отменить;' Кнопка может быть
*                               заблокирована если ее первым символом поставить "\" Далее
*                               могут идти следующие символы в любом порядке "@" - собака,
*                               "~" - тильда,символ @ делает кнопку активной,символ ~ делает
*                               кнопку срабатывающей по клавише ESC
*
*                               " " - пробел позволяет если нужно напечатать в наименовании
*                               кнопки цифру.Если Вам нужно воспользоваться этой возможностью,
*                               то учтите,что этот символ должен либо предварять служебные
*                               (@ ~), дибо находится после них.
*		                        То есть, возможны следующие варианты:
*			                    на первом месте если нужно должен стоять символ "\"
*                               далее могут идти в любом порядке служебные символы
*                               "@" - собака, "~" - тильда после них может стоять " " пробел,
*                               указывающий на необходимость отображения цифры в наименовании
*                               кнопки
*
*                   _lcIcon   - имя иконы с расширением '.bmp,*.ico'
*                  _lcCaption - если задан, то этот текст выводится в заголовке и при этом
*                              сообщение может быть перемещено по экрану
*                  _lnXCoord  - координата вывода по оси X
*                  _lnYCoord  - координата вывода по оси Y
*                  _lcFontName, _lnFontSize, _lcFontStyle  - Имя шрифта, размер, стиль
*
* Возвращает.....: Numeric
*	               Возможны три варианта поведения процедуры в зависимости от переданных
*                  параметров:
* 	               1.Параметры заданы, кроме текста кнопок.
*		             Функция возвращает индекс в массиве _gaMsgWnd[*,2] на описание окна.
*		             Самое последнее окно имеет самый  большой индекс.
*	               2.Есть текст для кнопок.
*		             Функция возвращает номер нажатой кнопки.
*                    Счёт кнопок слева - направо.
*	               3.Нет никаких параметров. Функция возвращает число ноль.
*                    (закрытие окна сообщений)
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей    09.07.2001
* Модификация....: Ганорский Дмитрий 06.07.2005 Функция переведена на вывод текста
*                                               посредством Label вместо устаревшего SAY,
*                                               в связи с не поддержкой последним тем XP.
*                                               Убрано все связанное с кнопкой "..."
*                                               Введена поддержка форм AS-TOP-LEVEL.
*                                               Переведен вывод окон с строк на пикселы
*                                               экрана.
*----------------------------------------------------------------------------------------
* в этих массивах хранятся некоторые настройки функции
EXTERNAL ARRAY _gaMsgDefault, _gaMsgButton

LOCAL _lnCntRowsText		&& кол-во строк текста
LOCAL _lnLenText			&& максимальная ширина текста в пикселах
LOCAL _lnHeightText			&& высота текста в пикселах
LOCAL _lnAtAmpersand		&& позиция начала указателя на цвет @ (амперсанд)
LOCAL _lnAtBlank			&& позиция завершения указания на цвет (пробел)
LOCAL _laRowsText			&& массив хранящий весь текст сообщения построчно
LOCAL _lnFX					&& размер по ширине буквы окна с сообщением
LOCAL _lnFY					&& размер по высоте буквы окна с сообщением
LOCAL _laColorDefault		&& массив цветов по умолчанию
LOCAL _llXCenter			&& признак центрирования по горизонтали
LOCAL _llYCenter			&& признак центрирования по вертикали
LOCAL _lnXCoord				&& признак центрирования по горизонтали
LOCAL _lnYCoord				&& признак центрирования по вертикали
LOCAL _lnCntTxtBut			&& количество кнопок
LOCAL _lnHeightStr			&& сколько всего предопределенных текстов кнопок
LOCAL _lcNameWind			&& имя окна
LOCAL _lcOldSch2			&& цветовая схема №2
LOCAL _lcOldPrinter			&& настройка принтера
LOCAL _lcOldConsole			&& настройка управления консолью
LOCAL _lcIdError		    && идентификатор обработчика ошибок
LOCAL _llCBDefault			&& цвет фона по умолчанию
LOCAL _llCFDefault			&& цвет пера по умолчанию
LOCAL _lnNumbButtDis		&& количество заблокированных кнопок до активной
LOCAL _lcButton				&& текст формируемых кнопок
LOCAL _lcButtonText			&& текст сформированных кнопок
LOCAL _llIsColor			&& признак наличия цветовых выделений в тексте
LOCAL _o					&& временная ссылка на объект
LOCAL _i, _j, _k			&& временные переменные
LOCAL _l, _m, _s			&& временные переменные
LOCAL _lnLine2Line			&& сохраненное значение из _gaMsgDefault[12] (для случая изменения црифта)
LOCAL _lnMainWindWidth		&& ширина
LOCAL _lnMainWindHeight     && высота главного окна Фокса
                            && или экрана в случае работы с формой
                            && AS-TOP-LEVEL
PRIVATE _pnButton			&& количество кнопок для вывода
PRIVATE _poWind				&& ссылка на окно с сообщением
PRIVATE _paButton			&& массив созданных кнопок выводимых в окне
PRIVATE _paMsgTab			&& массив табуляций

* есть ли входное сообщение
IF VARTYPE(_lcString) # 'C'
	* нет, сообщения нет
	_lcString = ''
ENDIF

* если сообщения нет
IF EMPTY(_lcString)
* закрыть предыдущее окно
	IF VARTYPE(_gaMsgWnd) = 'C'
		_i = ALEN(_gaMsgWnd, 1)
        * сохраняем ссылку на окно
		_o = _gaMsgWnd[_i, 2]
        * удаляем информацию об окне из массива
		IF _i > 1
			DECLARE _gaMsgWnd[_i - 1, 2]
		ELSE
			STORE .F. TO _gaMsgWnd[_i, 1], _gaMsgWnd[_i, 2]
		ENDIF
         * уничтожаем окно
		_o.RELEASE
	ENDIF
	RETURN 0 && уничтожено окно
ENDIF

IF VARTYPE(_gaMsgDefault) # 'C' ;
		OR ALEN(_gaMsgDefault) # 12
	* выполняем определение параметров по умолчанию
	MsgPrmDefaultCmn()
ENDIF

* обработка табуляций
IF AT(CHR(9), _lcString) > 0
    * есть табуляции в сообщении
    * инициализация по умолчанию
	_s = _gaMsgDefault[6]
	IF RIGHT(_s, 1) != ','
		_s = _s + ','
	ENDIF
	_i = OCCURS(',', _s)
	DECLARE _paMsgTab[_i]

    * выполняем трансляцию позиций табуляции заданных в виде строки
    * в одномерный массив с числами
    _l = 0			&& позиция предыдущей запятой
	FOR _j = 1 TO _i
		_m = AT(',', _s, _j)			&& позиция следующей запятой
		IF _m = 0
			EXIT						&& больше нечего обрабатывать
		ENDIF
		_k = SUBSTR(_s, _l+1, _m - _l - 1)	&& вырезаем => табуляцию
		_paMsgTab[_j] = VAL(_k)			&& заполняем наш массив с табуляциями
		_l = _m							&& теперь следующая запятая становится предыдущей
	ENDFOR
	DECLARE _paMsgTab[_j-1]
ENDIF

* Обработка кнопок
* пока кнопок нет
_pnButton = 0
IF VARTYPE(_lcButton) = 'C' ;
		AND !EMPTY(_lcButton)

	IF TYPE("_gaMsgButton[1]") # 'C'
        * иннициализация массива зарезервированных наименований кнопок
		MsgButtonInitCmn()
	ENDIF

    * выполняем нормализацию строки
	_lcButton = IIF(RIGHT(_lcButton, 1) == ';', _lcButton, ;
		_lcButton + ';')
    * определяем количество кнопок
	_pnButton = OCCURS(';', _lcButton)

    * выясняем есть ли тексты кнопок и сколько их
	_lnCntTxtBut = ALEN(_gaMsgButton)
	_lnCntTxtBut = IIF(_lnCntTxtBut = 1, IIF(EMPTY(_gaMsgButton[1]) ;
											 OR VARTYPE(_gaMsgButton[1]) # 'C', 0, 1);
										, _lnCntTxtBut)
ENDIF

* убираем все переводы строк
_lcString = CHRTRAN(_lcString, CHR(10), '')
* количество строк в сообщении
_lnCntRowsText = NfoMemLinesCmn(_lcString)
* здесь будем хранить строки сообщения
DECLARE _laRowsText[_lnCntRowsText]
_laRowsText = ''
* Икона по умолчанию ...
IF VARTYPE(_lcIcon) # 'C'
	IF _pnButton = 0
        * часы
		_lcIcon = _gaMsgDefault[4]
	ELSE
        * вопрос
		_lcIcon = _gaMsgDefault[5]
	ENDIF
ENDIF
_lcIcon = IIF(VARTYPE(_lcIcon) # 'C', '', _lcIcon)

* Фонт по умолчанию
IF VARTYPE(_lcFontName) # 'C'
	_lcFontName = _gaMsgDefault[1]
ENDIF

IF !EMPTY(_lcFontName)
	_lcFontName = STRTRAN(_lcFontName, ' Cyr', '', 1, 1, 1)
ENDIF

* Размер фонта  по умолчанию 8 пунктов
IF VARTYPE(_lnFontSize) # 'N'
	_lnFontSize = _gaMsgDefault[2]
ENDIF

* Стиль  по умолчанию Normal
IF VARTYPE(_lcFontStyle) # 'C'
	_lcFontStyle = _gaMsgDefault[3]
ENDIF

IF _gaMsgDefault[1] != _lcFontName	;
   OR _gaMsgDefault[2] = _lnFontSize ;
   OR _gaMsgDefault[3] = _lcFontStyle
   	* изменилось описание шрифта от значения по умолчанию
	* расcчитываем константу: расстояние между линиями в пикселах
	_lnLine2Line = _gaMsgDefault[12]
	_gaMsgDefault[12] = FONTMETRIC(6, _lcFontName, _lnFontSize, _lcFontStyle)
ENDIF

* Определяем размер текста в пикселах
* высота строки текста в пикселах
_lnLenText = 0
_k = NfoStrHeightCmn(_lcFontName, _lnFontSize, _lcFontStyle, .T.)
* небольшая эвристика
_lnHeightStr = IIF(_lnFontSize < 11, _k * 0.9, _k * 0.95)
* высота всех строк
_lnHeightText = _lnCntRowsText * _lnHeightStr

* определяем ширину всего текста

* нужно ли выдать звуковой сигнал?
IF AT(CHR(7), _lcString) > 0
    * убираем из строки все указания звук
	_lcString = CHRTRAN(_lcString, CHR(7), '')
    * выдаем звуковой сигнал
	?? CHR(7)
ENDIF

_l = 1					 && номер обрабатываемой строки
_j = _lcString			 && исходное сообщение для обработки

DO WHILE !EMPTY(_j)
    * готовим в _k текущую одну строку
	_i = AT(CHR(13), _j)
	_i = IIF(_i = 0, LEN(_j) + 1, _i)
	_k = LEFT(_j, _i - 1)
    * Запоминаем очередную строку текста
	_laRowsText[_l] = _k
    * убираем из строки все указания на переводы строки
	_k = CHRTRAN(_k, CHR(10), '')
    * сюда поместим строку без указания на цвет, чисто сам текст
	_s = ''
	DO WHILE AT('@', _k) > 0
        * еще есть указание на цвет
		_lnAtAmpersand = AT('@', _k)
		IF SUBSTR(_k, _lnAtAmpersand + 1, 1) = '@'
            * просто вывод символа '@'
			_s = _s + LEFT(_k, _lnAtAmpersand)
			_k = SUBSTR(_k, _lnAtAmpersand + 2)
			LOOP
		ELSE
			_llIsColor = .T.	&& есть указание на цвет
		ENDIF
		_s = _s + LEFT(_k, _lnAtAmpersand - 1)
		_k = SUBSTR(_k, _lnAtAmpersand + 1)
		_lnAtAmpersand = AT(' ', _k)
		_k = SUBSTR(_k, IIF(_lnAtAmpersand > 0, _lnAtAmpersand + 1, 1), LEN(_k))
	ENDDO
    * добавляем остаток строки
	_s = _s + _k
    * и вычисляем максимальную ширина текста
	_lnLenText = MAX(_lnLenText, ;
		NfoMsgStrWidthAdm(_s, _lcFontName, _lnFontSize, _lcFontStyle))
    * очередная порция сообщения для обработки
	_l = _l + 1
	_j = RIGHT(_j, LEN(_j) - _i)
ENDDO

* размеры экрана монитора или главного окна фокса
* в зависимости от видимости второго
IF _SCREEN.VISIBLE = .T.
	_lnMainWindWidth  = _SCREEN.WIDTH
	_lnMainWindHeight = _SCREEN.HEIGHT
ELSE
	_lnMainWindWidth  = SYSMETRIC(1)
	_lnMainWindHeight = SYSMETRIC(2)
ENDIF


* коррекция высчитанных размеров при необходимости
_lnLenText    = IIF(_lnLenText + 32 + 30 > _lnMainWindWidth, _lnMainWindWidth, ;
															 _lnLenText + 32 + 30)
_lnHeightText = IIF(_lnHeightText + 20 > _lnMainWindHeight, _lnMainWindHeight, ;
															_lnHeightText + 20)
_lnHeightText = IIF(_lnHeightText < 32, 32,	_lnHeightText)

* Координата Y по умолчанию центр весь экран 26 строк
IF VARTYPE(_lnYCoord) # 'N'
	_lnYCoord  = (_lnMainWindHeight - _lnHeightText) / 2
	_llYCenter = .T.
ELSE
	_lnYCoord = IIF(_lnYCoord <  0,  0, _lnYCoord)
	_lnYCoord = IIF(_lnYCoord > _lnMainWindHeight, _lnMainWindHeight, _lnYCoord)
ENDIF
* Проверка на выход за пределы экрана
_lnYCoord = IIF(_lnMainWindHeight - _lnYCoord < _lnHeightText, ;
	_lnMainWindHeight - _lnHeightText, ;
	_lnYCoord)
_lnYCoord = IIF(_lnYCoord < 0, 0, _lnYCoord)

* Координата X по умолчанию центр весь экран 80 колонок
IF VARTYPE(_lnXCoord) # 'N'
	_lnXCoord  = (_lnMainWindWidth - _lnLenText) / 2
	_llXCenter = .T.
ELSE
	_lnXCoord = IIF(_lnXCoord <  0,  0, _lnXCoord)
	_lnXCoord = IIF(_lnXCoord > _lnMainWindWidth, _lnMainWindWidth, _lnXCoord)
ENDIF
* Проверка на выход за пределы экрана
_lnXCoord = IIF(_lnMainWindWidth - _lnXCoord < _lnLenText, _lnMainWindWidth - _lnLenText, _lnXCoord)
_lnXCoord = IIF(_lnXCoord < 0, 0, _lnXCoord)

* в _i будем хранить текущий номер окна
IF VARTYPE(_gaMsgWnd) # 'C'
	PUBLIC _gaMsgWnd
	_i = 1
ELSE
	_i = ALEN(_gaMsgWnd, 1) + 1
ENDIF
DECLARE _gaMsgWnd[_i, 2]
* генерируем уникальную метку для окна
_gaMsgWnd[_i, 1] = UtlRndLabel()
* и запоминаем ее
_lcNameWind = _gaMsgWnd[_i, 1]

* создаем окно
IF _SCREEN.VISIBLE = .T.
* главным окном приложения является главное окно Фокса
	_poWind = CREATEOBJECT("frmFoxMain", _lcNameWind)
ELSE
* главным окном приложения является форма AS-TOP-LEVEL
	_poWind = CREATEOBJECT("frmInTopLevel", _lcNameWind)
ENDIF
* и расставляем некоторые параметры для него
_gaMsgWnd[_i, 2]    = _poWind
WITH _poWind
       .COMMENT		= "Окно MsgCmn()"
       .CLOSABLE    = .F.
       .CONTROLBOX  = .F.
       .MAXBUTTON   = .F.
       .MINBUTTON   = .F.
       .MOVABLE     = .F.
       .WINDOWTYPE  = 1
       	BORDERSTYLE = 2
       .TITLEBAR    = 0
ENDWITH
* создаем некоторые свойства

* координата вывода строки по X
_poWind.ADDPROPERTY("gnXStrPosition", "")
* координата вывода строки по Y
_poWind.ADDPROPERTY("gnYStrPosition", "")
* цвет пера строки
_poWind.ADDPROPERTY("gnStrForeColor", "")
* фон строки
_poWind.ADDPROPERTY("gnStrBackColor", "")

* если есть заголовок
IF VARTYPE(_lcCaption) = 'C'
    * то выполняем корректировку свойств и размера
	_poWind.MOVABLE = .T.
	* возвращаем на место титульную строку
	_poWind.TITLEBAR = 1

	* в зависимости от операционной системы выставляем величину заголовка формы
	* если это WINDOWS XP или выше,то при включенной поддержке тем ОС вокруг
	* формы будет окантовка
	_poWind.HALFHEIGHTCAPTION = IIF(VAL(OS(3)) => 5 AND VAL(OS(4)) => 1, .F., .T.)
	_poWind.CAPTION = _lcCaption
	IF _lnCntRowsText = 1
		_lnHeightText = _lnHeightText + SYSMETRIC(34)
	ENDIF
ENDIF
* корректируем положение окна на экране
_poWind.WIDTH  = IIF(_lnLenText > _lnMainWindWidth, _lnMainWindWidth, ;
	_lnLenText)
_poWind.HEIGHT = IIF(_lnHeightText > _lnMainWindHeight, _lnMainWindHeight, ;
	_lnHeightText)
_poWind.TOP    = IIF(_lnYCoord + _poWind.HEIGHT > _lnMainWindHeight, 0, _lnYCoord)
_poWind.LEFT   = IIF(_lnXCoord + _poWind.WIDTH  > _lnMainWindWidth , 0, _lnXCoord)
_poWind.TOP    = IIF(_lnYCoord + _poWind.HEIGHT > _lnMainWindHeight, 0, _lnYCoord)
_poWind.LEFT   = IIF(_lnXCoord + _poWind.WIDTH  > _lnMainWindWidth , 0, _lnXCoord)

* Строка накопитель текста и кнопок
IF !(VARTYPE(_gcMsgLastString) == 'C')
	  PUBLIC _gcMsgLastString
ENDIF
_gcMsgLastString = ''
_lcButtonText    = ''

* Храним цвета по умолчанию для окна
DECLARE _laColorDefault[2]

_laColorDefault[1] = _poWind.FORECOLOR
_laColorDefault[2] = _poWind.BACKCOLOR

* если есть кнопки
IF _pnButton # 0
* создаем их

	LOCAL _llCmdEnabled, _lnActivCmd, _lnActivCancel, _lnCmdMaxWidth

	_lnNumbButtDis = 0

    * начинаем блок кнопок
	_lcButtonText = _lcButtonText + CR + 'Кнопки : '

    * теперь будем выводить подсказаки
	_poWind.SHOWTIPS = .T.

    * пока нет активной кнопки и кнопки срабатывающей по ESC
	STORE 0 TO _lnActivCmd, _lnActivCancel

    * пока нет еще максимальной ширины для кнопок
	_lnCmdMaxWidth = 0

	DECLARE _paButton[_pnButton]

	FOR _i = 1 TO _pnButton
        * имя кнопки 'A??'
		_j = 'A' + ALLTRIM(STR(_i, 2))
        * создаем кнопку
		_poWind.ADDOBJECT(_j, 'CmdMsgButton')
        * и запоминаем ее
		_paButton[_i] = _poWind.CONTROLS(_poWind.CONTROLCOUNT)
        * выбираем текст для кнопки
		_s = UtlStrSubNCmn(_lcButton, _i)
        * будет ли эта кнопка доступна?
		_llCmdEnabled = IIF(LEFT(_s, 1) = '\', .F., .T.)
		IF !_llCmdEnabled ;
				AND _lnActivCmd <= 0
            * считаем все заблокированные кнопки, до активной
			_lnNumbButtDis = _lnNumbButtDis + 1
		ENDIF
        * убираем из текста символ недоступности
		_s = IIF(LEFT(_s, 1) == '\', SUBSTR(_s, 2), _s)
        * анализируем активную кнопку
		IF LEFT(_s, 1) == '@'
            * эта кнопка будет активна на момент показа сообщения

			_s = SUBSTR(_s, 2)

			IF _lnActivCmd = 0
                * еще не была определена ранее
				_lnActivCmd = _i
			ENDIF

            * анализируем кнопку срабатывающую по клавише ESC
			IF LEFT(_s, 1) == '~'

                * кнопка ESC на момент показа сообщения
				_s = SUBSTR(_s, 2)
				IF _lnActivCancel = 0
                    * еще не была определена ранее
					_lnActivCancel = _i
				ENDIF

			ENDIF
		ELSE
            * анализируем кнопку срабатывающую по клавише ESC
			IF LEFT(_s, 1) == '~'

                * кнопка ESC на момент показа сообщения
				_s = SUBSTR(_s, 2)
				IF _lnActivCancel = 0
                    * еще не была определена ранее
					_lnActivCancel = _i
				ENDIF

			ENDIF

			IF LEFT(_s, 1) == '@'
                * эта кнопка будет активна на момент показа сообщения

				_s = SUBSTR(_s, 2)

				IF _lnActivCmd = 0
                    * еще не была определена ранее
					_lnActivCmd = _i
				ENDIF
			ENDIF

		ENDIF

		IF LEFT(_s, 1) == ' '
            * убираем пробел перед текстом кнопки
			_s = SUBSTR(_s, 2)
		ELSE
            * пытаемся понять текст как ссылку в массив готовых текстов для кнопок
			_s = IIF(VAL(_s) > 0 .AND. VAL(_s) <= _lnCntTxtBut, ;
				_gaMsgButton[val(_s)], ;
				_s)
		ENDIF
        * заносим характеристики кнопки
		_paButton[_i].VISIBLE	= .T.
		_paButton[_i].TAG		= ALLTRIM(STR(_i, 2)) && номер кнопки
		_paButton[_i].AUTOSIZE	= .T.
		_paButton[_i].CAPTION	= _s
		_paButton[_i].AUTOSIZE	= .F.
        * чуть-чуть уменьшаем кнопку
		_paButton[_i].HEIGHT	= _paButton[_i].HEIGHT / 1.01
		_paButton[_i].TOP 		= _lnHeightText
		_paButton[_i].LEFT		=  IIF(_i < 2, 52, ;
			_paButton[_i - 1].LEFT + _paButton[_i - 1].WIDTH + 10)
		_paButton[_i].ENABLED	= _llCmdEnabled
        * максимальная ширина кнопок
		_lnCmdMaxWidth = MAX(_lnCmdMaxWidth, _paButton[_i].WIDTH)
        * запоминаем наименование кнопки
		_lcButtonText = _lcButtonText + _s + '    '
	ENDFOR

	IF _lnActivCancel > 0
		_paButton[_lnActivCancel].CANCEL = .T.
	ENDIF
    * увеличиваем размер окна, чтобы показать кнопки
	_poWind.HEIGHT = _poWind.HEIGHT + _paButton[1].HEIGHT + 10

    * нужно ли делать кнопки одинаковой ширины?
	IF _gaMsgDefault[10] > 0
        * да, делаем
		_lnCmdMaxWidth = IIF(_lnCmdMaxWidth < _gaMsgDefault[10], _gaMsgDefault[10], ;
			_lnCmdMaxWidth)
		FOR _i = 1 TO _pnButton
			_paButton[_i].WIDTH = _lnCmdMaxWidth
			_paButton[_i].LEFT	=  IIF(_i < 2, 52, ;
				_paButton[_i - 1].LEFT + _paButton[_i - 1].WIDTH + 10)
		ENDFOR

	ENDIF

    * нужно ли центрировать кнопки?
	IF _gaMsgDefault[11]

        * да, делаем ...

        * считаем их суммарную длину ...
		_lnCmdMaxWidth = 0
		FOR _i = 1 TO _pnButton
			_lnCmdMaxWidth = _lnCmdMaxWidth + _paButton[_i].WIDTH + 10
		ENDFOR
		_lnCmdMaxWidth = _lnCmdMaxWidth - 10

        * если ширина окна больше общей длины кнопок
		IF _poWind.WIDTH - 104 >= _lnCmdMaxWidth
            * то растояние слева ...
			_lnCmdMaxWidth = (_poWind.WIDTH - _lnCmdMaxWidth) / 2
            * смещаем кнопки
			FOR _i = 1 TO _pnButton
				_paButton[_i].LEFT = _lnCmdMaxWidth
				_lnCmdMaxWidth     = _lnCmdMaxWidth + _paButton[_i].WIDTH + 10
			ENDFOR
		ELSE
            * ширина окна меньше общей длины кнопок
            * растягиваем окно
			_poWind.WIDTH = _lnCmdMaxWidth + 104
            * растояние слева
			_lnCmdMaxWidth = 52
		ENDIF

        * нужно ли, центрировать окно по горизонтали
		IF _llXCenter
            * центрируем по оси X
			_poWind.LEFT = (_lnMainWindWidth - _poWind.WIDTH) / 2
		ENDIF
        * окно не должно вылезти за границу экрана
		_poWind.LEFT = IIF(_poWind.LEFT < 0, 0, _poWind.LEFT)

	ELSE
        * контроль, на видимость всех кнопок
		IF _poWind.WIDTH < _paButton[_pnButton].LEFT + _paButton[_pnButton].WIDTH + 10
			_poWind.WIDTH = _paButton[_pnButton].LEFT + _paButton[_pnButton].WIDTH + 10
		ENDIF
	ENDIF

    * контроль высоты окна, нельзя выходить за пределы экрана
	_poWind.HEIGHT = IIF(_poWind.HEIGHT > _lnMainWindHeight - 5, ;
		_lnMainWindHeight - 5, ;
		_poWind.HEIGHT)

    * нужно центрирование по вертикали?
	IF _llYCenter
        * центрируем по оси Y
		_poWind.TOP = (_lnMainWindHeight - 5 -_poWind.HEIGHT) / 2
	ELSE
		_poWind.TOP = IIF(_poWind.TOP + _poWind.HEIGHT > _lnMainWindHeight - 5, ;
			_lnMainWindHeight - 5 - _poWind.HEIGHT, ;
			_poWind.TOP)
	ENDIF
	_poWind.TOP = IIF(_poWind.TOP < 0, 0, _poWind.TOP)

    * корректируем положение кнопок
	_lnCmdMaxWidth = 0
	FOR _i = 1 TO _pnButton
		_paButton[_i].TOP = _poWind.HEIGHT - _paButton[_i].HEIGHT - 10
		IF !_gaMsgDefault[11]
            * смещаем кнопки для режима, нецентрирование
			IF _i > 1
				_paButton[_i].LEFT = 52 + _lnCmdMaxWidth
			ENDIF
			_lnCmdMaxWidth = _lnCmdMaxWidth + _paButton[_i].WIDTH + 10
		ENDIF
	ENDFOR
	_poWind.WIDTH = IIF(_poWind.LEFT + _poWind.WIDTH > _lnMainWindWidth, ;
		_lnMainWindWidth, ;
		_poWind.WIDTH)
	_poWind.LEFT  = IIF(_poWind.LEFT + _poWind.WIDTH > _lnMainWindWidth, ;
		_lnMainWindWidth - _poWind.WIDTH, ;
		_poWind.LEFT)

	IF _llXCenter
        * центрируем по оси X
		_poWind.LEFT = (_lnMainWindWidth - _poWind.WIDTH) / 2
	ENDIF
	_poWind.LEFT = IIF(_poWind.LEFT < 0, 0, _poWind.LEFT)

    * начало блока о выбранной кнопке
	_lcButtonText = _lcButtonText + CR + 'Выбрана: '

ENDIF

_poWind.FORECOLOR = EVALUATE(LEFT(RGBSCHEME(5, 1), AT(',', RGBSCHEME(5, 1), 3) - 1) ;
	+')')

* вывод сообщения

ACTIVATE WINDOW (_lcNameWind)

IF _llIsColor
    * сохраняем цветовую схему. Мы используем ее для переконвертации цвета
	_lcOldSch2 = RGBSCHEME(2, 1)

    * есть указание на цвет
    * на всякий случай ставим в конце сброс цвета на цвета по умолчанию
	_laRowsText[_lnCntRowsText] = _laRowsText[_lnCntRowsText] + '@ '
	FOR _i = 1 TO _lnCntRowsText

        * расчитываем координату строки по оси Y
        _lnYCoord = (_i - 1) * _lnHeightStr +  ;
		    (_poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / 2 - ;
		                   (_lnHeightText - 20) / 2 + 2 + IIF(_lnCntRowsText = 1, _lnHeightStr / 2 - 1 , 0)
        * расчитываем максимальный размер по высоте для текста
		_l = SYSMETRIC(22) + SYSMETRIC(9) - 5 - IIF(_pnButton = 0, 0, 29) - _lnHeightStr
        * если есть еще куда выводить текст
		IF IIF(_l <= _poWind.HEIGHT, _l, _poWind.HEIGHT) > _lnYCoord

            * то выполняем позиционирование для новой строки
		    _poWind.gnXStrPosition = 52
		    _poWind.gnYStrPosition = _lnYCoord

		    * можно выводить
			_n = .T.
		ELSE
            * вышли за пределы окна, выводить нельзя
			_n = .F.
		ENDIF
        * есть ли указание на цвет, и сколько
		_m = OCCURS('@', _laRowsText[_i])

		IF _m > 0
            * обработка цветов
			FOR _l = 1 TO _m
                * поиск указания на цвет
				_lnAtAmpersand = AT('@', _laRowsText[_i])
				IF _lnAtAmpersand = 0
                    * больше указания на цвет нет
					EXIT
				ENDIF
                * проверяем может быть это просто вывод символа амперсанд? 1-Да
				_s = IIF(SUBSTR(_laRowsText[_i], _lnAtAmpersand + 1, 1) = '@', 1, 0)
                * накапливаем строку текста
				_gcMsgLastString = _gcMsgLastString + SUBSTR(_laRowsText[_i], 1, ;
				                             _lnAtAmpersand - 1 + _s)
				IF _n

                    * теперь выводим все до найденного указателя
					MsgOutStrAdm(SUBSTR(_laRowsText[_i], 1, _lnAtAmpersand - 1 + _s), ;
						_lcFontName, _lnFontSize, _lcFontStyle, _lnYCoord)
				ENDIF
                * переключение цвета
				_laRowsText[_i] = SUBSTR(_laRowsText[_i], _lnAtAmpersand + IIF(_s > 0, _s + 1, 0))
				IF _s > 0
                    * был просто вывод символа '@'
					LOOP
				ENDIF
                * конец указания на цвет
				_lnAtBlank = AT(' ', _laRowsText[_i])
                * строка с цветом
				_s = TRIM(SUBSTR(_laRowsText[_i], 2, _lnAtBlank - 1))
                * остаток строки после указания на цвет
				_laRowsText[_i] = RIGHT(_laRowsText[_i], LEN(_laRowsText[_i]) - _lnAtBlank)

                * начинаем обрабатывать строку с цветом

                * может быть это сброс цветов в значения по умолчанию?
				_s = IIF(LEN(_s)    = 0, '-1/-1', _s)
                * возможно нет указания на цвет пера?
				_s = IIF(AT('/',_s) = 1, '-1'+_s, _s)
                * возможно нет указания на цвет фона или это цвет в кодировке RGB(,,,,,)
				_s = IIF(AT('/',_s) = 0, IIF('RGB(' $ UPPER(_s), _s, _s+'/-1'), _s)
				IF AT('/', _s) > 0
                    * кажется нет указания на цвет фона!
					_s = IIF(RIGHT(_s, LEN(_s) - AT('/', _s)) == '', _s + '-1', _s)
				ENDIF
                * пока нет цветов по умолчанию
				STORE .F. TO _llCBDefault, _llCFDefault
                * есть ли цвета по умолчанию
				IF AT('-1', _s) > 0
                    * да, нужно вернуть цвета по умолчанию
					IF SUBSTR(_s, 1, 2) == '-1'
						_llCFDefault = .T.  && Перо по умолчанию
					ENDIF
					IF AT('/', _s) > 0
                        * есть указание на фон
						IF SUBSTR(_s, AT('/', _s) + 1, 2) == '-1'
							_llCBDefault = .T.  && Фон по умолчанию
						ENDIF
					ENDIF
                    * убираем указание на цвета по умолчанию
					_s = STRTRAN(_s, '-1', '')
                    * возможно больше ничего и нет!
					_s = IIF(LEN(_s) = 1, '', _s)
				ENDIF
                * если есть пользовательский цвет
				IF !EMPTY(_s)
					PRIVATE _plErr				&& флаг ошибки
					_plErr = .F.				&& сбрасываем флаг
					_lcIdError = ON("ERROR")	&& сохраняем старый обработчик ошибки
					ON ERROR _plErr = .T.		&& устанавливаем собст. обработчик

                    * то выводим его
					_s = IIF(LEFT(_s, 1) = '/' AND 'RGB(' $ UPPER(_s), SUBSTR(_s, 2), _s)

                    * устанавливаем цвета пользователя
					SET COLOR OF SCHEME 2 TO (_s)

					IF _plErr
                        * в случае ошибки, сбрасываем  цвет
						SET COLOR OF SCHEME 2 TO '0/'
					ENDIF
					ON ERROR &_lcIdError	&& востанавливаем старый обработчик событий
				ENDIF
                * заносим в _s цифровой код цвета для пера
				IF _llCFDefault
                    * Восстановить цвет пера
					_s = _laColorDefault[1]
				ELSE
					_s = RGBSCHEME(2, 1)
					_s = LEFT(_s, AT(',', _s, 3) - 1) + ')'
					_s = EVALUATE(_s)
				ENDIF
                * заносим в _m цифровой код цвета для фона
				IF _llCBDefault
                    * восстановить цвет фона
					_m = _laColorDefault[2]
				ELSE
					_m = RGBSCHEME(2, 1)
					_m = 'RGB(' + SUBSTR(_m, AT(',', _m, 3) + 1)
					_m = EVALUATE(_m)
				ENDIF

                * устанавливаем цвет
                _poWind.gnStrForeColor = _s
                _poWind.gnStrBackColor = _m

			ENDFOR
		ENDIF
		_gcMsgLastString = _gcMsgLastString + _laRowsText[_i] + CR
		IF _n
            * просто выводим всю строку
			MsgOutStrAdm(_laRowsText[_i], _lcFontName, _lnFontSize, ;
			    _lcFontStyle, _lnYCoord)
		ENDIF
	ENDFOR

    * восстанавливаем цветовую схему
	SET COLOR OF SCHEME 2 TO &_lcOldSch2

ELSE
    * вывод текста простым его отображением в EditBox
	_gcMsgLastString = _lcString
	_poWind.ADDOBJECT("EdtMsgText", "EditBox")
	UtlFontSet(_poWind.EdtMsgText, _lcFontName + "," + ALLTRIM(STR(_lnFontSize)) + ", " + _lcFontStyle)
	WITH _poWind.EdtMsgText
        * определяем размеры
		IF _lnCntRowsText = 1
		    * если всего одна строка
		    .TOP = (_poWind.HEIGHT - 5 - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / ;
		                                                   2 - _lnHeightStr / 2
		ELSE
		    .TOP =  (_poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / ;
		                       2 - (_lnHeightText - 20) / 2
		ENDIF
		.LEFT	= 49
		.WIDTH	= _poWind.WIDTH - 49
		.HEIGHT	= _poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0) - 5 - .TOP
		* управляем визуальностью
		.SCROLLBARS = 0
		.SPECIALEFFECT	= 1
		.ENABLED 		= .F.
		.DISABLEDFORECOLOR = _poWind.FORECOLOR
		.DISABLEDBACKCOLOR = _poWind.BACKCOLOR
		.BORDERSTYLE	= 0
        * само значение
		.VALUE	 = _lcString
		.VISIBLE = .T.
	ENDWITH
ENDIF

* вывод картинки
_lcIcon = FmtUpperCmn(_lcIcon)
IF FILE(_lcIcon)
	_poWind.ADDOBJECT("ImgPicture", "Image")
	WITH _poWind.ImgPicture
		.TOP		= (_poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / 2 - 16
		.LEFT		= 10
		.PICTURE    = _lcIcon
		.BACKSTYLE  = 0
		.STRETCH	= 0
		.VISIBLE	= .T.
	ENDWITH
ENDIF

* запрещаем изменение размеров
STORE _poWind.HEIGHT TO _poWind.MINHEIGHT, _poWind.MAXHEIGHT
STORE _poWind.WIDTH TO _poWind.MINWIDTH, _poWind.MAXWIDTH

IF _pnButton # 0
	_gcMsgLastString = _gcMsgLastString + _lcButtonText

    * делаем нужную кнопку активной
	CLEAR TYPEAHEAD
	IF _lnActivCmd > 1
		FOR _i = 2 TO _lnActivCmd - _lnNumbButtDis
			KEYBOARD '{RIGHTARROW}'
		ENDFOR
	ENDIF

    * обеспечиваем видимость параметров шрифта
	PRIVATE _pcFontName, _pcFontSize, _pcFontStyle
	_pcFontName  = _lcFontName
	_pcFontSize  = _lnFontSize
	_pcFontStyle = _lcFontStyle

    * окно сообщений всегда выше всех
	_poWind.ALWAYSONTOP = .T.
    * добавляем таймер принудительно активизирующий окно сообщений
	_poWind.ADDOBJECT("TmrMsgModal", "TmrMsgModal")
	IF TYPE("_powind.TmrMsgModal") = 'O'
		_poWind.TmrMsgModal.ENABLED = .T.
	ENDIF
    * делаем окно модальным

	_poWind.SHOW(1)
    * снимаем возможную активацию по копированию данных сообщения
	ON KEY LABEL CTRL+C
	ON KEY LABEL Ctrl+INS

    * возвращаем номер выбранной кнопки
    IF VARTYPE(_lnLine2Line)='N'
    	_lnLine2Line = _gaMsgDefault[12]
	ENDIF
	RETURN _pnButton
ENDIF
* возвращаем номер сформированного окна
IF VARTYPE(_lnLine2Line)='N'
	_lnLine2Line = _gaMsgDefault[12]
ENDIF
RETURN ALEN(_gaMsgWnd, 1)
ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgGetText
*----------------------------------------------------------------------------------------
PROCEDURE MsgGetText
*----------------------------------------------------------------------------------------
* Описание.......: Возвращает текст выведенный в окне сообщения
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 19.05.2003
* Модификация....:
*----------------------------------------------------------------------------------------
LOCAL _lcText	;		&& сформированный текст кнопки
, _i					&& счетчик

_lcText = ""
* формирование возможного заголовка
IF !EMPTY(_poWind.CAPTION)
	_lcText = REPLICATE("-", 28) + CR + _poWind.CAPTION + CR
ENDIF
* формирование самого текста сообщения
_lcText = _lcText + REPLICATE("-", 28) + CR ;
	+ LEFT(_gcMsgLastString, RAT(CR, _gcMsgLastString, 2)) + REPLICATE("-", 28) + CR
* формирование текста кнопок
FOR _i = 1 TO _pnButton
	IF _paButton[_i].CAPTION # '...'
		_lcText = _lcText + _paButton[_i].CAPTION + "    "
	ENDIF
ENDFOR
RETURN LEFT(_lcText, LEN(_lcText) - 4) + CR
ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgOutStrAdm
*----------------------------------------------------------------------------------------
FUNCTION MsgOutStrAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle, _lnYCoord
*----------------------------------------------------------------------------------------
* Описание.......: Выводит в окно строку заданным шрифтом. Понимает табуляции и CHR(7)
*----------------------------------------------------------------------------------------
* Параметры......: _lcString	- исходная строка для вывода
*                  _lcFontName	- шрифт для вывода
*                  _lnFontSize	- размер шрифта
*                  _lcFontStyle	- стиль шрифта
*                  _lnYCoord	- координата по Y для вывода строки
*
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей    09.07.2001
* Модификация....: Ганорский Дмитрий 06.07.2005 Изменен способ координирования строки
*                  Гринько Сергей    25.06.2006 Оптимизация. Часть кода вынесена за пределы цикла
*----------------------------------------------------------------------------------------
EXTERNAL ARRAY _paMsgTab	&& массив с табуляциями

LOCAL _lnIndexTAB			&& индекс табуляции
LOCAL _lnXCoord				&& позиция по X для вывода строки
LOCAL _j,_k					&& временные переменные
LOCAL _lnMaxNumbTab			&& сколько всего в массиве заказано табуляций

_lnIndexTAB = AT(CHR(9), _lcString)	&& текущая позиция табуляции
* обработка табуляций
IF _lnIndexTAB > 0
	_lnMaxNumbTab = ALEN(_paMsgTab)
ENDIF
DO WHILE _lnIndexTAB > 0
    * выводим левую часть строки
	   MsgOutStrOneAdm(SUBSTR(_lcString, 1, _lnIndexTAB - 1), ;
        	   _lcFontName, _lnFontSize, _lcFontStyle)

    * и убираем ее из исходной строки
	_lcString = SUBSTR(_lcString, _lnIndexTAB)

    * поиск индекса первого отображаемого символа
    * пропускаем несколько табуляций подряд
	_lnIndexTAB = NfoAtNotCmn(CHR(9), _lcString) - 2
    * и убираем все слева от него
	_lcString = SUBSTR(_lcString, _lnIndexTAB + 2)

    * отсюда будет выводиться строка
	_lnXCoord = _poWind.gnXStrPosition - 52
	_lnXCoord = IIF(_lnXCoord < 0, 0, _lnXCoord)

    * поиск места откуда надо будет выводить => часть строки
	FOR _j = 1 TO _lnMaxNumbTab
		_k = _paMsgTab[_j]
		IF _lnXCoord <= _k

            * _j + _lnIndexTAB - пропуск нескольких табуляций
			_k = IIF(_j + _lnIndexTAB <= _lnMaxNumbTab, _paMsgTab[_j + _lnIndexTAB], _k)
            * позиционируем место для вывода текста
            _poWind.gnXStrPosition = 52 + _k
			_poWind.gnYStrPosition = _lnYCoord
			EXIT
		ENDIF
	ENDFOR
    * ищем индекс следующей табуляции
	_lnIndexTAB = AT(CHR(9), _lcString)
ENDDO
* выводим оставшуюся строку
MsgOutStrOneAdm(_lcString, _lcFontName, _lnFontSize, _lcFontStyle)
ENDFUNC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: MsgOutStrOneAdm
*----------------------------------------------------------------------------------------
FUNCTION MsgOutStrOneAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* Описание.......: Просто вывод строки не содержащей табуляций, с контролем на длину
*----------------------------------------------------------------------------------------
* Параметры......: _lcSting	   - исходная строка длину которой в пикселах надо вычислить
*                  _lcFontName  - имя шрифта
*                  _lnFontSize  - размер шрифта
*                  _lcFontStyle - стиль шрифта (может отсутствовать
*
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей    10.07.2001
* Модификация....: Ганорский Дмитрий 06.07.2005 Изменен способ координирования вывода
*                                               строки.Переписан способ вывода текста
*                                               строки(через LABEL взамен ??)
*----------------------------------------------------------------------------------------

LOCAL _lnXCoord
LOCAL _j, _k    && временные переменные

* определяем текущее положение откуда пойдет вывод строки
_lnXCoord = _poWind.gnXStrPosition
_lnXCoord = _poWind.WIDTH - IIF(_lnXCoord < 0, 0, _lnXCoord)

* урезаем строку до такой длины, которая может поместиться в окне
DO WHILE !EMPTY(_lcString) ;
		AND NfoMsgStrWidthAdm(_lcString, _lcFontName, _lnFontSize, _lcFontStyle) > _lnXCoord
    * убираем один символ справа
	_lcString = LEFT(_lcString, LEN(_lcString) - 1)
ENDDO

* выводим строку посредством создания Label

IF !EMPTY(_lcString) && если не пустая строка

    * генерируем уникальную метку
	_j = UtlRndLabel("lbl")
    * создаем Label
    _poWind.ADDOBJECT(_j, "Label")
    * запоминаем его
	_k = _poWind.CONTROLS(_poWind.CONTROLCOUNT)
    * задаем параметры шрифта
	UtlFontSet(_k, _lcFontName + "," + ALLTRIM(STR(_lnFontSize)) + ", " + _lcFontStyle)
    * и расставляем некоторые параметры для него
	WITH _k
		.VISIBLE   = .F.
		.CAPTION   = _lcString
		.TOP	   = _poWind.gnYStrPosition
		.LEFT	   = _poWind.gnXStrPosition

		* если это выводится текст с изменением цвета
		IF !EMPTY(_poWind.gnStrForeColor) AND ;
		                  !EMPTY(_poWind.gnStrBackColor)

			.FORECOLOR = RGB(BITAND(255, _poWind.gnStrForeColor),;
			                 BITAND(255, BITRSHIFT(_poWind.gnStrForeColor, 8)),;
			                 BITAND(255, BITRSHIFT(_poWind.gnStrForeColor, 16)))
			.BACKCOLOR = RGB(BITAND(255, _poWind.gnStrBackColor),;
			                 BITAND(255, BITRSHIFT(_poWind.gnStrBackColor, 8)),;
			                 BITAND(255, BITRSHIFT(_poWind.gnStrBackColor, 16)))
		ENDIF
		.AUTOSIZE  = .T.
		.VISIBLE   = .T.
	ENDWITH
ENDIF

* готовим следующие координаты вывода по координате X
_poWind.gnXStrPosition = _poWind.gnXStrPosition + ;
                                NfoMsgStrWidthAdm(_lcString, _lcFontName, ;
                                        _lnFontSize, _lcFontStyle)
ENDFUNC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........:
* Процедура......: NfoMsgStrWidthAdm
*----------------------------------------------------------------------------------------
FUNCTION NfoMsgStrWidthAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* Описание.......: Вычисляет ширину строки выводимой в окне сообщений с учетом символов
*                  табуляции
*----------------------------------------------------------------------------------------
* Параметры......: _lcSting	    - исходная строка длину которой в пикселах надо вычислить
*                  _lcFontName  - имя шрифта
*                  _lnFontSize  - размер шрифта
*                  _lcFontStyle - стиль шрифта (может отсутствовать)
*
* Возвращает.....: Numeric	ширину в пикселах строки с учетом табуляций
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 10.07.2001
* Модификация....: Гринько Сергей 26.06.2006	Оптимизация. Вызов функции NfoStrWidthCmn
*                                               заменен на прямую работу с фунцией TXTWIDTH
*												также константа вычислена заранее.
*----------------------------------------------------------------------------------------

LOCAL _lnXMax			&& длина строки
LOCAL _lnTAB			&& позиция табуляции
LOCAL _j, _m			&& временные переменные
LOCAL _lnLenTabs		&& размер массива с табуляциями

EXTERNAL ARRAY _paMsgTab

IF VARTYPE(_lcFontStyle) # 'C'
	_lcFontStyle = 'N'
ENDIF

_lnXMax   = 0
_m		  = 0
* ищем табуляцию
_lnTAB    = AT(CHR(9), _lcString)
IF _lnTAB > 0
	_lnLenTabs    = ALEN(_paMsgTab)
ENDIF
DO WHILE _lnTAB > 0

    * обработка табуляций
    * считаем длину строки до табуляции
	_lnXMax = _lnXMax ;
				+ TXTWIDTH(SUBSTR(_lcString, 1, _lnTAB - 1), _lcFontName, _lnFontSize, _lcFontStyle) * _gaMsgDefault[12] ;
				+ _m
    * и берем остаток строки для обработки
	_lcString = SUBSTR(_lcString, _lnTAB + 1)

    * высчитываем позицию в строке для данной табуляции
	FOR _j = 1 TO _lnLenTabs
		IF _lnXMax <= _paMsgTab[_j]
			_lnXMax = _paMsgTab[_j]
			EXIT
		ENDIF
	ENDFOR

    * ищем новую позицию табуляции
	_lnTAB = AT(CHR(9), _lcString)

    * несколько табуляций подряд!
	_m = 1
ENDDO
* добавляем ширину остатка строки
RETURN (_lnXMax + TXTWIDTH(_lcString, _lcFontName, _lnFontSize, _lcFontStyle) * _gaMsgDefault[12])
ENDFUNC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: CmdMsgButton
* Процедура......:
*----------------------------------------------------------------------------------------
DEFINE CLASS CmdMsgButton AS COMMANDBUTTON
*----------------------------------------------------------------------------------------
* Описание.......: Класс используемый при создании кнопок в окне сообщений
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 10.07.2001
* Модификация....:
*----------------------------------------------------------------------------------------
	FONTNAME 		= 'Arial Cyr'
	FONTSIZE 		= _gaMsgDefault[8]
	FONTBOLD		= ('B' $ _gaMsgDefault[9])
	FONTOUTLINE		= ('O' $ _gaMsgDefault[9])
	FONTITALIC		= ('I' $ _gaMsgDefault[9])
	FONTUNDERLINE	= ('U' $ _gaMsgDefault[9])
	FONTSTRIKETHRU	= ('-' $ _gaMsgDefault[9])
	FONTSHADOW		= ('S' $ _gaMsgDefault[9])
    STATUSBARTEXT   = SET('MESSAGE', 1)
*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: CmdMsgButton
* Процедура......: LOSTFOCUS
*----------------------------------------------------------------------------------------
PROCEDURE LOSTFOCUS
*----------------------------------------------------------------------------------------
* Описание.......: При нажатии на клавиши копирования Ctrl+INS Ctrl+C в клипбоард WINDOWS
*                  будет помещен текст отображенный в окне плюс наименования кнопок и
*                  заголовок окна
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 06.06.2003
* Модификация....:
*----------------------------------------------------------------------------------------
	ON KEY LABEL CTRL+C
	ON KEY LABEL Ctrl+INS
	ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: CmdMsgButton
* Процедура......: GOTFOCUS
*----------------------------------------------------------------------------------------
PROCEDURE GOTFOCUS
*----------------------------------------------------------------------------------------
* Описание.......: При нажатии на клавиши копирования Ctrl+INS Ctrl+C в клипбоард WINDOWS
*                  будет помещен текст отображенный в окне плюс наименования кнопок и
*                  заголовок окна
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 06.06.2003
* Модификация....:
*----------------------------------------------------------------------------------------
	ON KEY LABEL CTRL+C _CLIPTEXT = MsgGetText()
	ON KEY LABEL Ctrl+INS _CLIPTEXT = MsgGetText()
	ENDPROC

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: CmdMsgButton
* Процедура......: CLICK
*----------------------------------------------------------------------------------------
PROCEDURE CLICK
*----------------------------------------------------------------------------------------
* Описание.......: При нажатии на кнопку в PRIVATE переменную _pnButton будет занесен
*                  номер нажатой кнопки
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 10.07.2001
* Модификация....: Гринько Сергей 03.09.2001 теперь метод возвращает номер нажатой кнопки
*                                            как Numeric
*----------------------------------------------------------------------------------------
	LOCAL _n		&& номер текущего открытого сообщения в списке сообщений

	_pnButton = INT(VAL(THIS.TAG))	&& номер текущей кнопки

	_n = ALEN(_gaMsgWnd, 1)

    * уничтожаем информацию об окне
	STORE .F. TO _gaMsgWnd[_n, 1], _gaMsgWnd[_n, 2], _paButton, _poWind
	IF _n > 1
		DECLARE _gaMsgWnd[_n - 1, 2]
	ENDIF

    * формируем в последнем сообщении информацию о выборе кнопки пользователем
	_gcMsgLastString = _gcMsgLastString + THIS.CAPTION + CR

	THISFORM.VISIBLE = .F.
	THISFORM.RELEASE()
	ENDPROC
ENDDEFINE

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: TmrMsgModal
* Процедура......:
*----------------------------------------------------------------------------------------
DEFINE CLASS TmrMsgModal AS TIMER
*----------------------------------------------------------------------------------------
* Описание.......: Класс, позволяющий выполнить обязательный переход фокуса в форму
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 10.07.2001
* Модификация....:
*----------------------------------------------------------------------------------------
	ENABLED  = .F.				&& изначально таймер не работает
	INTERVAL = 200				&& через 200 млс активировать форму

*----------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: TmrMsgModal
* Процедура......: TIMER
*----------------------------------------------------------------------------------------
PROCEDURE TIMER
*----------------------------------------------------------------------------------------
* Описание.......: Принудительное активирование окна сообщений
*----------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*----------------------------------------------------------------------------------------
* Создание.......: Гринько Сергей 12.04.2003
* Модификация....: Габуния Максим 21.04.2003  Перенес выключение таймера перед
*                                             вызовом SHOW()
*----------------------------------------------------------------------------------------
	IF THIS.ENABLED
         * выключаем таймер
		THIS.ENABLED = .F.
        * активируем окно сообщений
		THISFORM.SHOW()
	ENDIF
	ENDPROC
ENDDEFINE

*------------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: frmInTopLevel
* Процедура......:
*------------------------------------------------------------------------------------------
DEFINE CLASS frmInTopLevel AS frmFoxMain
*------------------------------------------------------------------------------------------
* Описание.......: Класс,создающий на основе предварительно созданного класса frmFOXMAIN
*                  - объект форму вида IN TOP LEVEL Для работы с приложениями у которых
*                  главной формой является форма AS-TOP-LEVEL
*------------------------------------------------------------------------------------------
* Параметры......: входных параметров нет
* Возвращает.....: Logical	всегда возращает .T.
*------------------------------------------------------------------------------------------
* Создание.......: Ганорский Дмитрий 06.07.2005
* Модификация....:
*------------------------------------------------------------------------------------------
     DESKTOP    = .T.  && свободно перемещается по экрану
     SHOWWINDOW = 1    && IN-TOP-LEVEL FORM

ENDDEFINE

*------------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: frmFoxMain
* Процедура......:
*------------------------------------------------------------------------------------------
DEFINE CLASS frmFoxMain AS FORM
*------------------------------------------------------------------------------------------
* Описание.......: Класс создающий стандартную форму-окно.
*------------------------------------------------------------------------------------------
* Параметры......: _tcNameWind - уникальное имя окна
* Возвращает.....: Logical	всегда возращает .T.
*------------------------------------------------------------------------------------------
* Создание.......: Ганорский Дмитрий 06.07.2005
* Модификация....:
*------------------------------------------------------------------------------------------

*------------------------------------------------------------------------------------------
* Программа......: prg_msg_cmn.prg
* Класс..........: frmFoxMain
* Процедура......: INIT()
*------------------------------------------------------------------------------------------
	PROCEDURE INIT
*------------------------------------------------------------------------------------------
* Описание.......: Инициализация формы
*------------------------------------------------------------------------------------------
* Параметры......: _tcNameWind - имя окна
* Возвращает.....: Logical	всегда возращает .T.
*------------------------------------------------------------------------------------------
* Создание.......: Ганорский Дмитрий 06.07.2005
* Модификация....:
*------------------------------------------------------------------------------------------
	LPARAMETERS _tcNameWind

	THIS.NAME = _tcNameWind
ENDDEFINE

