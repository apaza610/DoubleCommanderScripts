local params = {...}
local myfileattr
local webExtFolder = "D:\\apz\\templates\\webExt "

if #params == 1 then -- We got at least one parameter?
  myfileattr = SysUtils.FileGetAttr(params[1])
  if myfileattr > 0 then -- We got a valid attribute?
     if math.floor(myfileattr / 0x00000010) % 2 ~= 0 then
	 	-- bit 4 is set? So it's a directory.
      	DC.ExecuteCommand("cm_NewTab")
      	DC.ExecuteCommand("cm_ChangeDir", params[1])
	  else								  --copiar 📁 webExt a selected item 📁
		  --Dialogs.MessageBox("parametro1: "..params[1], "ojo")	--D:\temp\mivideo.mp4
		  local extn =	SysUtils.ExtractFileExt(params[1])	   --.mp4
		  local pathFileNoExtn = params[1]:gsub(extn, "")		   ----D:\temp\mivideo
		  --SysUtils.CreateDirectory("")
		  os.execute("robocopy "..webExtFolder..pathFileNoExtn.." /e")

		  --movemos el video dentro el folder 0media renombrado como video.mp4
		  os.execute("move "..params[1].." "..pathFileNoExtn.."\\0media\\vid0.mp4")
    end
  end
end