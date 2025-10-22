local s = "xabbba12abaaaxaab"

function rev(s)
  local len=s:len()
  local t1={}
  local t2={}
  for i=1,len do
    t1[i]=s:sub(i,i)
    local s1=s:reverse()
    t2[i]=s1:sub(i,i)
  end
return t1,t2
end
local tb1,tb2=rev(s)

function ch(t)
    local res_max,str2,str3,str2_m,str3_m
    local res={}
    local l_1=t:len()
    local string_res = ""
    local i,len4,len3,len2,len1,len_max=1,0,0,0,0,0
    local l,r=1,2
    while i<=l_1 do
      print("On index "..i)
        print("L and R are: "..l.." "..r)
        while t:sub(l, l) == t:sub(r, r) and t:sub(l, l) and t:sub(r, r) do
          if string_res:len()<r-l + 1 then
            string_res=t:sub(l, r)
          end
          l=l-1
          r=r+1
      end
    print("And now L and R are: "..l.." "..r)
    if ((r-l) % 2 == 1) then
      print("r-l % 2 =  "..(r-l) % 2)
      l,r=i-1,i+1
    else 
      print("r-l % 2 =  "..(r-l) % 2)
      i = i + 1
      l,r=i,i+1
    end
  end
 

return string_res  
end

local res11111=ch(s)
print(res11111)
function ot(s)
  print("The longest string: " .."\"".. s .."\"" .. " with number of characters: " ..l..".")
end





