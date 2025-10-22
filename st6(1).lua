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
    local i,len4,len3,len2,len1,len_max=1,0,0,0,0,0
    while i<=#t do
      local l,r=i,i
      str2=t[i]                           
        while t[l-1]==t[r+1] and t[l-1] and t[r+1] do   --< forming a string with current  character index 
          str2=t[l-1]..str2..t[r+1]
          l=l-1
          r=r+1
        end
        res.m=str2              --< put string in table with constant key, outside of while loop in case of
                                -- string with 1 character 
        len2=str2:len()        
        len1=math.max(len1,len2)    --< max lenght outside of for/while loop bc if inside it would be constantly rewritten
        if len1==len2 then str2_m=res.m end   --< len2 exist in main chunk of function > len2 changing, when condition met 
                                              --  res.m assigned to stirng that will be changed if later will be longer string
        if t[i]==t[i+1] then        --< for even string two same characters will be in the middle, if two same character met one
                                    --  after another we using while loop for check that string 
          str3=t[i]..t[i+1]
          l=i
          r=i
          while t[l-1]==t[r+2] and t[l-1] and t[r+2] do       --< forming a string for even strings
            str3=t[l-1]..str3..t[r+2]
            l=l-1
            r=r+1
          end
          res.m1=str3               --< outside of while loop in case of only two characters
          len3=str3:len()
        end

      len4=math.max(len4,len3)    --< max lenght outside of condition, can it be inside?

      if len4==len3 then str3_m=res.m1 end
      i=i+1 
    end

    len_max=math.max(len1,len4)     --< check which string are longer even or odd

    if len_max==len1 then res_max=str2_m      --< assing corresponding string to result
      else res_max=str3_m
    end

return res_max,len_max  
end

function ot(s,l)
  print("The longest string: " .."\"".. s .."\"" .. " with number of characters: " ..l..".")
end
local s1,l1=ch(tb1)
ot(s1,l1)

