print("initiert")
SLASH_HELLOWORLD1 = '/hiw'
function SlashCmdList.HELLOWORLD(msg, editbox)
	print("HI")
end

function meins_sell()
	for bag = 0, 4 do
		for slot = 1,GetContainerNumSlots(bag) do
			item = GetContainerItemLink(bag,slot)
			if item and string.find(item,161981) and string.find(item,"cff1eff00") then
				UseContainerItem(bag,slot)
			end
		end
	end
end


function meins_indiebank (name)
	for bag = 0, 4 do 
		for slot = 1, GetContainerNumSlots(bag) do 
			local item = GetContainerItemLink(bag,slot)
			if item and string.find(item,name) then
				UseContainerItem(bag,slot)
			end 
		end 
	end 
end

function meins_store(name,wished)
	actual = 0
	for bag = 0, 4 do 
		for slot = 1, GetContainerNumSlots(bag) do 
			local item = GetContainerItemLink(bag,slot)
			if item and string.find(item,name) then
				actual = actual + 1
				if actual > wished then
					UseContainerItem(bag,slot)
					actual = actual - 1
				end
			end 
		end 
	end 
	return actual
end

function meins_get(name, actual, wished)
	for _,bag in pairs({-1,5,6,7,8,9,10,11})do
		for slot = 1,GetContainerNumSlots(bag)do
			local item = GetContainerItemLink(bag,slot)
			if item and string.find(item,name) then
				if actual < wished then
					UseContainerItem(bag,slot)
					actual = actual + 1
				end
			end
		end
	
	end
end

function meins_countitem (itemid, soll)
	counter = 0
	name = GetItemInfo(itemid)
	for bag = 0, 4 do 
		for slot = 1, GetContainerNumSlots(bag) do 
			item = GetContainerItemLink(bag,slot)
			if item and string.find(item,itemid) then
				counter = counter + 1
				name = item
			end 
		end 
	end 
	if counter < soll then
		print(name, ": ", counter, " von: ", soll)
	end
end

function meins_stack(name, wished)
	actual = meins_store(name, wished)
	meins_get(name, actual, wished)
	meins_countitem(name, wished)
end

function meins_count_vz()
	meins_stack(153442,1)
	meins_stack(153443,1)
	meins_stack(153444,1)
	meins_stack(153445,1)
	meins_stack(159785,1)
	meins_stack(159786,1)
	meins_stack(159787,1)
	meins_stack(159788,1)
	meins_stack(159789,1)

end

function meins_count_leder()
	meins_stack(164699,3)
	meins_stack(164700,3)
	meins_stack(164701,3)
	meins_stack(164702,3)
	meins_stack(164703,3)
	meins_stack(164704,3)
	meins_stack(164705,3)
	meins_stack(164706,3)
	meins_stack(164707,3)
	meins_stack(164708,3)
	meins_stack(164711,3)
end

function meins_count_schmied()
	meins_stack(164684,3)
	meins_stack(164685,3)
	meins_stack(164686,3)
	meins_stack(164687,3)
	meins_stack(164688,3)
	meins_stack(164689,3)
	meins_stack(164690,3)
	meins_stack(164691,3)
	meins_stack(164692,3)
	meins_stack(164693,3)
	meins_stack(164718,3)
end

function meins_count_stoff()
	meins_stack(164712,3)
	meins_stack(164713,3)
	meins_stack(164714,3)
	meins_stack(164715,3)
	meins_stack(164716,3)
	meins_stack(164717,3)
end

function meins_count_kriegsrolle()
	meins_stack(158201,1)
	meins_stack(158202,1)
	meins_stack(158204,1)
end

function meins_craft(name, amount)
	print(name)
	print(GetNumTradeSkills())
	for i=1, GetNumTradeSkills() do
		print(GetTradeSkillInfo(i))
		if GetTradeSkillInfo(i) == name then
			CloseTradeSkill();
			DoTradeSkill(i);
			break;
		end
	end
end
