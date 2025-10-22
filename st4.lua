local s = "abcabcbb"


local ex=function(s)
    local t1={}   
    local t_len
    function b1(s)
        local  t2={}
        local len=s:len()        
        for i=1,len do
            t2[i]=string.byte(s,i)        
        end
    return t2
    end
    t1=b1(s)
    for i,v in ipairs(t1) do
   -- print(t1[i])
    end

   function b2()  
    local t3={}
    local k=#t3+1
    for i1,v1 in ipairs(t1) do              
        for i2,v2 in ipairs(t3) do
            if v1~=v2 then
            table.insert(t3,k,t1[i1])
            print(t3[i2])
            return t3
            end

        end

    end
   end
 
end



st3=ex(s)
print(st3)

function b1(s1)
        local len=string.len(s1)
        local  t1={}
        for i=1,len do
            t1[i]=string.byte(s1,i)
           
        end
return t1

    end

local s3 = "pwpkew"
local str3=b1(s3)
--for i,v in ipairs(str3) do print (str3[i]) end
function b2(t)  
    local t3={}
function dupe(t)
    local t_dup={}
    for k,v in ipairs (t) do
        t_dup[v]=false
    end
return t_dup

end

 local dupe1=dupe(str3)
    for i,v in pairs(dupe1) do print (i,v) end

    function lol_1(t)
        
        
        local count_max=0
        for i1,v1 in ipairs(t) do 
            local t_temp={}
            local count=0
            for i2=i1,i2<=#t do  
                if (t_temp[t[i2]] == nil) then 
                t_temp[v1]=i1  
                count=count+1
                if count_max<count then count_max=count end
            end
        end
            

            
end
end
end

 function map(t)
    local map={}
    for i,v in ipairs(t) do

        map[i]=v
    end
    return map
end

local map1=map(str3)
    for i,v in pairs(map1) do print (i,v) end
 

b2(str3)

function findDuplicates(t)
    seen = {}
    duplicated = {}
    for key,val in pairs(t) do
        if seen[val] then
            duplicated[val] = true
        else 
            seen[val] = true
        end 
    end 
    return duplicated
end 




 function lol_1(t)

        local count_max=0
        for i1,v1 in ipairs(t) do 
            local t_temp={}
            local count=0
            local i2=i1
            
            for i2=1,#t do  

                if (t_temp[t[i2]] ~= nil) then break end
                t_temp[v1]=i1  
                count=count+1
                if count_max<count then count_max=count end

            end
        end
         print(count_max)
      return count_max  

end


lol_1(str3)



