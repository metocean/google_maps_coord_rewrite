
-- a hack fix as LUA before 5.3 does not return negative numbers.
function tonumber_neg(value)
  if value[1] == "-" then
    return tonumber("%" .. value)
  end
  return tonumber(value)
end

-- /wx/tile/20161128_06z/hs/20161128_18z/1/-3/1.png
local uri = ngx.re.match(ngx.var.uri, "(.*)/([0-9]+)/([-0-9]+)/([0-9]+)(.*)")
if not uri then
  return
end

local y = tonumber(uri[4])
if not y then
  return
end

local zoom = tonumber(uri[2])
if not zoom then
  return
end
local tile_range = 2 ^ zoom

local x = tonumber_neg(uri[3])
if not x or (x >= 0 and x < tile_range) then
  return
end

x = (x % tile_range + tile_range) % tile_range;
ngx.req.set_uri(uri[1] .. "/" .. zoom .. "/" .. x .. "/" .. y .. uri[5])
