*-------------------------------------------------------------------------------
* ASCII ����
*-------------------------------------------------------------------------------
#DEFINE TAB         	    CHR(9)
#DEFINE LF				    CHR(10)
#DEFINE CR				    CHR(13)
#DEFINE CR_LF			    CR+LF
#DEFINE CR_ALT			    CHR(154)   && ��� ������ ENTER �� ���������� ������
*-------------------------------------------------------------------------------
* ����������� ����� ��� ������ � �������� ���������� ����������� MESSAGEBOX() 
* (��������� MsgCmn()) ���������� ���� - Prg_Msg_Cmn.prg
*-------------------------------------------------------------------------------
							* � ������� ����� ����� �����������
#DEFINE MSG_ICONSTOP        PATH_IMG+'bmp\mbx01.bmp'
							* ����� �������
#DEFINE MSG_ICONQUESTION    PATH_IMG+'bmp\mbx02.bmp'
							* ��������������� ���������
#DEFINE MSG_ICONEXCLAMATION PATH_IMG+'bmp\mbx03.bmp'
							* ����������
#DEFINE MSG_ICONINFORMATION PATH_IMG+'bmp\mbx04.bmp'
							* ��������������� ���� � ������� ������������
#DEFINE MSG_ICONSTOPSTOP    PATH_IMG+'bmp\mbx05.bmp'
							* ����������� �����
#DEFINE MSG_ICONCLOCK       PATH_IMG+'bmp\clock.bmp'
