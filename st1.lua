  i = 10; j = "10"; k = "+10"
    a = {}


    a[i] = "one value"
    a[j] = "another value"
    a[k] = "yet another value"
    a.j="another value1"
    print(a[j])            --> another value
    print(a[k])            --> yet another value
    print(a[tonumber(j)])  --> one value
    print(a[tonumber(k)])  --> one value
    print(a.j)
z="t"   cat="i1"
k="st1"

    b={
        x=0,
        y=1,
        t=10,
        cat = "meow",
        i1=7,
        ["st1"]="st1",
        13

      }
    b["0"]=17
   --- print(b["cat"])

    --for i,v in pairs(b) do print (i,v) end
    for k,v in ipairs (b) do print (v) end

     opnames = {["+"] = "add", ["-"] = "sub",
               ["*"] = "mul", ["/"] = "div"}
    
    i = 20; s = "-"
    a = {[i+0] = s, [i+1] = s..s, [i+2] = s..s..s}
    
   -- print(opnames[s])    --> sub
   -- print(a[22])      

   local gt={"meow","woof","squack"

   }
for k,v in ipairs(gt) do print(v) end
print(gt[2])

sum={2,3,4}

print(sum[1]+sum[2])
