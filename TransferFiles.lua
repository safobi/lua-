local path = "C:/Users/IGOR/Desktop/New folder (5)/New folder (5)/BishopRomance/wav_fxe"
local path_to_target="C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)\\silen_files"
local source_dir="C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)\\Shared\\silent_12_seconds.wav"
local source_file="silent_12_seconds.wav"
function Names_t(directory)
	local names={}
	local i=1
	local command='dir "'..directory..'" /b'
	local handle=io.popen(command)
	for filename in handle:lines() do
		--local extention=filename:match("^.+(%.wav)$")
		local extention_pos=filename:find(".wav")
			if extention_pos~=nil then
				--local name=filename:sub(1,extention_pos-1)
				names[i]=filename
				i=i+1
			end
	end
handle:close()
return names
end

function Names_c(src_d,dest_d,dir)
	--local name_t="\\123.wav"
	local names=Names_t(dir)
	print(names)
	for i,v in ipairs(names) do
		local name_t="\\"..names[i]
		local command_c='copy "'..src_d..'" "'..dest_d..name_t..'"'
		local handle_c=io.popen(command_c,"r")
		local output=handle_c:read("*all")
	print(output)
	handle_c:close()
	end

end

--io.popen("copy ".."C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)\\Shared/silent_12_seconds.wav".." C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)/silen_files")
Names_c(source_dir,path_to_target,path)
for i,v in ipairs (Names_t(path)) do print (i,v) end