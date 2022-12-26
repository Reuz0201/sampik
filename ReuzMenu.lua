script_name ("ImguiMenu")
script_authors ("Reuz, .suarez")

require "lib.moonloader"

local imgui = require "imgui"
local themes = import "resource/imgui_themes.lua"
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local sw, sh = getScreenResolution()
local main_window_state = imgui.ImBool(false)
local page = page
local anim = anim

  --����������
local inicfg = require "inicfg"
local dlstatus = require('moonloader').download_status

update_state = false

local script_vers = 3
local script_vers_text = "3"

local update_url = "https://raw.githubusercontent.com/Reuz0201/sampik/main/update.ini"
local update_path = getWorkingDirectory() .. "/update.ini"

local script_url = "https://github.com/Reuz0201/sampik/blob/main/ReuzMenu.lua?raw=true"
local script_path = thisScript().path


function main()
if not isSampfuncsLoaded() or not isSampLoaded() then
    return
end
while not isSampAvailable() do
    wait(0)
end
  sampAddChatMessage("{FF0000}[Menu]{FFFFFF}�������� ���� ������� ���������. ������: {00FF00}Reuz {FFFFFF}�{00FF00} .suarez {FFFFFF}��� ��������� ������� �� F3.")

  downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            updateIni = inicfg.load(nil, update_path)
            if tonumber(updateIni.info.vers) > script_vers then
                sampAddChatMessage("{FF0000}[Menu]{FFFFFF}� ������� ����������! ����� ������: " .. updateIni.info.vers_text, -1)
                update_state = true
            end
            os.remove(update_path)
        end
    end)

while true do
     wait(0)
	 
	 if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage("������ ������� ��������!", -1)
                    thisScript():reload()
                end
            end)
            break
        end
	 
     if wasKeyPressed(VK_F3) then
       main_window_state.v = not main_window_state.v
     end
     imgui.Process = main_window_state.v
   end
end


function imgui.OnDrawFrame()
  if main_window_state.v then
    imgui.SetNextWindowSize(imgui.ImVec2(600, 600), imgui.Cond.FirstUseEver)
	 imgui.SetNextWindowPos(imgui.ImVec2((sw / 2), sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
	 imgui.Begin(u8"������� ����", main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
	 imgui.SwitchContext()
    themes.SwitchColorTheme(5)

	if imgui.Button(u8"���������", imgui.ImVec2(70, 20)) then
	page = 1
	end
	imgui.SameLine()
	if imgui.Button(u8"����", imgui.ImVec2(35, 20)) then
	page = 2
	end
	imgui.SameLine()
	if imgui.Button(u8"������", imgui.ImVec2(50, 20)) then
	page = 3
	end
	imgui.SameLine()
	if imgui.Button(u8"��������", imgui.ImVec2(65, 20)) then
	page = 4
	end
	imgui.SameLine()
	if imgui.Button(u8"������", imgui.ImVec2(50, 20)) then
	page = 5
	end
	imgui.SameLine()
	if imgui.Button(u8"����������") then
	page = 6
	end

  end

if (page == 1) then
	 imgui.Text(u8"������ �����")
	   if imgui.Button(u8 "��� ������") then
	    setCharCoordinates(PLAYER_PED, -1646.21, -2257.32, 32.15)
    end
		imgui.SameLine()
	if imgui.Button(u8 "���� ���������") then
		setCharCoordinates(PLAYER_PED, -2403.93, -595.89, 132.64)
		end
		imgui.Text("")
		imgui.Text(u8"����� �����")
			if imgui.Button(u8 '���� ����') then
	   setCharCoordinates(PLAYER_PED, -1703.68, 640.67, 24.89)
	   end
	   imgui.SameLine()

	if imgui.Button(u8 '���� �� ������') then
	   setCharCoordinates(PLAYER_PED, 795.71, -1417.34, 13.38)
	   end
	   imgui.SameLine()
	if imgui.Button(u8"���� 360") then
       setCharCoordinates(PLAYER_PED, -1882.16, 1152.27, 45.29)
	   end
	   imgui.SameLine()
	if imgui.Button(u8"������ ��") then
	   setCharCoordinates(PLAYER_PED, 2357.55, 2161.85, 10.72)
	   end
	   imgui.SameLine()
	 if imgui.Button(u8"���") then
	 setCharCoordinates(PLAYER_PED, -325.27, 1522.07, 75.35)
	 end
	 if imgui.Button(u8"��������") then
	 setCharCoordinates(PLAYER_PED, -2009.73, 685.94, 45.29)
	 end
	 imgui.Text("")
	   imgui.Text(u8"�����")
	   if imgui.Button(u8"������� ����� �����") then
		setCharCoordinates(PLAYER_PED, 1578.28, 46.18, 25.24)
		end
		imgui.SameLine()
		if imgui.Button(u8"����������� �����") then
		setCharCoordinates(PLAYER_PED, 1553.36, 50.11, 25.02)
		end

		imgui.SameLine()
	    if imgui.Button(u8"������� ����� ������") then
	    setCharCoordinates(PLAYER_PED, 1528.54, 39.97, 24.58)
		end

	   imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"������:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"�")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())
	   end
if (page == 2) then
imgui.Text(u8"����� ����")

      if imgui.Button("Elegy") then
	  sampSendChat("/veh elegy 1 1")
	  end

	   imgui.SameLine()

	   if imgui.Button ("Blista") then
	   sampSendChat("/veh blista 1 1")
	   end




imgui.Text("")
imgui.Text(u8"�������� ����")
	   if imgui.Button("Infernus") then
	   sampSendChat("/veh 411 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button ("Turismo") then
	   sampSendChat("/veh turismo 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button ("Bullet") then
	   sampSendChat("/veh Bullet 1 1")
	   end

	   imgui.SameLine()

	    if imgui.Button ("Cheetah") then
	   sampSendChat("/veh cheetah 1 1")
	   end

	  imgui.SameLine()

	   if imgui.Button ("ZR350") then
	   sampSendChat("/veh zr 1 1")
	   end

	   imgui.SameLine()
	   if imgui.Button("SuperGT") then
	   sampSendChat("/veh super 1 1")
	   end
	    imgui.SameLine()

	   if imgui.Button("Elegant") then
	   sampSendChat("/veh elegant 1 1")
	   end

imgui.Text("")
imgui.Text(u8"��������� ����")
	   if imgui.Button ("Sabre") then
	   sampSendChat("/veh sabre 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button ("Clover") then
	   sampSendChat("/veh clover 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button ("Phoenix") then
	   sampSendChat("/veh Phoenix 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button("BobCat") then
	   sampSendChat("/veh bobcat 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button("Yosemite") then
	   sampSendChat("/veh 554 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button("Club") then
	   sampSendChat("/veh club 1 1")
	   end

	   imgui.SameLine()

	   if imgui.Button("Flash") then
	   sampSendChat("/veh flash")
	   end

	   imgui.SameLine()

	   if imgui.Button("Picador") then
	   sampSendChat("/veh picador 1 1")
	   end



	   imgui.SetCursorPos(imgui.ImVec2(5, 210))
imgui.Text("")
       imgui.Text(u8"��������� ����:")

	   if imgui.Button(u8"���������") then
	   sampSendChat("/en")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"����") then
	   sampSendChat("/li")
	   end

       if imgui.Button(u8"�����") then
	   sampSendChat("/nitro")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"GMCar") then
	   sampSendChat("/gmcar")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"������� ����") then
	   sampSendChat("/delveh")
	   end

	   imgui.SameLine()

	   if imgui.Button("FlipCar") then
	   sampSendChat("/flipcar")
	   end

	   	if imgui.Button("Savepos") then
	sampSendChat("/savepos")
	end

	imgui.SameLine()

	if imgui.Button("Gopos") then
    sampSendChat("/gopos")
	end

  imgui.SetCursorPos(imgui.ImVec2(280, 230))
  imgui.Text(u8"���������� ����")
  imgui.SetCursorPos(imgui.ImVec2(280, 255))
if imgui.Button(u8"׸����") then
sampSendChat("/carcolor 0 0")
end
imgui.SameLine()
if imgui.Button(u8"�����") then
sampSendChat("/carcolor 1 1")
end
imgui.SameLine()
if imgui.Button(u8"�������") then
sampSendChat("/carcolor 3 3 ")
end
imgui.SetCursorPos(imgui.ImVec2(280, 280))
if imgui.Button(u8"�������") then
sampSendChat("/carcolor 2 2")
end
imgui.SameLine()
if imgui.Button(u8"����������") then
sampSendChat("/carcolor 211 211")
end
imgui.SetCursorPos(imgui.ImVec2(280, 305))
if imgui.Button(u8"������") then
sampSendChat("/carcolor 86 86")
end
imgui.SameLine()

if imgui.Button(u8"Ƹ����") then
sampSendChat("/carcolor 6 6")
end
imgui.SetCursorPos(imgui.ImVec2(275, 335))
imgui.Text(u8"������ ���� �� �������� :�")

	 imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"������:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"�")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())


end

if (page == 3) then

imgui.Text("")
imgui.Text(u8"���������")

    if imgui.Button("Colt") then
   sampSendChat("/gun 22 15000")
   end

   imgui.SameLine()


    if imgui.Button("USP-S") then
   sampSendChat("/gun 23 15000")
   end

    imgui.SameLine()

   if imgui.Button("Deagle") then
   sampSendChat("/gun 24 15000")
   end

imgui.Text(u8"���������")

   if imgui.Button(u8"��������") then
   sampSendChat("/gun 25 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"�����") then
   sampSendChat("/gun 26 15000")
   end

   imgui.SameLine()

   if imgui.Button("SPAS") then
   sampSendChat("/gun 27 15000")
   end

imgui.Text(u8"���������-�������")

   if imgui.Button(u8"���") then
   sampSendChat("/gun 28 15000")
   end

   imgui.SameLine()

   if imgui.Button("Tec-9") then
   sampSendChat("/gun 32 15000")
   end

   imgui.SameLine()



   if imgui.Button("MP5") then
   sampSendChat("/gun 29 15000")
   end

imgui.Text(u8"��������")

   if imgui.Button(u8"��-47") then
   sampSendChat("/gun 30 15000")
   end

   imgui.SameLine()

   if imgui.Button("M4A1") then
   sampSendChat("/gun 31 15000")
   end

imgui.Text(u8"��������")

   if imgui.Button(u8"���������") then
   sampSendChat("/gun 33 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"����������� �������") then
   sampSendChat("/gun 34 15000")
   end

 imgui.Text(u8"������-�������")

   if imgui.Button(u8"���") then
   sampSendChat("/gun 35 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"�����������") then
   sampSendChat("/gun 36 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"������") then
   sampSendChat("/gun 37 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"�����-�����") then
   sampSendChat("/gun 39 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"���������") then
   sampSendChat("/gun 40 15000")
   end

   imgui.SetCursorPos(imgui.ImVec2(5, 350))
   if imgui.Button(u8"������� �� ������", imgui.ImVec2(148, 25)) then
   sampSendChat("/rw")
   end

imgui.SetCursorPos(imgui.ImVec2(170, 50))
imgui.Text(u8"������ ������(������ �� ������)")

imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"������:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"�")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())

	   end

if (page == 4) then
imgui.SetCursorPos(imgui.ImVec2(5, 50))
imgui.Text("")
 imgui.Text(u8"�������� ������")
 if imgui.Button(u8"����� �����") then
 sampSendChat("/sit")
 end
  imgui.SameLine()
  if imgui.Button(u8"����� �����") then
  sampSendChat("/seat")
  end
  if imgui.Button(u8"����� �� �����") then
  sampSendChat("/gro")
  end
  imgui.Text("")
  imgui.Text(u8"�������� ������")
  if imgui.Button(u8"������ #1") then
  sampSendChat("/lay 1")
  end

  imgui.SameLine()

  if imgui.Button(u8"������ #2") then
  sampSendChat("/lay 2")
  end

  imgui.SameLine()

  if imgui.Button(u8"������ #3") then
  sampSendChat("/lay 3")
  end

  if imgui.Button(u8"���� ����� ������") then
  sampSendChat("/sleepr")
  end

  imgui.SameLine()

  if imgui.Button(u8"���� ����� �����") then
  sampSendChat("/sleepl")
  end
  imgui.Text("")
  imgui.Text(u8"���������")

  if imgui.Button(u8"��������� �� (�����)") then
  sampSendChat("/tlean")
  end

  imgui.SameLine()

  if imgui.Button(u8"��������� �����") then
  sampSendChat("/lean 1")
  end

  if imgui.Button(u8"��������� � ���") then
  sampSendChat("/lean 2")
  end

  imgui.SameLine()

  if imgui.Button(u8"��������� ��� ���") then
  sampSendChat("/lean 3")
  end

 imgui.Text("")
 imgui.Text(u8"�������� ���")
   if imgui.Button(u8"�������� #1") then
   sampSendChat("/bat 1")
   end

	imgui.SameLine()

   if imgui.Button(u8"�������� #2") then
   sampSendChat("/bat 2")
   end

   imgui.Text("")

imgui.Text(u8"����-������")

 if imgui.Button(u8"��������") then
 sampSendChat("/piss")
 end

 imgui.SameLine()

 if imgui.Button(u8"�������� �����") then
 sampSendChat("/balls")
 end

 imgui.Text("")
 imgui.Text(u8"�������")

 if imgui.Button(u8"������ �����") then
 sampSendChat("/frontfall")
 end

 imgui.SameLine()

 if imgui.Button(u8"������ �����") then
 sampSendChat("/flip")
 end

imgui.SetCursorPos(imgui.ImVec2(340, 65))
 imgui.Text(u8"������")
 imgui.SetCursorPos(imgui.ImVec2(340, 85))
  if imgui.Button(u8"��������� ���� ����� ����� � �����������") then
  sampSendChat("/aim")
  end

  imgui.SetCursorPos(imgui.ImVec2(340, 110))
  if imgui.Button(u8"������ �� �����") then
  sampSendChat("/rollfall")
  end

   imgui.SetCursorPos(imgui.ImVec2(340, 135))
   if imgui.Button(u8"������ � ��������� �����") then
   sampSendChat("/asmoke 1")
   end

   imgui.SetCursorPos(imgui.ImVec2(340, 200))
   imgui.Text(u8"�������� ������")
   imgui.SetCursorPos(imgui.ImVec2(340, 220))
   if imgui.Button("1") then
   sampSendChat("/dance 1")
   end
   imgui.SameLine()
   if imgui.Button("2") then
   sampSendChat("/dance 2")
   end
   imgui.SameLine()
   if imgui.Button("3") then
   sampSendChat("/dance 3")
   end
   imgui.SameLine()
  if imgui.Button("4") then
   sampSendChat("/dance 4")
   end
  imgui.SetCursorPos(imgui.ImVec2(340, 245))
  if imgui.Button("5") then
   sampSendChat("/dance 5")
   end
   imgui.SameLine()
   if imgui.Button("6") then
   sampSendChat("/dance 6")
   end
   imgui.SameLine()
  if imgui.Button("7") then
   sampSendChat("/dance 7")
   end
   imgui.SameLine()
if imgui.Button("8") then
   sampSendChat("/dance 8")
   end

  imgui.SetCursorPos(imgui.ImVec2(340, 270))
  if imgui.Button("9") then
   sampSendChat("/dance 9")
   end
   imgui.SameLine()
   if imgui.Button("10") then
   sampSendChat("/dance 10")
   end
   imgui.SameLine()
   if imgui.Button("11") then
   sampSendChat("/dance 11")
   end
   imgui.SameLine()
  if imgui.Button("12") then
   sampSendChat("/dance 12")
end
imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"������:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"�")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())

end


if (page == 5) then

    if imgui.Button("GM") then
	sampSendChat("/gm")
	end

	if imgui.Button(u8"������� ����") then
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	sampAddChatMessage("")
	end

imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"������:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"�")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())
       end

if page == 6 then
imgui.Text(u8"������ ��� ������� ������� � ��� ��� ���������:")
imgui.Text("")
imgui.Text(u8"���� ��������� ��������������, � ����� ��� ��������, � ��� ���� ���� ���������� �������)")
end
		imgui.End()
end
