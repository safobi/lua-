local path = "C:/Users/IGOR/Desktop/New folder (5)/New folder (5)/BishopRomance/wav_fxe"


function CopyWav(directory)
	local handle=io.open('dir "'..directory..'" /b')
	
	for filename in io.popen('dir "'..directory..'" /b'):lines() do
		print(filename)
		local extention=name:match("^.+()")

	end

end


CopyWav(path)