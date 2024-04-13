local params = {...}
local deseado = "http://localhost/apz/maps/progr/leng/cpp/0douga/Raylib/SkyVaultGames"
if #params == 1 then	--si al menos hay 1 seleccionado
	-- Dialogs.MessageBox("yendo hacia " ..params[1], "Ejecutado!", 0x0040)
	local uri = "http://localhost" .. string.gsub(params[1], "\\", "/"):gsub("D:", "")
	-- Dialogs.MessageBox("yendo hacia " .. uri, "Ejecutado!", 0x0040)
	os.execute("start "..uri)
end 