bMADE BY EXTENDO�STATUS_INDICATORS  �  V M �����  ߀ M �����  �  )  M ����&  �I�?���>�̌?@� � � �    � Z �D  �B	NUMBER   I�?���>�̌?@� � � �    � Z �D  ,B	NUMBER    ����&  �I�?���>�̌?@� � � �    � Z �D  �B	NUMBER    ����  �  �  M �����  �    �
o����  '   &  �I�?���>�̌?@� � � �    � Z �D  �B	NUMBER   I�?���>�̌?@� � � �    � Z �D  XB	NUMBER   �  )  M ����I�?���>�̌?@� � � �    � Z �D  ,B	NUMBER    �����   Q VAR    PLAYER_ACTOR    FLAG   SRC �	  {$CLEO .cs}
{$USE debug}
Alloc($PLAYER_ACTOR, 3)

write_debug "MADE BY EXTENDO"
script_name "STATUS_INDICATORS"

:STATUS_INDICATORS_36
wait 0
if 
  Player.IsPlaying(0)
goto_if_false @STATUS_INDICATORS_36
if 
  not Char.IsInAnyCar($PLAYER_ACTOR)
goto_if_false @STATUS_INDICATORS_330
2@ = Char.GetArmor($PLAYER_ACTOR)
if 
  2@ >= 1
goto_if_false @STATUS_INDICATORS_242
1@ = Char.GetHealth($PLAYER_ACTOR)
Text.UseCommands(True)
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� �������� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 65.0, 'NUMBER', 1@)
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� ����� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 43.0, 'NUMBER', 2@)
goto @STATUS_INDICATORS_36

:STATUS_INDICATORS_242
1@ = Char.GetHealth($PLAYER_ACTOR)
Text.UseCommands(True)
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� �������� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 65.0, 'NUMBER', 1@)
goto @STATUS_INDICATORS_36

:STATUS_INDICATORS_330
wait 0
if 
  Char.IsInAnyCar($PLAYER_ACTOR)
goto_if_false @STATUS_INDICATORS_36
if 
  Char.IsInCar($PLAYER_ACTOR, 0@)
gosub_if_false @STATUS_INDICATORS_618
2@ = Char.GetArmor($PLAYER_ACTOR)
3@ = Car.GetHealth(0@)
1@ = Char.GetHealth($PLAYER_ACTOR)
Text.UseCommands(True)
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� �������� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 65.0, 'NUMBER', 1@)
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� ��������� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 54.0, 'NUMBER', 3@)
if 
  2@ >= 1
goto_if_false @STATUS_INDICATORS_330
Text.SetFont(Font.Pricedown)
Text.SetRightJustify(True)
Text.SetScale(0.3, 1.1)
Text.SetColor(255, 255, 255, 255)  // ����� ���� ��� ����� ������
Text.SetEdge(1, 0, 0, 0, 255)
Text.DisplayWithNumber(635.0, 43.0, 'NUMBER', 2@)
goto @STATUS_INDICATORS_330

:STATUS_INDICATORS_618
0@ = Char.StoreCarIsInNoSave($PLAYER_ACTOR)
return
�  __SBFTR 