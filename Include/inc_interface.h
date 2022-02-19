*-------------------------------------------------------------------------------
* ASCII коды
*-------------------------------------------------------------------------------
#DEFINE TAB         	    CHR(9)
#DEFINE LF				    CHR(10)
#DEFINE CR				    CHR(13)
#DEFINE CR_LF			    CR+LF
#DEFINE CR_ALT			    CHR(154)   && для замены ENTER на печатаемый символ
*-------------------------------------------------------------------------------
* Стандартные иконы для работы с функцией заменяющей стандартную MESSAGEBOX() 
* (процедура MsgCmn()) програмный файл - Prg_Msg_Cmn.prg
*-------------------------------------------------------------------------------
							* в красном круге белое перекрестие
#DEFINE MSG_ICONSTOP        PATH_IMG+'bmp\mbx01.bmp'
							* вывод вопроса
#DEFINE MSG_ICONQUESTION    PATH_IMG+'bmp\mbx02.bmp'
							* предупреждающее сообщение
#DEFINE MSG_ICONEXCLAMATION PATH_IMG+'bmp\mbx03.bmp'
							* информация
#DEFINE MSG_ICONINFORMATION PATH_IMG+'bmp\mbx04.bmp'
							* восклицательный знак в красном треугольнике
#DEFINE MSG_ICONSTOPSTOP    PATH_IMG+'bmp\mbx05.bmp'
							* изображение часов
#DEFINE MSG_ICONCLOCK       PATH_IMG+'bmp\clock.bmp'
