local pedsrestrict = 
{
	"a_m_m_acult_01",
	"a_m_o_acult_01",
	"a_m_o_acult_02",
	"a_m_y_acult_01",
	"a_m_y_acult_02",
	"csb_stripper_01",
	"csb_stripper_02",	
	"mp_f_stripperlite",	
	"s_f_y_stripperlite",	
	"s_f_y_stripper_01",	
	"s_f_y_stripper_02",
	"s_f_y_sheriff_01",
	"s_m_y_sheriff_01",
	-- "",	
}


function restrictpeds()
	local ped = GetPlayerPed(-1)
	local outfit = GetEntityModel(ped)
	
	for i = 1, #pedsrestrict, 1 do
		local restricted = GetHashKey(pedsrestrict[i])
		if outfit == restricted then
			local newped = GetHashKey("a_m_y_hipster_01")
			RequestModel(newped)
			while not HasModelLoaded(newped) do
				Citizen.Wait()
			end
			SetPlayerModel(PlayerId(), newped)
			SetModelAsNoLongerNeeded(newped)
			TriggerEvent("chatMessage", "[System]", { 255,0,0}, "Trying to spawn restricted model.")
		end
	end
end

Citizen.CreateThread(function()
	while true do
	
		local ped = GetPlayerPed(-1)
		if DoesEntityExist(ped) then
			restrictpeds()
		end
		Citizen.Wait(0)
	end
end)