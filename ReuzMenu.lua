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

  --Обновление
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
  sampAddChatMessage("{FF0000}[Menu]{FFFFFF}Ахуенное меню успешно загружено. Авторы: {00FF00}Reuz {FFFFFF}и{00FF00} .suarez {FFFFFF}для активации нажмите на F3.")

  downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            updateIni = inicfg.load(nil, update_path)
            if tonumber(updateIni.info.vers) > script_vers then
                sampAddChatMessage("{FF0000}[Menu]{FFFFFF}У скрипта обновление! Новая версия: " .. updateIni.info.vers_text, -1)
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
                    sampAddChatMessage("Скрипт успешно обновлен!", -1)
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
	 imgui.Begin(u8"Главное меню", main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoMove)
	 imgui.SwitchContext()
    themes.SwitchColorTheme(5)

	if imgui.Button(u8"Телепорты", imgui.ImVec2(70, 20)) then
	page = 1
	end
	imgui.SameLine()
	if imgui.Button(u8"Авто", imgui.ImVec2(35, 20)) then
	page = 2
	end
	imgui.SameLine()
	if imgui.Button(u8"Оружие", imgui.ImVec2(50, 20)) then
	page = 3
	end
	imgui.SameLine()
	if imgui.Button(u8"Анимации", imgui.ImVec2(65, 20)) then
	page = 4
	end
	imgui.SameLine()
	if imgui.Button(u8"Прочее", imgui.ImVec2(50, 20)) then
	page = 5
	end
	imgui.SameLine()
	if imgui.Button(u8"Обновление") then
	page = 6
	end

  end

if (page == 1) then
	 imgui.Text(u8"Важные места")
	   if imgui.Button(u8 "Дом отдыха") then
	    setCharCoordinates(PLAYER_PED, -1646.21, -2257.32, 32.15)
    end
		imgui.SameLine()
	if imgui.Button(u8 "Гора дрифтеров") then
		setCharCoordinates(PLAYER_PED, -2403.93, -595.89, 132.64)
		end
		imgui.Text("")
		imgui.Text(u8"Дрифт споты")
			if imgui.Button(u8 'Спот СФПД') then
	   setCharCoordinates(PLAYER_PED, -1703.68, 640.67, 24.89)
	   end
	   imgui.SameLine()

	if imgui.Button(u8 'Спот ЛС Маркет') then
	   setCharCoordinates(PLAYER_PED, 795.71, -1417.34, 13.38)
	   end
	   imgui.SameLine()
	if imgui.Button(u8"Спот 360") then
       setCharCoordinates(PLAYER_PED, -1882.16, 1152.27, 45.29)
	   end
	   imgui.SameLine()
	if imgui.Button(u8"Казино ЛВ") then
	   setCharCoordinates(PLAYER_PED, 2357.55, 2161.85, 10.72)
	   end
	   imgui.SameLine()
	 if imgui.Button(u8"Ухо") then
	 setCharCoordinates(PLAYER_PED, -325.27, 1522.07, 75.35)
	 end
	 if imgui.Button(u8"Классика") then
	 setCharCoordinates(PLAYER_PED, -2009.73, 685.94, 45.29)
	 end
	 imgui.Text("")
	   imgui.Text(u8"Ралли")
	   if imgui.Button(u8"Боковой старт слева") then
		setCharCoordinates(PLAYER_PED, 1578.28, 46.18, 25.24)
		end
		imgui.SameLine()
		if imgui.Button(u8"Центральный старт") then
		setCharCoordinates(PLAYER_PED, 1553.36, 50.11, 25.02)
		end

		imgui.SameLine()
	    if imgui.Button(u8"Боковой старт справа") then
	    setCharCoordinates(PLAYER_PED, 1528.54, 39.97, 24.58)
		end

	   imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"Авторы:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"и")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())
	   end
if (page == 2) then
imgui.Text(u8"Дрифт кары")

      if imgui.Button("Elegy") then
	  sampSendChat("/veh elegy 1 1")
	  end

	   imgui.SameLine()

	   if imgui.Button ("Blista") then
	   sampSendChat("/veh blista 1 1")
	   end




imgui.Text("")
imgui.Text(u8"Гоночные авто")
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
imgui.Text(u8"Раллийные авто")
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
       imgui.Text(u8"Настройки авто:")

	   if imgui.Button(u8"Двигатель") then
	   sampSendChat("/en")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"Фары") then
	   sampSendChat("/li")
	   end

       if imgui.Button(u8"Нитро") then
	   sampSendChat("/nitro")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"GMCar") then
	   sampSendChat("/gmcar")
	   end

	   imgui.SameLine()

	   if imgui.Button(u8"Удалить авто") then
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
  imgui.Text(u8"Перекраска авто")
  imgui.SetCursorPos(imgui.ImVec2(280, 255))
if imgui.Button(u8"Чёрный") then
sampSendChat("/carcolor 0 0")
end
imgui.SameLine()
if imgui.Button(u8"Белый") then
sampSendChat("/carcolor 1 1")
end
imgui.SameLine()
if imgui.Button(u8"Красный") then
sampSendChat("/carcolor 3 3 ")
end
imgui.SetCursorPos(imgui.ImVec2(280, 280))
if imgui.Button(u8"Голубой") then
sampSendChat("/carcolor 2 2")
end
imgui.SameLine()
if imgui.Button(u8"Фиолетовый") then
sampSendChat("/carcolor 211 211")
end
imgui.SetCursorPos(imgui.ImVec2(280, 305))
if imgui.Button(u8"Зелёный") then
sampSendChat("/carcolor 86 86")
end
imgui.SameLine()

if imgui.Button(u8"Жёлтый") then
sampSendChat("/carcolor 6 6")
end
imgui.SetCursorPos(imgui.ImVec2(275, 335))
imgui.Text(u8"Дальше пока не придумал :Р")

	 imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"Авторы:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"и")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())


end

if (page == 3) then

imgui.Text("")
imgui.Text(u8"Пистолеты")

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

imgui.Text(u8"Дробовики")

   if imgui.Button(u8"Дробовик") then
   sampSendChat("/gun 25 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Обрез") then
   sampSendChat("/gun 26 15000")
   end

   imgui.SameLine()

   if imgui.Button("SPAS") then
   sampSendChat("/gun 27 15000")
   end

imgui.Text(u8"Пистолеты-пулемёты")

   if imgui.Button(u8"Узи") then
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

imgui.Text(u8"Автоматы")

   if imgui.Button(u8"АК-47") then
   sampSendChat("/gun 30 15000")
   end

   imgui.SameLine()

   if imgui.Button("M4A1") then
   sampSendChat("/gun 31 15000")
   end

imgui.Text(u8"Винтовки")

   if imgui.Button(u8"Охотничья") then
   sampSendChat("/gun 33 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Снайперская винтока") then
   sampSendChat("/gun 34 15000")
   end

 imgui.Text(u8"Взрыво-опасное")

   if imgui.Button(u8"РПГ") then
   sampSendChat("/gun 35 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Самонаводка") then
   sampSendChat("/gun 36 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Огнемёт") then
   sampSendChat("/gun 37 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Взрыв-пакет") then
   sampSendChat("/gun 39 15000")
   end

   imgui.SameLine()

   if imgui.Button(u8"Детонатор") then
   sampSendChat("/gun 40 15000")
   end

   imgui.SetCursorPos(imgui.ImVec2(5, 350))
   if imgui.Button(u8"Удалить всё оружие", imgui.ImVec2(148, 25)) then
   sampSendChat("/rw")
   end

imgui.SetCursorPos(imgui.ImVec2(170, 50))
imgui.Text(u8"Выдача оружия(нажать на кнопку)")

imgui.SetCursorPos(imgui.ImVec2(5, 580))
	   imgui.Text(u8"Авторы:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"и")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())

	   end

if (page == 4) then
imgui.SetCursorPos(imgui.ImVec2(5, 50))
imgui.Text("")
 imgui.Text(u8"Анимации сидеть")
 if imgui.Button(u8"Сесть назад") then
 sampSendChat("/sit")
 end
  imgui.SameLine()
  if imgui.Button(u8"Сесть вперёд") then
  sampSendChat("/seat")
  end
  if imgui.Button(u8"Сесть на землю") then
  sampSendChat("/gro")
  end
  imgui.Text("")
  imgui.Text(u8"Анимации лежать")
  if imgui.Button(u8"Лежать #1") then
  sampSendChat("/lay 1")
  end

  imgui.SameLine()

  if imgui.Button(u8"Лежать #2") then
  sampSendChat("/lay 2")
  end

  imgui.SameLine()

  if imgui.Button(u8"Лежать #3") then
  sampSendChat("/lay 3")
  end

  if imgui.Button(u8"Лечь спать вправо") then
  sampSendChat("/sleepr")
  end

  imgui.SameLine()

  if imgui.Button(u8"Лечь спать влево") then
  sampSendChat("/sleepl")
  end
  imgui.Text("")
  imgui.Text(u8"Уператься")

  if imgui.Button(u8"Упереться на (вперёд)") then
  sampSendChat("/tlean")
  end

  imgui.SameLine()

  if imgui.Button(u8"Упереться назад") then
  sampSendChat("/lean 1")
  end

  if imgui.Button(u8"Упереться в бок") then
  sampSendChat("/lean 2")
  end

  imgui.SameLine()

  if imgui.Button(u8"Упереться как коп") then
  sampSendChat("/lean 3")
  end

 imgui.Text("")
 imgui.Text(u8"Держание бит")
   if imgui.Button(u8"Анимация #1") then
   sampSendChat("/bat 1")
   end

	imgui.SameLine()

   if imgui.Button(u8"Анимация #2") then
   sampSendChat("/bat 2")
   end

   imgui.Text("")

imgui.Text(u8"Рофл-анимки")

 if imgui.Button(u8"обосцать") then
 sampSendChat("/piss")
 end

 imgui.SameLine()

 if imgui.Button(u8"Почесать яички") then
 sampSendChat("/balls")
 end

 imgui.Text("")
 imgui.Text(u8"Падение")

 if imgui.Button(u8"Упасть вперёд") then
 sampSendChat("/frontfall")
 end

 imgui.SameLine()

 if imgui.Button(u8"Упасть назад") then
 sampSendChat("/flip")
 end

imgui.SetCursorPos(imgui.ImVec2(340, 65))
 imgui.Text(u8"Прочее")
 imgui.SetCursorPos(imgui.ImVec2(340, 85))
  if imgui.Button(u8"Выставить руку перед собой и прицелиться") then
  sampSendChat("/aim")
  end

  imgui.SetCursorPos(imgui.ImVec2(340, 110))
  if imgui.Button(u8"Ахуеть от жизни") then
  sampSendChat("/rollfall")
  end

   imgui.SetCursorPos(imgui.ImVec2(340, 135))
   if imgui.Button(u8"Курить и упереться назад") then
   sampSendChat("/asmoke 1")
   end

   imgui.SetCursorPos(imgui.ImVec2(340, 200))
   imgui.Text(u8"Анимации танцев")
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
	   imgui.Text(u8"Авторы:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"и")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())

end


if (page == 5) then

    if imgui.Button("GM") then
	sampSendChat("/gm")
	end

	if imgui.Button(u8"Очистка чата") then
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
	   imgui.Text(u8"пїЅпїЅпїЅпїЅпїЅпїЅ:")
	   imgui.SameLine()
	   imgui.TextColored(imgui.ImVec4(0, 255, 0, 1.0),"Reuz")
	   imgui.SameLine()
	   imgui.Text(u8"пїЅ")
       imgui.TextColored(imgui.ImVec4(255, 229, 0, 1.0 ), u8'.suarez', imgui.SameLine())
       end

if page == 6 then
imgui.Text(u8"Скрипт был успешно обновлён и вот его изменения:")
imgui.Text("")
imgui.Text(u8"Было добавлено автообновление, и также эта страница, а ещё была одна провальная попытка)")
end
		imgui.End()
end
