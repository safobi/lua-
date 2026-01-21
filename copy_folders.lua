local path = "D:\\Games\\ModOrganizer2\\mods"
local path_to_target="E:\\MODSCOPY"
local source_dir="C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)\\Shared\\silent_12_seconds.wav"
local source_file="silent_12_seconds.wav"
local modlist="D:\\Games\\ModOrganizer2\\profiles\\ae\\modlist.txt"
function read_copy(file)
	local names={}
	local i=1
	local list=io.open(file, r)
	for name in list:lines() do
		local extention=name:match("^%+")
		if extention then 
			local len=name:len()
			local name_ext=string.sub(name, 2, len)
			names[i]=name_ext
				i=i+1
			end
	end
return names
end




function Names_c(source,target,file)
	--local name_t="\\123.wav"
	local names=read_copy(file)
	for i,v in ipairs(names) do
		local name_t="\\"..names[i]
		local command_c='robocopy "'..source..name_t..'" "'..target..name_t..'"'.." /s".." /e"
		local handle_c=io.popen(command_c,"r")
		local output=handle_c:read("*all")
	print(output)
	handle_c:close()
	end

end

--io.popen("copy ".."C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)\\Shared/silent_12_seconds.wav".." C:\\Users\\IGOR\\Desktop\\New folder (5)\\New folder (5)/silen_files")
Names_c(path,path_to_target,modlist)
--for i,v in ipairs (read_copy(modlist)) do print (i,v) end