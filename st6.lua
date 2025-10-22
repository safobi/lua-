local s = "bbbbb"

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
    local res={}
    local i=1
    local len_max=0
    local res_max
    while i~=#t+1 do
    local l=i
    local r=i
    local str2
    local len
      if t[i]~=t[i+1] then 
        str2=t[i]
        while t[l-1]==t[r+1] and t[l-1] and t[r+1] do
          str2=t[l-1]..str2..t[r+1]
          l=l-1
          r=r+1
        end
      else 
        --print(t[i])
        str2=t[i]..t[i+1]
        while t[l-1]==t[r+2] and t[l-1] and t[r+2] do
          str2=t[l-1]..str2..t[r+2]
          l=l-1
          r=r+1  
        end
      end
      len=str2:len()
      len_max=math.max(len_max,len)   
      if len_max==len then
        res_max=str2 
        --print(res_max)
      end
      i=i+1 
    end
return res_max,len_max
end

function ot(s,l)
  print("The longest string: " .."\"".. s .."\"" .. " with number of characters: " ..l..".")
end
local s1,l1=ch(tb1)
ot(s1,l1)

