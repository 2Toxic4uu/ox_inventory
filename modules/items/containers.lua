local containers = {}

---@class ItemContainerProperties
---@field slots number
---@field maxWeight number
---@field whitelist? table<string, true> | string[]
---@field blacklist? table<string, true> | string[]

local function arrayToSet(tbl)
	local size = #tbl
	local set = table.create(0, size)

	for i = 1, size do
		set[tbl[i]] = true
	end

	return set
end

---Registers items with itemName as containers (i.e. backpacks, wallets).
---@param itemName string
---@param properties ItemContainerProperties
---@todo Rework containers for flexibility, improved data structure; then export this method.
local function setContainerProperties(itemName, properties)
	local blacklist, whitelist = properties.blacklist, properties.whitelist

	if blacklist then
		local tableType = table.type(blacklist)

		if tableType == 'array' then
			blacklist = arrayToSet(blacklist)
		elseif tableType ~= 'hash' then
			TypeError('blacklist', 'table', type(blacklist))
		end
	end

	if whitelist then
		local tableType = table.type(whitelist)

		if tableType == 'array' then
			whitelist = arrayToSet(whitelist)
		elseif tableType ~= 'hash' then
			TypeError('whitelist', 'table', type(whitelist))
		end
	end

	containers[itemName] = {
		size = { properties.slots, properties.maxWeight },
		blacklist = blacklist,
		whitelist = whitelist,
	}
end

setContainerProperties('paperbag', {
	slots = 5,
	maxWeight = 1000,
	blacklist = { 'testburger' }
})

setContainerProperties('pizzabox', {
	slots = 5,
	maxWeight = 1000,
	whitelist = { 'pizza' }
})

setContainerProperties('cardholder', {
	slots = 30,
	maxWeight = 0,
	whitelist = { 'keycardbellaapartment', "keycardbunker", "keycardbunker", "keycardtyhaus", "keycardcabi",
		"keycard6068lamar", "keycardairport", "keycard9075", "keycardeinreise", "keycard7032", "keycardstudio",
		"keycard8209", "keycardunicorn", "keycard7319", "keycard73304", "keycard73302", "keycard73301", 'keycard73305',
		'keycard73307', "keycard6113", "keycard6157", "keycard7055", "keycard6070", "keycard6027", "keycard6190",
		"keycard5014", "keycard5013b", "keycard5009", "keycard5006", "keycardtinyhome", "keycard5012", "keycardmaster",
		"keycard4009", "keycard7037", "keycard5000", "keycard5019a", "keycard6150", "keycard6013", "keycardcayo",
		"keycardlombank18", 'keycardmirrors', 'keycardhenhouse', 'keycard2056a', 'keycardvineyard', 'keycardtinyhome',
		'keycardhole', 'keycard9055', 'keycard6067' }
})

setContainerProperties('burger_box_tate', {
	slots = 10,
	maxWeight = 10000,
	whitelist = { 'tateburger_ribs', 'tateburger_wings', 'tateburger_nuggets', 'fries_regular', 'fries_waffle',
		'fries_cheese_bacon', 'fries_cheese_chilli', 'mozzarella_sticks', 'tateburger_pancackes', 'tateburger_orginal',
		'tateburger_double', 'tateburger_chilli_cheese', 'the_pop', 'tateburger_nitro', 'tateburger_wrap',
		'tateburger_energy_nitro', 'tateburger_energy_hydro', 'milkshake_choc', 'milkshake_straw', 'milkshake_vanil' }
})

setContainerProperties('pingubox', {
	slots = 10,
	maxWeight = 10000,
	whitelist = { 'donut_pingu', 'black_tea', 'apple_tea', 'fruity_tea', 'peppermint_tea', 'hot_chocolate', 'chai_tea',
		'coffeetogo', 'cola', 'cola_cherry', 'cola_zero', 'sprite', 'fanta' }
})

setContainerProperties('bento_box', {
	slots = 10,
	maxWeight = 10000,
	whitelist = { 'black_tea', 'apple_tea', 'fruity_tea', 'peppermint_tea', 'hot_chocolate', 'chai_tea', 'coffeetogo',
		'cola', 'cola_cherry', 'cola_zero', 'sprite', 'fanta', 'matcha_coffee ', 'donut_cat', 'tacos', 'salmon_bagel',
		'tuna_sandwich', 'warm_soup', 'curry_rice', 'omlette_egg', 'strawberry_shortcake', 'cat_macaroon_brown',
		'cat_macaroon_green', 'cat_macaroon_turquoise', 'cat_macaroon_pink', 'pancakes' }
})

return containers
