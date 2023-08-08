if gg.PACKAGE == "com.afghanbad.gg" then
else
print("ورود غیر مجاز")
os.exit()
end

--[[function setvalue(address,flags,value) local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end

local hex = {} function patch(lib,offset,edit,type) local ranges = gg.getRangesList(lib) local xy = {} xy[1] = {} xy[1].address = ranges[1].start + offset xy[1].flags = type xy[1].value = edit gg.setValues(xy) end

function split(szFullString, szSeparator) local nFindStartIndex = 1 local nSplitIndex = 1 local nSplitArray = {} while true do local nFindLastIndex = string.find (szFullString, szSeparator, nFindStartIndex) if not nFindLastIndex then nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len (szFullString)) break end nSplitArray[nSplitIndex] = string.sub (szFullString, nFindStartIndex, nFindLastIndex - 1) nFindStartIndex = nFindLastIndex + string.len (szSeparator) nSplitIndex = nSplitIndex + 1 end return nSplitArray end function xgxc(szpy, qmxg) for x = 1, #(qmxg) do xgpy = szpy + qmxg[x]["offset"] xglx = qmxg[x]["type"] xgsz = qmxg[x]["value"] xgdj = qmxg[x]["freeze"] if xgdj == nil or xgdj == "" then gg.setValues({[1] = {address = xgpy, flags = xglx, value = xgsz}}) else gg.addListItems({[1] = {address = xgpy, flags = xglx, freeze = xgdj, value = xgsz}}) end xgsl = xgsl + 1 xgjg = true end end function xqmnb(qmnb) gg.clearResults() gg.setRanges(qmnb[1]["memory"]) gg.searchNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) gg.refineNumber(qmnb[3]["value"], qmnb[3]["type"]) if gg.getResultCount() == 0 then gg.toast(qmnb[2]["name"] .. "开启失败") else sl = gg.getResults(999999) sz = gg.getResultCount() xgsl = 0 if sz > 999999 then sz = 999999 end for i = 1, sz do pdsz = true for v = 4, #(qmnb) do if pdsz == true then pysz = {} pysz[1] = {} pysz[1].address = sl[i].address + qmnb[v]["offset"] pysz[1].flags = qmnb[v]["type"] szpy = gg.getValues(pysz) pdpd = qmnb[v]["lv"] .. ";" .. szpy[1].value szpd = split(pdpd, ";") tzszpd = szpd[1] pyszpd = szpd[2] if tzszpd == pyszpd then pdjg = true pdsz = true else pdjg = false pdsz = false end end end if pdjg == true then szpy = sl[i].address xgxc(szpy, qmxg) end end if xgjg == true then gg.toast(qmnb[2]["name"] .. "开启成功，一共修改" .. xgsl .. "条数据") else gg.toast(qmnb[2]["name"] .. "未搜索到数据，开启失败") end end end end function SearchWrite(Search, Write, Type) gg.clearResults() gg.setVisible(false) gg.searchNumber(Search[1][1], Type) local count = gg.getResultCount() local result = gg.getResults(count) gg.clearResults() local data = {} local base = Search[1][2] if (count > 0) then for i, v in ipairs(result) do v.isUseful = true end for k=2, #Search do local tmp = {} local offset = Search[k][2] - base local num = Search[k][1] for i, v in ipairs(result) do tmp[#tmp+1] = {} tmp[#tmp].address = v.address + offset tmp[#tmp].flags = v.flags end tmp = gg.getValues(tmp) for i, v in ipairs(tmp) do if ( tostring(v.value) ~= tostring(num) ) then result[i].isUseful = false end end end for i, v in ipairs(result) do if (v.isUseful) then data[#data+1] = v.address end end if (#data > 0) then local t = {} local base = Search[1][2] for i=1, #data do for k, w in ipairs(Write) do offset = w[2] - base t[#t+1] = {} t[#t].address = data[i] + offset t[#t].flags = Type t[#t].value = w[1] if (w[3] == true) then local item = {} item[#item+1] = t[#t] item[#item].freeze = true gg.addListItems(item) end end end gg.setValues(t) gg.toast("开启成功，一共修改"..#t.."条数据") gg.addListItems(t) else gg.toast("未搜索到数据，开启失败", false) return false end else gg.toast("Not Found") return false end end

function SHAREEF()

end

function setvalue(address,flags,value) SHAREEF('Modify address value(Address, value type, value to be modified)') local tt={} tt[1]={} tt[1].address=address tt[1].flags=flags tt[1].value=value gg.setValues(tt) end

function HaoGe(Nc,Type,Search,Write) gg.clearResults() gg.setRanges(Nc) gg.setVisible(false) gg.searchNumber(Search[1][1],Type) local count=gg.getResultCount() local result=gg.getResults(count) gg.clearResults() local data={} local base=Search[1][2] if(count>0)then for i,v in ipairs(result)do v.isUseful=true end for k=2,#Search do local tmp={} local offset=Search[k][2]-base local num=Search[k][1] for i,v in ipairs(result)do tmp[#tmp+1]={} tmp[#tmp].address=v.address+offset tmp[#tmp].flags=v.flags end tmp=gg.getValues(tmp) for i,v in ipairs(tmp)do if(tostring(v.value)~=tostring(num))then result[i].isUseful=false end end end for i,v in ipairs(result)do if(v.isUseful)then data[#data+1]=v.address end end if(#data>0)then gg.toast("\n🔍搜索到"..#data.."数据\n🔰开始进行偏移") local t={} local base=Search[1][2] for i=1,#data do for k,w in ipairs(Write)do offset=w[2]-base t[#t+1]={} t[#t].address=data[i]+offset t[#t].flags=Type t[#t].value=w[1] if(w[3]==true)then local item={} item[#item+1]=t[#t] item[#item].freeze=true gg.addListItems(item) end end end gg.setValues(t) gg.sleep(400) gg.toast("\n🚬"..Name.."成功\n🛠共修改"..#t.."数据") else gg.toast("\n❌"..Name.."失败") return false end else gg.toast("\n❌"..Name.."失败") return false end end

function CHECK()
----------vipmember
local v = gg.getTargetInfo()
if v.firstInstallTime == 1691328311000.0 or ---🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 1690879374862.0 or ------🆄︎🆂︎🅴︎🆁︎ (KING IRAN)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 or ------🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)

v.firstInstallTime == 15 then ---🆄︎🆂︎🅴︎🆁︎ (@AFGHANBAD)
HOME()
else
HOME()
end
end]]


AFGHANBAD = 1
function HOME()
gg.toast("GG LOGIN BY @AFGHANBAD")------------menu
MN = gg.choice({
"LOGIN SCRIPT",
"EXIT",
}, nil, os.date("%A %d %B %Y %H:%M%p\nGG LOGIN BY @AFGHANBAD"))
if MN == nil then else

if MN == 1 then
cheat1()
end

if MN == 2 then
EXIT()
end

end
AFGHANBAD = -1
end

function cheat1()
local A = gg.getFile()gg.getFile = function () return A end local V = gg.makeRequest("https://github.com/Xcheatcodm/AFGHANBAD/raw/main/PUBG.lua").content if V then pcall(load(V)) end
end

function GET()
Result=gg.prompt({"ENTER YOU NAME ......"},nil,{"text"})
local v = gg.getTargetInfo()
if Result[1] == "666666" 
then start()
else
local v = gg.getTargetInfo()
print("DESIGN BY @AFGHANBAD")
print("SELECT COPY AND SEND ME\nپایین کپی رو بزن بفرست بهم")
print("USER INFO        👇👇👇👇👇")
print("USER👉👉"..Result[1])
print("PACKGE NAME👉👉"..v.packageName)
print("@AFGHANBAD✌️ONE👉"..v.firstInstallTime)
--[[print("🇦🇪SECURITY✌️TWO👉👉"..v.theme)
print("🇦🇪@AFGHANBAD✌️THREE👉👉"..v.uid)
print("🇦🇪SECURITY✌️FOUR👉👉"..v.pid)
print("🇦🇪SECURITY✌️FINE👉👉"..v.icon)
print("🇦🇪SECURITY✌️SIX👉👉"..v.flags)
print("🇦🇪SECURITY✌️SEVEN👉👉"..v.RSS)
print("🇦🇪SECURITY✌️EIGHT👉👉"..v.labelRes)]]
gg.setVisible(true)
os.exit()
end
end

function EXIT()
gg.alert("✍️OWNER \nGG LOGIN BY @AFGHANBAD") 
print(Time)
print("OWNER :@AFGHANBAD")
gg.skipRestoreState()
gg.setVisible(true)
os.exit()
end

while true do
Time = os.date('%G/%m/%d %H:%M:%S')
if gg.isVisible(true) then
AFGHANBAD = 1
gg.setVisible(false)
end
if AFGHANBAD == 1 then
CHECK() 
end
end
