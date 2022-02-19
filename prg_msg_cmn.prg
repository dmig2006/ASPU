#INCLUDE "..\include\inc_main_bas.h"

PUBLIC  CR
CR	= CHR(13)
*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgButtonInitCmn()
*----------------------------------------------------------------------------------------
PROCEDURE MsgButtonInitCmn
*----------------------------------------------------------------------------------------
* ��������.......: ������� ���������� �������� MsgCmn() ������ ���� ������
*                  PUBLIC _gaMsgButton[] �� ���������.����� ����������� ������.
*                  �� ���������� ������� �� ����������� �������.
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 09.07.2001
* �����������....:
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
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgPrmDefaultCmn()
*----------------------------------------------------------------------------------------
PROCEDURE MsgPrmDefaultCmn()
*----------------------------------------------------------------------------------------
* ��������.......: ��������� ����������� ��������� �� ���������
*                  ��� ������ ������� MsgCmn()
*                  ������� ���������� �������� MsgCmn() ������ ���� ������
*                  PUBLIC _gaMsgDefault[] �� ���������.
*                  ������ ������ ������ ��������� ������������ �������� MsgCmn()
*                  � �������� ���������� �� ���������
*                  _gaMsgDefault[1] - ����� ���������
*			                    [2] - ������ ������ ���������
*			                    [3] - ����� ������ ���������
*			                    [4] - ����� ��� �������� ���������
*			                    [5] - ����� ��� ��������� � ��������
*			                    [6] - ������� ���������
*			                    [7] - ����� ��������� ������
*			                    [8] - ������ ������ ��������� ������
*			                    [9] - ����� ������ ��������� ������
*			                   [10] - ������� ������ ���������� ������ � N ������
*			                   [11] - ������������ ������ �� ��������� � ������ ����
*                              [12] - ���������� � �������� ����� �������� ��� ���������� ������
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������    09.07.2001
* �����������....: ��������� ������� 06.07.2005 ����� 12 �������� - ������ � ����������
*                                               ������� �������� 6 � 40.. �� 30..
*                                               ������� �������� 2 � 8 �� 9
*				   ������� ������    25.06.2006 �������� �������� 12
*----------------------------------------------------------------------------------------

PUBLIC _gaMsgDefault
DECLARE _gaMsgDefault[12]
* ����� ���������
_gaMsgDefault[1] = 'Arial Cyr'
* ������ ������ ���������
_gaMsgDefault[2] = 9
* ����� ������ ���������
_gaMsgDefault[3] = 'N'
* ����� ��� �������� ���������
_gaMsgDefault[4] = MSG_ICONCLOCK
* ����� ��� ��������� � ��������
_gaMsgDefault[5] = MSG_ICONQUESTION
* ���������
_gaMsgDefault[6] = '30,60,90,120,150,180,210,240,270,300,330,360,390,420,450,480,' + ;
	'510,540,570,600,630,660,690'
* ����� ��������� ������
_gaMsgDefault[7] = 'Arial Cyr'
* ������ ������ ��������� ������
_gaMsgDefault[8] = 8
* ����� ������ ��������� ������
_gaMsgDefault[9] = 'N'
* ������� ������ ���������� ������ � N ������
_gaMsgDefault[10] = 70
* ������������ ������ �� ��������� � ������ ����
_gaMsgDefault[11] = .T.
* ���c�������� ���������: ���������� ����� ������� � ��������
_gaMsgDefault[12] = FONTMETRIC(6, _gaMsgDefault[1], _gaMsgDefault[2], _gaMsgDefault[3])

ENDPROC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgCmn
*----------------------------------------------------------------------------------------
PROCEDURE MsgCmn
LPARAMETERS _lcString, _lcButton, _lcIcon, _lcCaption, _lnXCoord, _lnYCoord, ;
	_lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* ��������.......: ��������� ������������� ��� ����������� ���������� � �������������.
*                  ����� �������� ������ � ���������� � ��������� ������������ �����.
*                  ����� ���� �������� � ������ ����������� ������. ��� ���� ����������
*                  ���������� �������-�� ������������������ ���� ������������ �� �������
*                  ������-������ ������. � ���� ������ ������������ ����� ������� ������
*                  (���� ����� - ������� ). ����� ����� ���� �������� ����������
*                  �������.� ������ ����������� ������� <ENTER>,<TAB>, CHR(7).
*                  ������� ���������� � ����� ������ ������� _gaMsgWnd[*,2], � �������
*                  ����������� ���������� ��� ���� [*,1] � ������ ���� "������" ��
*                  ���� [*,2]. _gaMsgButton[*] ������ ����������� ������������ ���
*                  ������ � ����� ����������. _gaMsgDefault[11]  - ������ ���������
*                  ������������ ������ �������� �� ���������.
*                  ��� ��������� �� ��������� ���������� ������� MsgPrmDefaultCmn().
* 	               ����� ���������					  - _gaMsgDefault[1]="Arial Cyr"
* 	               ������ ������ ���������			  - _gaMsgDefault[2]=8
* 	               ����� ������ ���������			  - _gaMsgDefault[3]="N"
* 	               ����� ��� �������� ���������		  - _gaMsgDefault[4]=MSG_ICONCLOCK
* 	               ����� ��� ��������� � ��������	  - _gaMsgDefault[5]=MSG_ICONQUESTION
* 	               ��������� � ��������				  - _gaMsgDefault[6]="30,60,90,....."
* 	               ����� ��������� ������			  - _gaMsgDefault[7]="Arial Cyr"
* 	               ������ ������ ��������� ������	  - _gaMsgDefault[8]=8
* 	               ����� ������ ��������� ������			       - _gaMsgDefault[9]="N"
* 	               ������� ������ ���������� ������ � N ������. �������� ���� ���������
*                  �� ������������ ����� ������ �� ����� ������.   - _gaMsgDefault[10]=90
* 	               ������������ ������ �� ��������� � ������ ����  - _gaMsgDefault[11]=.T.
*----------------------------------------------------------------------------------------
* ���������......:  _lcString - ������ ������. ��������������� � ������ ����� ���������
*                               ����� ������ ���������� �������� ����� �����.
*                               ��� �������� �������� � ������ ���������� ������:
*                               '@B/G ' - ���������� �������� '@' � �������������
*                               ��������, ��� ����� ����� ��������� ��������������� ���
*                               �������� �� ���� - �� ������� '/' ���� ����,����� ����
*                               - ���� ����. ���� ���� ���� �/��� ���� ���� �����  '-1',
*                               �� ���	�������� �� ������� � ������ �� ���������.����
*                               ���� ��� ���� ����� ���� ������ - '@/W' '@R+/' '@R+'.
*                               ����� ���� ����� ���� ������ � ����
*                               RGB(Rf,Gf,Bf, Rb,Gb,Bb), ��� ������ ������
*		                        ����� ��� �������� �� ���� ����, � ��������� ������ �����
*                               �������� �� ���� ����.� ������ ����������� �������
*                               ��������� � �������� �������.
*                   _lcButton - �������� ��� ������, ������ �� ������ ��� ����� ����
*                               ������ ������ �� ������� ��������� � ����� �������� � ����
*                               ������� ������������. ���������� ����� ������� ������,
*                               ���� �����-�������.���� ����� ������ �����������. �����
*                               ������ ������ ���������� ';'
*                               ��������� ��� : 'Ok!;1;��������;' ������ ����� ����
*                               ������������� ���� �� ������ �������� ��������� "\" �����
*                               ����� ���� ��������� ������� � ����� ������� "@" - ������,
*                               "~" - ������,������ @ ������ ������ ��������,������ ~ ������
*                               ������ ������������� �� ������� ESC
*
*                               " " - ������ ��������� ���� ����� ���������� � ������������
*                               ������ �����.���� ��� ����� ��������������� ���� ������������,
*                               �� ������,��� ���� ������ ������ ���� ���������� ���������
*                               (@ ~), ���� ��������� ����� ���.
*		                        �� ����, �������� ��������� ��������:
*			                    �� ������ ����� ���� ����� ������ ������ ������ "\"
*                               ����� ����� ���� � ����� ������� ��������� �������
*                               "@" - ������, "~" - ������ ����� ��� ����� ������ " " ������,
*                               ����������� �� ������������� ����������� ����� � ������������
*                               ������
*
*                   _lcIcon   - ��� ����� � ����������� '.bmp,*.ico'
*                  _lcCaption - ���� �����, �� ���� ����� ��������� � ��������� � ��� ����
*                              ��������� ����� ���� ���������� �� ������
*                  _lnXCoord  - ���������� ������ �� ��� X
*                  _lnYCoord  - ���������� ������ �� ��� Y
*                  _lcFontName, _lnFontSize, _lcFontStyle  - ��� ������, ������, �����
*
* ����������.....: Numeric
*	               �������� ��� �������� ��������� ��������� � ����������� �� ����������
*                  ����������:
* 	               1.��������� ������, ����� ������ ������.
*		             ������� ���������� ������ � ������� _gaMsgWnd[*,2] �� �������� ����.
*		             ����� ��������� ���� ����� �����  ������� ������.
*	               2.���� ����� ��� ������.
*		             ������� ���������� ����� ������� ������.
*                    ���� ������ ����� - �������.
*	               3.��� ������� ����������. ������� ���������� ����� ����.
*                    (�������� ���� ���������)
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������    09.07.2001
* �����������....: ��������� ������� 06.07.2005 ������� ���������� �� ����� ������
*                                               ����������� Label ������ ����������� SAY,
*                                               � ����� � �� ���������� ��������� ��� XP.
*                                               ������ ��� ��������� � ������� "..."
*                                               ������� ��������� ���� AS-TOP-LEVEL.
*                                               ��������� ����� ���� � ����� �� �������
*                                               ������.
*----------------------------------------------------------------------------------------
* � ���� �������� �������� ��������� ��������� �������
EXTERNAL ARRAY _gaMsgDefault, _gaMsgButton

LOCAL _lnCntRowsText		&& ���-�� ����� ������
LOCAL _lnLenText			&& ������������ ������ ������ � ��������
LOCAL _lnHeightText			&& ������ ������ � ��������
LOCAL _lnAtAmpersand		&& ������� ������ ��������� �� ���� @ (���������)
LOCAL _lnAtBlank			&& ������� ���������� �������� �� ���� (������)
LOCAL _laRowsText			&& ������ �������� ���� ����� ��������� ���������
LOCAL _lnFX					&& ������ �� ������ ����� ���� � ����������
LOCAL _lnFY					&& ������ �� ������ ����� ���� � ����������
LOCAL _laColorDefault		&& ������ ������ �� ���������
LOCAL _llXCenter			&& ������� ������������� �� �����������
LOCAL _llYCenter			&& ������� ������������� �� ���������
LOCAL _lnXCoord				&& ������� ������������� �� �����������
LOCAL _lnYCoord				&& ������� ������������� �� ���������
LOCAL _lnCntTxtBut			&& ���������� ������
LOCAL _lnHeightStr			&& ������� ����� ���������������� ������� ������
LOCAL _lcNameWind			&& ��� ����
LOCAL _lcOldSch2			&& �������� ����� �2
LOCAL _lcOldPrinter			&& ��������� ��������
LOCAL _lcOldConsole			&& ��������� ���������� ��������
LOCAL _lcIdError		    && ������������� ����������� ������
LOCAL _llCBDefault			&& ���� ���� �� ���������
LOCAL _llCFDefault			&& ���� ���� �� ���������
LOCAL _lnNumbButtDis		&& ���������� ��������������� ������ �� ��������
LOCAL _lcButton				&& ����� ����������� ������
LOCAL _lcButtonText			&& ����� �������������� ������
LOCAL _llIsColor			&& ������� ������� �������� ��������� � ������
LOCAL _o					&& ��������� ������ �� ������
LOCAL _i, _j, _k			&& ��������� ����������
LOCAL _l, _m, _s			&& ��������� ����������
LOCAL _lnLine2Line			&& ����������� �������� �� _gaMsgDefault[12] (��� ������ ��������� ������)
LOCAL _lnMainWindWidth		&& ������
LOCAL _lnMainWindHeight     && ������ �������� ���� �����
                            && ��� ������ � ������ ������ � ������
                            && AS-TOP-LEVEL
PRIVATE _pnButton			&& ���������� ������ ��� ������
PRIVATE _poWind				&& ������ �� ���� � ����������
PRIVATE _paButton			&& ������ ��������� ������ ��������� � ����
PRIVATE _paMsgTab			&& ������ ���������

* ���� �� ������� ���������
IF VARTYPE(_lcString) # 'C'
	* ���, ��������� ���
	_lcString = ''
ENDIF

* ���� ��������� ���
IF EMPTY(_lcString)
* ������� ���������� ����
	IF VARTYPE(_gaMsgWnd) = 'C'
		_i = ALEN(_gaMsgWnd, 1)
        * ��������� ������ �� ����
		_o = _gaMsgWnd[_i, 2]
        * ������� ���������� �� ���� �� �������
		IF _i > 1
			DECLARE _gaMsgWnd[_i - 1, 2]
		ELSE
			STORE .F. TO _gaMsgWnd[_i, 1], _gaMsgWnd[_i, 2]
		ENDIF
         * ���������� ����
		_o.RELEASE
	ENDIF
	RETURN 0 && ���������� ����
ENDIF

IF VARTYPE(_gaMsgDefault) # 'C' ;
		OR ALEN(_gaMsgDefault) # 12
	* ��������� ����������� ���������� �� ���������
	MsgPrmDefaultCmn()
ENDIF

* ��������� ���������
IF AT(CHR(9), _lcString) > 0
    * ���� ��������� � ���������
    * ������������� �� ���������
	_s = _gaMsgDefault[6]
	IF RIGHT(_s, 1) != ','
		_s = _s + ','
	ENDIF
	_i = OCCURS(',', _s)
	DECLARE _paMsgTab[_i]

    * ��������� ���������� ������� ��������� �������� � ���� ������
    * � ���������� ������ � �������
    _l = 0			&& ������� ���������� �������
	FOR _j = 1 TO _i
		_m = AT(',', _s, _j)			&& ������� ��������� �������
		IF _m = 0
			EXIT						&& ������ ������ ������������
		ENDIF
		_k = SUBSTR(_s, _l+1, _m - _l - 1)	&& �������� => ���������
		_paMsgTab[_j] = VAL(_k)			&& ��������� ��� ������ � �����������
		_l = _m							&& ������ ��������� ������� ���������� ����������
	ENDFOR
	DECLARE _paMsgTab[_j-1]
ENDIF

* ��������� ������
* ���� ������ ���
_pnButton = 0
IF VARTYPE(_lcButton) = 'C' ;
		AND !EMPTY(_lcButton)

	IF TYPE("_gaMsgButton[1]") # 'C'
        * �������������� ������� ����������������� ������������ ������
		MsgButtonInitCmn()
	ENDIF

    * ��������� ������������ ������
	_lcButton = IIF(RIGHT(_lcButton, 1) == ';', _lcButton, ;
		_lcButton + ';')
    * ���������� ���������� ������
	_pnButton = OCCURS(';', _lcButton)

    * �������� ���� �� ������ ������ � ������� ��
	_lnCntTxtBut = ALEN(_gaMsgButton)
	_lnCntTxtBut = IIF(_lnCntTxtBut = 1, IIF(EMPTY(_gaMsgButton[1]) ;
											 OR VARTYPE(_gaMsgButton[1]) # 'C', 0, 1);
										, _lnCntTxtBut)
ENDIF

* ������� ��� �������� �����
_lcString = CHRTRAN(_lcString, CHR(10), '')
* ���������� ����� � ���������
_lnCntRowsText = NfoMemLinesCmn(_lcString)
* ����� ����� ������� ������ ���������
DECLARE _laRowsText[_lnCntRowsText]
_laRowsText = ''
* ����� �� ��������� ...
IF VARTYPE(_lcIcon) # 'C'
	IF _pnButton = 0
        * ����
		_lcIcon = _gaMsgDefault[4]
	ELSE
        * ������
		_lcIcon = _gaMsgDefault[5]
	ENDIF
ENDIF
_lcIcon = IIF(VARTYPE(_lcIcon) # 'C', '', _lcIcon)

* ���� �� ���������
IF VARTYPE(_lcFontName) # 'C'
	_lcFontName = _gaMsgDefault[1]
ENDIF

IF !EMPTY(_lcFontName)
	_lcFontName = STRTRAN(_lcFontName, ' Cyr', '', 1, 1, 1)
ENDIF

* ������ �����  �� ��������� 8 �������
IF VARTYPE(_lnFontSize) # 'N'
	_lnFontSize = _gaMsgDefault[2]
ENDIF

* �����  �� ��������� Normal
IF VARTYPE(_lcFontStyle) # 'C'
	_lcFontStyle = _gaMsgDefault[3]
ENDIF

IF _gaMsgDefault[1] != _lcFontName	;
   OR _gaMsgDefault[2] = _lnFontSize ;
   OR _gaMsgDefault[3] = _lcFontStyle
   	* ���������� �������� ������ �� �������� �� ���������
	* ���c�������� ���������: ���������� ����� ������� � ��������
	_lnLine2Line = _gaMsgDefault[12]
	_gaMsgDefault[12] = FONTMETRIC(6, _lcFontName, _lnFontSize, _lcFontStyle)
ENDIF

* ���������� ������ ������ � ��������
* ������ ������ ������ � ��������
_lnLenText = 0
_k = NfoStrHeightCmn(_lcFontName, _lnFontSize, _lcFontStyle, .T.)
* ��������� ���������
_lnHeightStr = IIF(_lnFontSize < 11, _k * 0.9, _k * 0.95)
* ������ ���� �����
_lnHeightText = _lnCntRowsText * _lnHeightStr

* ���������� ������ ����� ������

* ����� �� ������ �������� ������?
IF AT(CHR(7), _lcString) > 0
    * ������� �� ������ ��� �������� ����
	_lcString = CHRTRAN(_lcString, CHR(7), '')
    * ������ �������� ������
	?? CHR(7)
ENDIF

_l = 1					 && ����� �������������� ������
_j = _lcString			 && �������� ��������� ��� ���������

DO WHILE !EMPTY(_j)
    * ������� � _k ������� ���� ������
	_i = AT(CHR(13), _j)
	_i = IIF(_i = 0, LEN(_j) + 1, _i)
	_k = LEFT(_j, _i - 1)
    * ���������� ��������� ������ ������
	_laRowsText[_l] = _k
    * ������� �� ������ ��� �������� �� �������� ������
	_k = CHRTRAN(_k, CHR(10), '')
    * ���� �������� ������ ��� �������� �� ����, ����� ��� �����
	_s = ''
	DO WHILE AT('@', _k) > 0
        * ��� ���� �������� �� ����
		_lnAtAmpersand = AT('@', _k)
		IF SUBSTR(_k, _lnAtAmpersand + 1, 1) = '@'
            * ������ ����� ������� '@'
			_s = _s + LEFT(_k, _lnAtAmpersand)
			_k = SUBSTR(_k, _lnAtAmpersand + 2)
			LOOP
		ELSE
			_llIsColor = .T.	&& ���� �������� �� ����
		ENDIF
		_s = _s + LEFT(_k, _lnAtAmpersand - 1)
		_k = SUBSTR(_k, _lnAtAmpersand + 1)
		_lnAtAmpersand = AT(' ', _k)
		_k = SUBSTR(_k, IIF(_lnAtAmpersand > 0, _lnAtAmpersand + 1, 1), LEN(_k))
	ENDDO
    * ��������� ������� ������
	_s = _s + _k
    * � ��������� ������������ ������ ������
	_lnLenText = MAX(_lnLenText, ;
		NfoMsgStrWidthAdm(_s, _lcFontName, _lnFontSize, _lcFontStyle))
    * ��������� ������ ��������� ��� ���������
	_l = _l + 1
	_j = RIGHT(_j, LEN(_j) - _i)
ENDDO

* ������� ������ �������� ��� �������� ���� �����
* � ����������� �� ��������� �������
IF _SCREEN.VISIBLE = .T.
	_lnMainWindWidth  = _SCREEN.WIDTH
	_lnMainWindHeight = _SCREEN.HEIGHT
ELSE
	_lnMainWindWidth  = SYSMETRIC(1)
	_lnMainWindHeight = SYSMETRIC(2)
ENDIF


* ��������� ����������� �������� ��� �������������
_lnLenText    = IIF(_lnLenText + 32 + 30 > _lnMainWindWidth, _lnMainWindWidth, ;
															 _lnLenText + 32 + 30)
_lnHeightText = IIF(_lnHeightText + 20 > _lnMainWindHeight, _lnMainWindHeight, ;
															_lnHeightText + 20)
_lnHeightText = IIF(_lnHeightText < 32, 32,	_lnHeightText)

* ���������� Y �� ��������� ����� ���� ����� 26 �����
IF VARTYPE(_lnYCoord) # 'N'
	_lnYCoord  = (_lnMainWindHeight - _lnHeightText) / 2
	_llYCenter = .T.
ELSE
	_lnYCoord = IIF(_lnYCoord <  0,  0, _lnYCoord)
	_lnYCoord = IIF(_lnYCoord > _lnMainWindHeight, _lnMainWindHeight, _lnYCoord)
ENDIF
* �������� �� ����� �� ������� ������
_lnYCoord = IIF(_lnMainWindHeight - _lnYCoord < _lnHeightText, ;
	_lnMainWindHeight - _lnHeightText, ;
	_lnYCoord)
_lnYCoord = IIF(_lnYCoord < 0, 0, _lnYCoord)

* ���������� X �� ��������� ����� ���� ����� 80 �������
IF VARTYPE(_lnXCoord) # 'N'
	_lnXCoord  = (_lnMainWindWidth - _lnLenText) / 2
	_llXCenter = .T.
ELSE
	_lnXCoord = IIF(_lnXCoord <  0,  0, _lnXCoord)
	_lnXCoord = IIF(_lnXCoord > _lnMainWindWidth, _lnMainWindWidth, _lnXCoord)
ENDIF
* �������� �� ����� �� ������� ������
_lnXCoord = IIF(_lnMainWindWidth - _lnXCoord < _lnLenText, _lnMainWindWidth - _lnLenText, _lnXCoord)
_lnXCoord = IIF(_lnXCoord < 0, 0, _lnXCoord)

* � _i ����� ������� ������� ����� ����
IF VARTYPE(_gaMsgWnd) # 'C'
	PUBLIC _gaMsgWnd
	_i = 1
ELSE
	_i = ALEN(_gaMsgWnd, 1) + 1
ENDIF
DECLARE _gaMsgWnd[_i, 2]
* ���������� ���������� ����� ��� ����
_gaMsgWnd[_i, 1] = UtlRndLabel()
* � ���������� ��
_lcNameWind = _gaMsgWnd[_i, 1]

* ������� ����
IF _SCREEN.VISIBLE = .T.
* ������� ����� ���������� �������� ������� ���� �����
	_poWind = CREATEOBJECT("frmFoxMain", _lcNameWind)
ELSE
* ������� ����� ���������� �������� ����� AS-TOP-LEVEL
	_poWind = CREATEOBJECT("frmInTopLevel", _lcNameWind)
ENDIF
* � ����������� ��������� ��������� ��� ����
_gaMsgWnd[_i, 2]    = _poWind
WITH _poWind
       .COMMENT		= "���� MsgCmn()"
       .CLOSABLE    = .F.
       .CONTROLBOX  = .F.
       .MAXBUTTON   = .F.
       .MINBUTTON   = .F.
       .MOVABLE     = .F.
       .WINDOWTYPE  = 1
       	BORDERSTYLE = 2
       .TITLEBAR    = 0
ENDWITH
* ������� ��������� ��������

* ���������� ������ ������ �� X
_poWind.ADDPROPERTY("gnXStrPosition", "")
* ���������� ������ ������ �� Y
_poWind.ADDPROPERTY("gnYStrPosition", "")
* ���� ���� ������
_poWind.ADDPROPERTY("gnStrForeColor", "")
* ��� ������
_poWind.ADDPROPERTY("gnStrBackColor", "")

* ���� ���� ���������
IF VARTYPE(_lcCaption) = 'C'
    * �� ��������� ������������� ������� � �������
	_poWind.MOVABLE = .T.
	* ���������� �� ����� ��������� ������
	_poWind.TITLEBAR = 1

	* � ����������� �� ������������ ������� ���������� �������� ��������� �����
	* ���� ��� WINDOWS XP ��� ����,�� ��� ���������� ��������� ��� �� ������
	* ����� ����� ���������
	_poWind.HALFHEIGHTCAPTION = IIF(VAL(OS(3)) => 5 AND VAL(OS(4)) => 1, .F., .T.)
	_poWind.CAPTION = _lcCaption
	IF _lnCntRowsText = 1
		_lnHeightText = _lnHeightText + SYSMETRIC(34)
	ENDIF
ENDIF
* ������������ ��������� ���� �� ������
_poWind.WIDTH  = IIF(_lnLenText > _lnMainWindWidth, _lnMainWindWidth, ;
	_lnLenText)
_poWind.HEIGHT = IIF(_lnHeightText > _lnMainWindHeight, _lnMainWindHeight, ;
	_lnHeightText)
_poWind.TOP    = IIF(_lnYCoord + _poWind.HEIGHT > _lnMainWindHeight, 0, _lnYCoord)
_poWind.LEFT   = IIF(_lnXCoord + _poWind.WIDTH  > _lnMainWindWidth , 0, _lnXCoord)
_poWind.TOP    = IIF(_lnYCoord + _poWind.HEIGHT > _lnMainWindHeight, 0, _lnYCoord)
_poWind.LEFT   = IIF(_lnXCoord + _poWind.WIDTH  > _lnMainWindWidth , 0, _lnXCoord)

* ������ ���������� ������ � ������
IF !(VARTYPE(_gcMsgLastString) == 'C')
	  PUBLIC _gcMsgLastString
ENDIF
_gcMsgLastString = ''
_lcButtonText    = ''

* ������ ����� �� ��������� ��� ����
DECLARE _laColorDefault[2]

_laColorDefault[1] = _poWind.FORECOLOR
_laColorDefault[2] = _poWind.BACKCOLOR

* ���� ���� ������
IF _pnButton # 0
* ������� ��

	LOCAL _llCmdEnabled, _lnActivCmd, _lnActivCancel, _lnCmdMaxWidth

	_lnNumbButtDis = 0

    * �������� ���� ������
	_lcButtonText = _lcButtonText + CR + '������ : '

    * ������ ����� �������� ����������
	_poWind.SHOWTIPS = .T.

    * ���� ��� �������� ������ � ������ ������������� �� ESC
	STORE 0 TO _lnActivCmd, _lnActivCancel

    * ���� ��� ��� ������������ ������ ��� ������
	_lnCmdMaxWidth = 0

	DECLARE _paButton[_pnButton]

	FOR _i = 1 TO _pnButton
        * ��� ������ 'A??'
		_j = 'A' + ALLTRIM(STR(_i, 2))
        * ������� ������
		_poWind.ADDOBJECT(_j, 'CmdMsgButton')
        * � ���������� ��
		_paButton[_i] = _poWind.CONTROLS(_poWind.CONTROLCOUNT)
        * �������� ����� ��� ������
		_s = UtlStrSubNCmn(_lcButton, _i)
        * ����� �� ��� ������ ��������?
		_llCmdEnabled = IIF(LEFT(_s, 1) = '\', .F., .T.)
		IF !_llCmdEnabled ;
				AND _lnActivCmd <= 0
            * ������� ��� ��������������� ������, �� ��������
			_lnNumbButtDis = _lnNumbButtDis + 1
		ENDIF
        * ������� �� ������ ������ �������������
		_s = IIF(LEFT(_s, 1) == '\', SUBSTR(_s, 2), _s)
        * ����������� �������� ������
		IF LEFT(_s, 1) == '@'
            * ��� ������ ����� ������� �� ������ ������ ���������

			_s = SUBSTR(_s, 2)

			IF _lnActivCmd = 0
                * ��� �� ���� ���������� �����
				_lnActivCmd = _i
			ENDIF

            * ����������� ������ ������������� �� ������� ESC
			IF LEFT(_s, 1) == '~'

                * ������ ESC �� ������ ������ ���������
				_s = SUBSTR(_s, 2)
				IF _lnActivCancel = 0
                    * ��� �� ���� ���������� �����
					_lnActivCancel = _i
				ENDIF

			ENDIF
		ELSE
            * ����������� ������ ������������� �� ������� ESC
			IF LEFT(_s, 1) == '~'

                * ������ ESC �� ������ ������ ���������
				_s = SUBSTR(_s, 2)
				IF _lnActivCancel = 0
                    * ��� �� ���� ���������� �����
					_lnActivCancel = _i
				ENDIF

			ENDIF

			IF LEFT(_s, 1) == '@'
                * ��� ������ ����� ������� �� ������ ������ ���������

				_s = SUBSTR(_s, 2)

				IF _lnActivCmd = 0
                    * ��� �� ���� ���������� �����
					_lnActivCmd = _i
				ENDIF
			ENDIF

		ENDIF

		IF LEFT(_s, 1) == ' '
            * ������� ������ ����� ������� ������
			_s = SUBSTR(_s, 2)
		ELSE
            * �������� ������ ����� ��� ������ � ������ ������� ������� ��� ������
			_s = IIF(VAL(_s) > 0 .AND. VAL(_s) <= _lnCntTxtBut, ;
				_gaMsgButton[val(_s)], ;
				_s)
		ENDIF
        * ������� �������������� ������
		_paButton[_i].VISIBLE	= .T.
		_paButton[_i].TAG		= ALLTRIM(STR(_i, 2)) && ����� ������
		_paButton[_i].AUTOSIZE	= .T.
		_paButton[_i].CAPTION	= _s
		_paButton[_i].AUTOSIZE	= .F.
        * ����-���� ��������� ������
		_paButton[_i].HEIGHT	= _paButton[_i].HEIGHT / 1.01
		_paButton[_i].TOP 		= _lnHeightText
		_paButton[_i].LEFT		=  IIF(_i < 2, 52, ;
			_paButton[_i - 1].LEFT + _paButton[_i - 1].WIDTH + 10)
		_paButton[_i].ENABLED	= _llCmdEnabled
        * ������������ ������ ������
		_lnCmdMaxWidth = MAX(_lnCmdMaxWidth, _paButton[_i].WIDTH)
        * ���������� ������������ ������
		_lcButtonText = _lcButtonText + _s + '    '
	ENDFOR

	IF _lnActivCancel > 0
		_paButton[_lnActivCancel].CANCEL = .T.
	ENDIF
    * ����������� ������ ����, ����� �������� ������
	_poWind.HEIGHT = _poWind.HEIGHT + _paButton[1].HEIGHT + 10

    * ����� �� ������ ������ ���������� ������?
	IF _gaMsgDefault[10] > 0
        * ��, ������
		_lnCmdMaxWidth = IIF(_lnCmdMaxWidth < _gaMsgDefault[10], _gaMsgDefault[10], ;
			_lnCmdMaxWidth)
		FOR _i = 1 TO _pnButton
			_paButton[_i].WIDTH = _lnCmdMaxWidth
			_paButton[_i].LEFT	=  IIF(_i < 2, 52, ;
				_paButton[_i - 1].LEFT + _paButton[_i - 1].WIDTH + 10)
		ENDFOR

	ENDIF

    * ����� �� ������������ ������?
	IF _gaMsgDefault[11]

        * ��, ������ ...

        * ������� �� ��������� ����� ...
		_lnCmdMaxWidth = 0
		FOR _i = 1 TO _pnButton
			_lnCmdMaxWidth = _lnCmdMaxWidth + _paButton[_i].WIDTH + 10
		ENDFOR
		_lnCmdMaxWidth = _lnCmdMaxWidth - 10

        * ���� ������ ���� ������ ����� ����� ������
		IF _poWind.WIDTH - 104 >= _lnCmdMaxWidth
            * �� ��������� ����� ...
			_lnCmdMaxWidth = (_poWind.WIDTH - _lnCmdMaxWidth) / 2
            * ������� ������
			FOR _i = 1 TO _pnButton
				_paButton[_i].LEFT = _lnCmdMaxWidth
				_lnCmdMaxWidth     = _lnCmdMaxWidth + _paButton[_i].WIDTH + 10
			ENDFOR
		ELSE
            * ������ ���� ������ ����� ����� ������
            * ����������� ����
			_poWind.WIDTH = _lnCmdMaxWidth + 104
            * ��������� �����
			_lnCmdMaxWidth = 52
		ENDIF

        * ����� ��, ������������ ���� �� �����������
		IF _llXCenter
            * ���������� �� ��� X
			_poWind.LEFT = (_lnMainWindWidth - _poWind.WIDTH) / 2
		ENDIF
        * ���� �� ������ ������� �� ������� ������
		_poWind.LEFT = IIF(_poWind.LEFT < 0, 0, _poWind.LEFT)

	ELSE
        * ��������, �� ��������� ���� ������
		IF _poWind.WIDTH < _paButton[_pnButton].LEFT + _paButton[_pnButton].WIDTH + 10
			_poWind.WIDTH = _paButton[_pnButton].LEFT + _paButton[_pnButton].WIDTH + 10
		ENDIF
	ENDIF

    * �������� ������ ����, ������ �������� �� ������� ������
	_poWind.HEIGHT = IIF(_poWind.HEIGHT > _lnMainWindHeight - 5, ;
		_lnMainWindHeight - 5, ;
		_poWind.HEIGHT)

    * ����� ������������� �� ���������?
	IF _llYCenter
        * ���������� �� ��� Y
		_poWind.TOP = (_lnMainWindHeight - 5 -_poWind.HEIGHT) / 2
	ELSE
		_poWind.TOP = IIF(_poWind.TOP + _poWind.HEIGHT > _lnMainWindHeight - 5, ;
			_lnMainWindHeight - 5 - _poWind.HEIGHT, ;
			_poWind.TOP)
	ENDIF
	_poWind.TOP = IIF(_poWind.TOP < 0, 0, _poWind.TOP)

    * ������������ ��������� ������
	_lnCmdMaxWidth = 0
	FOR _i = 1 TO _pnButton
		_paButton[_i].TOP = _poWind.HEIGHT - _paButton[_i].HEIGHT - 10
		IF !_gaMsgDefault[11]
            * ������� ������ ��� ������, ���������������
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
        * ���������� �� ��� X
		_poWind.LEFT = (_lnMainWindWidth - _poWind.WIDTH) / 2
	ENDIF
	_poWind.LEFT = IIF(_poWind.LEFT < 0, 0, _poWind.LEFT)

    * ������ ����� � ��������� ������
	_lcButtonText = _lcButtonText + CR + '�������: '

ENDIF

_poWind.FORECOLOR = EVALUATE(LEFT(RGBSCHEME(5, 1), AT(',', RGBSCHEME(5, 1), 3) - 1) ;
	+')')

* ����� ���������

ACTIVATE WINDOW (_lcNameWind)

IF _llIsColor
    * ��������� �������� �����. �� ���������� �� ��� ��������������� �����
	_lcOldSch2 = RGBSCHEME(2, 1)

    * ���� �������� �� ����
    * �� ������ ������ ������ � ����� ����� ����� �� ����� �� ���������
	_laRowsText[_lnCntRowsText] = _laRowsText[_lnCntRowsText] + '@ '
	FOR _i = 1 TO _lnCntRowsText

        * ����������� ���������� ������ �� ��� Y
        _lnYCoord = (_i - 1) * _lnHeightStr +  ;
		    (_poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / 2 - ;
		                   (_lnHeightText - 20) / 2 + 2 + IIF(_lnCntRowsText = 1, _lnHeightStr / 2 - 1 , 0)
        * ����������� ������������ ������ �� ������ ��� ������
		_l = SYSMETRIC(22) + SYSMETRIC(9) - 5 - IIF(_pnButton = 0, 0, 29) - _lnHeightStr
        * ���� ���� ��� ���� �������� �����
		IF IIF(_l <= _poWind.HEIGHT, _l, _poWind.HEIGHT) > _lnYCoord

            * �� ��������� ���������������� ��� ����� ������
		    _poWind.gnXStrPosition = 52
		    _poWind.gnYStrPosition = _lnYCoord

		    * ����� ��������
			_n = .T.
		ELSE
            * ����� �� ������� ����, �������� ������
			_n = .F.
		ENDIF
        * ���� �� �������� �� ����, � �������
		_m = OCCURS('@', _laRowsText[_i])

		IF _m > 0
            * ��������� ������
			FOR _l = 1 TO _m
                * ����� �������� �� ����
				_lnAtAmpersand = AT('@', _laRowsText[_i])
				IF _lnAtAmpersand = 0
                    * ������ �������� �� ���� ���
					EXIT
				ENDIF
                * ��������� ����� ���� ��� ������ ����� ������� ���������? 1-��
				_s = IIF(SUBSTR(_laRowsText[_i], _lnAtAmpersand + 1, 1) = '@', 1, 0)
                * ����������� ������ ������
				_gcMsgLastString = _gcMsgLastString + SUBSTR(_laRowsText[_i], 1, ;
				                             _lnAtAmpersand - 1 + _s)
				IF _n

                    * ������ ������� ��� �� ���������� ���������
					MsgOutStrAdm(SUBSTR(_laRowsText[_i], 1, _lnAtAmpersand - 1 + _s), ;
						_lcFontName, _lnFontSize, _lcFontStyle, _lnYCoord)
				ENDIF
                * ������������ �����
				_laRowsText[_i] = SUBSTR(_laRowsText[_i], _lnAtAmpersand + IIF(_s > 0, _s + 1, 0))
				IF _s > 0
                    * ��� ������ ����� ������� '@'
					LOOP
				ENDIF
                * ����� �������� �� ����
				_lnAtBlank = AT(' ', _laRowsText[_i])
                * ������ � ������
				_s = TRIM(SUBSTR(_laRowsText[_i], 2, _lnAtBlank - 1))
                * ������� ������ ����� �������� �� ����
				_laRowsText[_i] = RIGHT(_laRowsText[_i], LEN(_laRowsText[_i]) - _lnAtBlank)

                * �������� ������������ ������ � ������

                * ����� ���� ��� ����� ������ � �������� �� ���������?
				_s = IIF(LEN(_s)    = 0, '-1/-1', _s)
                * �������� ��� �������� �� ���� ����?
				_s = IIF(AT('/',_s) = 1, '-1'+_s, _s)
                * �������� ��� �������� �� ���� ���� ��� ��� ���� � ��������� RGB(,,,,,)
				_s = IIF(AT('/',_s) = 0, IIF('RGB(' $ UPPER(_s), _s, _s+'/-1'), _s)
				IF AT('/', _s) > 0
                    * ������� ��� �������� �� ���� ����!
					_s = IIF(RIGHT(_s, LEN(_s) - AT('/', _s)) == '', _s + '-1', _s)
				ENDIF
                * ���� ��� ������ �� ���������
				STORE .F. TO _llCBDefault, _llCFDefault
                * ���� �� ����� �� ���������
				IF AT('-1', _s) > 0
                    * ��, ����� ������� ����� �� ���������
					IF SUBSTR(_s, 1, 2) == '-1'
						_llCFDefault = .T.  && ���� �� ���������
					ENDIF
					IF AT('/', _s) > 0
                        * ���� �������� �� ���
						IF SUBSTR(_s, AT('/', _s) + 1, 2) == '-1'
							_llCBDefault = .T.  && ��� �� ���������
						ENDIF
					ENDIF
                    * ������� �������� �� ����� �� ���������
					_s = STRTRAN(_s, '-1', '')
                    * �������� ������ ������ � ���!
					_s = IIF(LEN(_s) = 1, '', _s)
				ENDIF
                * ���� ���� ���������������� ����
				IF !EMPTY(_s)
					PRIVATE _plErr				&& ���� ������
					_plErr = .F.				&& ���������� ����
					_lcIdError = ON("ERROR")	&& ��������� ������ ���������� ������
					ON ERROR _plErr = .T.		&& ������������� �����. ����������

                    * �� ������� ���
					_s = IIF(LEFT(_s, 1) = '/' AND 'RGB(' $ UPPER(_s), SUBSTR(_s, 2), _s)

                    * ������������� ����� ������������
					SET COLOR OF SCHEME 2 TO (_s)

					IF _plErr
                        * � ������ ������, ����������  ����
						SET COLOR OF SCHEME 2 TO '0/'
					ENDIF
					ON ERROR &_lcIdError	&& �������������� ������ ���������� �������
				ENDIF
                * ������� � _s �������� ��� ����� ��� ����
				IF _llCFDefault
                    * ������������ ���� ����
					_s = _laColorDefault[1]
				ELSE
					_s = RGBSCHEME(2, 1)
					_s = LEFT(_s, AT(',', _s, 3) - 1) + ')'
					_s = EVALUATE(_s)
				ENDIF
                * ������� � _m �������� ��� ����� ��� ����
				IF _llCBDefault
                    * ������������ ���� ����
					_m = _laColorDefault[2]
				ELSE
					_m = RGBSCHEME(2, 1)
					_m = 'RGB(' + SUBSTR(_m, AT(',', _m, 3) + 1)
					_m = EVALUATE(_m)
				ENDIF

                * ������������� ����
                _poWind.gnStrForeColor = _s
                _poWind.gnStrBackColor = _m

			ENDFOR
		ENDIF
		_gcMsgLastString = _gcMsgLastString + _laRowsText[_i] + CR
		IF _n
            * ������ ������� ��� ������
			MsgOutStrAdm(_laRowsText[_i], _lcFontName, _lnFontSize, ;
			    _lcFontStyle, _lnYCoord)
		ENDIF
	ENDFOR

    * ��������������� �������� �����
	SET COLOR OF SCHEME 2 TO &_lcOldSch2

ELSE
    * ����� ������ ������� ��� ������������ � EditBox
	_gcMsgLastString = _lcString
	_poWind.ADDOBJECT("EdtMsgText", "EditBox")
	UtlFontSet(_poWind.EdtMsgText, _lcFontName + "," + ALLTRIM(STR(_lnFontSize)) + ", " + _lcFontStyle)
	WITH _poWind.EdtMsgText
        * ���������� �������
		IF _lnCntRowsText = 1
		    * ���� ����� ���� ������
		    .TOP = (_poWind.HEIGHT - 5 - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / ;
		                                                   2 - _lnHeightStr / 2
		ELSE
		    .TOP =  (_poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0)) / ;
		                       2 - (_lnHeightText - 20) / 2
		ENDIF
		.LEFT	= 49
		.WIDTH	= _poWind.WIDTH - 49
		.HEIGHT	= _poWind.HEIGHT - IIF(_pnButton # 0, _paButton[1].HEIGHT + 5, 0) - 5 - .TOP
		* ��������� �������������
		.SCROLLBARS = 0
		.SPECIALEFFECT	= 1
		.ENABLED 		= .F.
		.DISABLEDFORECOLOR = _poWind.FORECOLOR
		.DISABLEDBACKCOLOR = _poWind.BACKCOLOR
		.BORDERSTYLE	= 0
        * ���� ��������
		.VALUE	 = _lcString
		.VISIBLE = .T.
	ENDWITH
ENDIF

* ����� ��������
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

* ��������� ��������� ��������
STORE _poWind.HEIGHT TO _poWind.MINHEIGHT, _poWind.MAXHEIGHT
STORE _poWind.WIDTH TO _poWind.MINWIDTH, _poWind.MAXWIDTH

IF _pnButton # 0
	_gcMsgLastString = _gcMsgLastString + _lcButtonText

    * ������ ������ ������ ��������
	CLEAR TYPEAHEAD
	IF _lnActivCmd > 1
		FOR _i = 2 TO _lnActivCmd - _lnNumbButtDis
			KEYBOARD '{RIGHTARROW}'
		ENDFOR
	ENDIF

    * ������������ ��������� ���������� ������
	PRIVATE _pcFontName, _pcFontSize, _pcFontStyle
	_pcFontName  = _lcFontName
	_pcFontSize  = _lnFontSize
	_pcFontStyle = _lcFontStyle

    * ���� ��������� ������ ���� ����
	_poWind.ALWAYSONTOP = .T.
    * ��������� ������ ������������� �������������� ���� ���������
	_poWind.ADDOBJECT("TmrMsgModal", "TmrMsgModal")
	IF TYPE("_powind.TmrMsgModal") = 'O'
		_poWind.TmrMsgModal.ENABLED = .T.
	ENDIF
    * ������ ���� ���������

	_poWind.SHOW(1)
    * ������� ��������� ��������� �� ����������� ������ ���������
	ON KEY LABEL CTRL+C
	ON KEY LABEL Ctrl+INS

    * ���������� ����� ��������� ������
    IF VARTYPE(_lnLine2Line)='N'
    	_lnLine2Line = _gaMsgDefault[12]
	ENDIF
	RETURN _pnButton
ENDIF
* ���������� ����� ��������������� ����
IF VARTYPE(_lnLine2Line)='N'
	_lnLine2Line = _gaMsgDefault[12]
ENDIF
RETURN ALEN(_gaMsgWnd, 1)
ENDPROC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgGetText
*----------------------------------------------------------------------------------------
PROCEDURE MsgGetText
*----------------------------------------------------------------------------------------
* ��������.......: ���������� ����� ���������� � ���� ���������
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 19.05.2003
* �����������....:
*----------------------------------------------------------------------------------------
LOCAL _lcText	;		&& �������������� ����� ������
, _i					&& �������

_lcText = ""
* ������������ ���������� ���������
IF !EMPTY(_poWind.CAPTION)
	_lcText = REPLICATE("-", 28) + CR + _poWind.CAPTION + CR
ENDIF
* ������������ ������ ������ ���������
_lcText = _lcText + REPLICATE("-", 28) + CR ;
	+ LEFT(_gcMsgLastString, RAT(CR, _gcMsgLastString, 2)) + REPLICATE("-", 28) + CR
* ������������ ������ ������
FOR _i = 1 TO _pnButton
	IF _paButton[_i].CAPTION # '...'
		_lcText = _lcText + _paButton[_i].CAPTION + "    "
	ENDIF
ENDFOR
RETURN LEFT(_lcText, LEN(_lcText) - 4) + CR
ENDPROC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgOutStrAdm
*----------------------------------------------------------------------------------------
FUNCTION MsgOutStrAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle, _lnYCoord
*----------------------------------------------------------------------------------------
* ��������.......: ������� � ���� ������ �������� �������. �������� ��������� � CHR(7)
*----------------------------------------------------------------------------------------
* ���������......: _lcString	- �������� ������ ��� ������
*                  _lcFontName	- ����� ��� ������
*                  _lnFontSize	- ������ ������
*                  _lcFontStyle	- ����� ������
*                  _lnYCoord	- ���������� �� Y ��� ������ ������
*
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������    09.07.2001
* �����������....: ��������� ������� 06.07.2005 ������� ������ ��������������� ������
*                  ������� ������    25.06.2006 �����������. ����� ���� �������� �� ������� �����
*----------------------------------------------------------------------------------------
EXTERNAL ARRAY _paMsgTab	&& ������ � �����������

LOCAL _lnIndexTAB			&& ������ ���������
LOCAL _lnXCoord				&& ������� �� X ��� ������ ������
LOCAL _j,_k					&& ��������� ����������
LOCAL _lnMaxNumbTab			&& ������� ����� � ������� �������� ���������

_lnIndexTAB = AT(CHR(9), _lcString)	&& ������� ������� ���������
* ��������� ���������
IF _lnIndexTAB > 0
	_lnMaxNumbTab = ALEN(_paMsgTab)
ENDIF
DO WHILE _lnIndexTAB > 0
    * ������� ����� ����� ������
	   MsgOutStrOneAdm(SUBSTR(_lcString, 1, _lnIndexTAB - 1), ;
        	   _lcFontName, _lnFontSize, _lcFontStyle)

    * � ������� �� �� �������� ������
	_lcString = SUBSTR(_lcString, _lnIndexTAB)

    * ����� ������� ������� ������������� �������
    * ���������� ��������� ��������� ������
	_lnIndexTAB = NfoAtNotCmn(CHR(9), _lcString) - 2
    * � ������� ��� ����� �� ����
	_lcString = SUBSTR(_lcString, _lnIndexTAB + 2)

    * ������ ����� ���������� ������
	_lnXCoord = _poWind.gnXStrPosition - 52
	_lnXCoord = IIF(_lnXCoord < 0, 0, _lnXCoord)

    * ����� ����� ������ ���� ����� �������� => ����� ������
	FOR _j = 1 TO _lnMaxNumbTab
		_k = _paMsgTab[_j]
		IF _lnXCoord <= _k

            * _j + _lnIndexTAB - ������� ���������� ���������
			_k = IIF(_j + _lnIndexTAB <= _lnMaxNumbTab, _paMsgTab[_j + _lnIndexTAB], _k)
            * ������������� ����� ��� ������ ������
            _poWind.gnXStrPosition = 52 + _k
			_poWind.gnYStrPosition = _lnYCoord
			EXIT
		ENDIF
	ENDFOR
    * ���� ������ ��������� ���������
	_lnIndexTAB = AT(CHR(9), _lcString)
ENDDO
* ������� ���������� ������
MsgOutStrOneAdm(_lcString, _lcFontName, _lnFontSize, _lcFontStyle)
ENDFUNC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: MsgOutStrOneAdm
*----------------------------------------------------------------------------------------
FUNCTION MsgOutStrOneAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* ��������.......: ������ ����� ������ �� ���������� ���������, � ��������� �� �����
*----------------------------------------------------------------------------------------
* ���������......: _lcSting	   - �������� ������ ����� ������� � �������� ���� ���������
*                  _lcFontName  - ��� ������
*                  _lnFontSize  - ������ ������
*                  _lcFontStyle - ����� ������ (����� �������������
*
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������    10.07.2001
* �����������....: ��������� ������� 06.07.2005 ������� ������ ��������������� ������
*                                               ������.��������� ������ ������ ������
*                                               ������(����� LABEL ������ ??)
*----------------------------------------------------------------------------------------

LOCAL _lnXCoord
LOCAL _j, _k    && ��������� ����������

* ���������� ������� ��������� ������ ������ ����� ������
_lnXCoord = _poWind.gnXStrPosition
_lnXCoord = _poWind.WIDTH - IIF(_lnXCoord < 0, 0, _lnXCoord)

* ������� ������ �� ����� �����, ������� ����� ����������� � ����
DO WHILE !EMPTY(_lcString) ;
		AND NfoMsgStrWidthAdm(_lcString, _lcFontName, _lnFontSize, _lcFontStyle) > _lnXCoord
    * ������� ���� ������ ������
	_lcString = LEFT(_lcString, LEN(_lcString) - 1)
ENDDO

* ������� ������ ����������� �������� Label

IF !EMPTY(_lcString) && ���� �� ������ ������

    * ���������� ���������� �����
	_j = UtlRndLabel("lbl")
    * ������� Label
    _poWind.ADDOBJECT(_j, "Label")
    * ���������� ���
	_k = _poWind.CONTROLS(_poWind.CONTROLCOUNT)
    * ������ ��������� ������
	UtlFontSet(_k, _lcFontName + "," + ALLTRIM(STR(_lnFontSize)) + ", " + _lcFontStyle)
    * � ����������� ��������� ��������� ��� ����
	WITH _k
		.VISIBLE   = .F.
		.CAPTION   = _lcString
		.TOP	   = _poWind.gnYStrPosition
		.LEFT	   = _poWind.gnXStrPosition

		* ���� ��� ��������� ����� � ���������� �����
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

* ������� ��������� ���������� ������ �� ���������� X
_poWind.gnXStrPosition = _poWind.gnXStrPosition + ;
                                NfoMsgStrWidthAdm(_lcString, _lcFontName, ;
                                        _lnFontSize, _lcFontStyle)
ENDFUNC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........:
* ���������......: NfoMsgStrWidthAdm
*----------------------------------------------------------------------------------------
FUNCTION NfoMsgStrWidthAdm
LPARAMETERS _lcString, _lcFontName, _lnFontSize, _lcFontStyle
*----------------------------------------------------------------------------------------
* ��������.......: ��������� ������ ������ ��������� � ���� ��������� � ������ ��������
*                  ���������
*----------------------------------------------------------------------------------------
* ���������......: _lcSting	    - �������� ������ ����� ������� � �������� ���� ���������
*                  _lcFontName  - ��� ������
*                  _lnFontSize  - ������ ������
*                  _lcFontStyle - ����� ������ (����� �������������)
*
* ����������.....: Numeric	������ � �������� ������ � ������ ���������
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 10.07.2001
* �����������....: ������� ������ 26.06.2006	�����������. ����� ������� NfoStrWidthCmn
*                                               ������� �� ������ ������ � ������� TXTWIDTH
*												����� ��������� ��������� �������.
*----------------------------------------------------------------------------------------

LOCAL _lnXMax			&& ����� ������
LOCAL _lnTAB			&& ������� ���������
LOCAL _j, _m			&& ��������� ����������
LOCAL _lnLenTabs		&& ������ ������� � �����������

EXTERNAL ARRAY _paMsgTab

IF VARTYPE(_lcFontStyle) # 'C'
	_lcFontStyle = 'N'
ENDIF

_lnXMax   = 0
_m		  = 0
* ���� ���������
_lnTAB    = AT(CHR(9), _lcString)
IF _lnTAB > 0
	_lnLenTabs    = ALEN(_paMsgTab)
ENDIF
DO WHILE _lnTAB > 0

    * ��������� ���������
    * ������� ����� ������ �� ���������
	_lnXMax = _lnXMax ;
				+ TXTWIDTH(SUBSTR(_lcString, 1, _lnTAB - 1), _lcFontName, _lnFontSize, _lcFontStyle) * _gaMsgDefault[12] ;
				+ _m
    * � ����� ������� ������ ��� ���������
	_lcString = SUBSTR(_lcString, _lnTAB + 1)

    * ����������� ������� � ������ ��� ������ ���������
	FOR _j = 1 TO _lnLenTabs
		IF _lnXMax <= _paMsgTab[_j]
			_lnXMax = _paMsgTab[_j]
			EXIT
		ENDIF
	ENDFOR

    * ���� ����� ������� ���������
	_lnTAB = AT(CHR(9), _lcString)

    * ��������� ��������� ������!
	_m = 1
ENDDO
* ��������� ������ ������� ������
RETURN (_lnXMax + TXTWIDTH(_lcString, _lcFontName, _lnFontSize, _lcFontStyle) * _gaMsgDefault[12])
ENDFUNC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: CmdMsgButton
* ���������......:
*----------------------------------------------------------------------------------------
DEFINE CLASS CmdMsgButton AS COMMANDBUTTON
*----------------------------------------------------------------------------------------
* ��������.......: ����� ������������ ��� �������� ������ � ���� ���������
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 10.07.2001
* �����������....:
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
* ���������......: prg_msg_cmn.prg
* �����..........: CmdMsgButton
* ���������......: LOSTFOCUS
*----------------------------------------------------------------------------------------
PROCEDURE LOSTFOCUS
*----------------------------------------------------------------------------------------
* ��������.......: ��� ������� �� ������� ����������� Ctrl+INS Ctrl+C � ��������� WINDOWS
*                  ����� ������� ����� ������������ � ���� ���� ������������ ������ �
*                  ��������� ����
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 06.06.2003
* �����������....:
*----------------------------------------------------------------------------------------
	ON KEY LABEL CTRL+C
	ON KEY LABEL Ctrl+INS
	ENDPROC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: CmdMsgButton
* ���������......: GOTFOCUS
*----------------------------------------------------------------------------------------
PROCEDURE GOTFOCUS
*----------------------------------------------------------------------------------------
* ��������.......: ��� ������� �� ������� ����������� Ctrl+INS Ctrl+C � ��������� WINDOWS
*                  ����� ������� ����� ������������ � ���� ���� ������������ ������ �
*                  ��������� ����
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 06.06.2003
* �����������....:
*----------------------------------------------------------------------------------------
	ON KEY LABEL CTRL+C _CLIPTEXT = MsgGetText()
	ON KEY LABEL Ctrl+INS _CLIPTEXT = MsgGetText()
	ENDPROC

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: CmdMsgButton
* ���������......: CLICK
*----------------------------------------------------------------------------------------
PROCEDURE CLICK
*----------------------------------------------------------------------------------------
* ��������.......: ��� ������� �� ������ � PRIVATE ���������� _pnButton ����� �������
*                  ����� ������� ������
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 10.07.2001
* �����������....: ������� ������ 03.09.2001 ������ ����� ���������� ����� ������� ������
*                                            ��� Numeric
*----------------------------------------------------------------------------------------
	LOCAL _n		&& ����� �������� ��������� ��������� � ������ ���������

	_pnButton = INT(VAL(THIS.TAG))	&& ����� ������� ������

	_n = ALEN(_gaMsgWnd, 1)

    * ���������� ���������� �� ����
	STORE .F. TO _gaMsgWnd[_n, 1], _gaMsgWnd[_n, 2], _paButton, _poWind
	IF _n > 1
		DECLARE _gaMsgWnd[_n - 1, 2]
	ENDIF

    * ��������� � ��������� ��������� ���������� � ������ ������ �������������
	_gcMsgLastString = _gcMsgLastString + THIS.CAPTION + CR

	THISFORM.VISIBLE = .F.
	THISFORM.RELEASE()
	ENDPROC
ENDDEFINE

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: TmrMsgModal
* ���������......:
*----------------------------------------------------------------------------------------
DEFINE CLASS TmrMsgModal AS TIMER
*----------------------------------------------------------------------------------------
* ��������.......: �����, ����������� ��������� ������������ ������� ������ � �����
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 10.07.2001
* �����������....:
*----------------------------------------------------------------------------------------
	ENABLED  = .F.				&& ���������� ������ �� ��������
	INTERVAL = 200				&& ����� 200 ��� ������������ �����

*----------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: TmrMsgModal
* ���������......: TIMER
*----------------------------------------------------------------------------------------
PROCEDURE TIMER
*----------------------------------------------------------------------------------------
* ��������.......: �������������� ������������� ���� ���������
*----------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*----------------------------------------------------------------------------------------
* ��������.......: ������� ������ 12.04.2003
* �����������....: ������� ������ 21.04.2003  ������� ���������� ������� �����
*                                             ������� SHOW()
*----------------------------------------------------------------------------------------
	IF THIS.ENABLED
         * ��������� ������
		THIS.ENABLED = .F.
        * ���������� ���� ���������
		THISFORM.SHOW()
	ENDIF
	ENDPROC
ENDDEFINE

*------------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: frmInTopLevel
* ���������......:
*------------------------------------------------------------------------------------------
DEFINE CLASS frmInTopLevel AS frmFoxMain
*------------------------------------------------------------------------------------------
* ��������.......: �����,��������� �� ������ �������������� ���������� ������ frmFOXMAIN
*                  - ������ ����� ���� IN TOP LEVEL ��� ������ � ������������ � �������
*                  ������� ������ �������� ����� AS-TOP-LEVEL
*------------------------------------------------------------------------------------------
* ���������......: ������� ���������� ���
* ����������.....: Logical	������ ��������� .T.
*------------------------------------------------------------------------------------------
* ��������.......: ��������� ������� 06.07.2005
* �����������....:
*------------------------------------------------------------------------------------------
     DESKTOP    = .T.  && �������� ������������ �� ������
     SHOWWINDOW = 1    && IN-TOP-LEVEL FORM

ENDDEFINE

*------------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: frmFoxMain
* ���������......:
*------------------------------------------------------------------------------------------
DEFINE CLASS frmFoxMain AS FORM
*------------------------------------------------------------------------------------------
* ��������.......: ����� ��������� ����������� �����-����.
*------------------------------------------------------------------------------------------
* ���������......: _tcNameWind - ���������� ��� ����
* ����������.....: Logical	������ ��������� .T.
*------------------------------------------------------------------------------------------
* ��������.......: ��������� ������� 06.07.2005
* �����������....:
*------------------------------------------------------------------------------------------

*------------------------------------------------------------------------------------------
* ���������......: prg_msg_cmn.prg
* �����..........: frmFoxMain
* ���������......: INIT()
*------------------------------------------------------------------------------------------
	PROCEDURE INIT
*------------------------------------------------------------------------------------------
* ��������.......: ������������� �����
*------------------------------------------------------------------------------------------
* ���������......: _tcNameWind - ��� ����
* ����������.....: Logical	������ ��������� .T.
*------------------------------------------------------------------------------------------
* ��������.......: ��������� ������� 06.07.2005
* �����������....:
*------------------------------------------------------------------------------------------
	LPARAMETERS _tcNameWind

	THIS.NAME = _tcNameWind
ENDDEFINE

