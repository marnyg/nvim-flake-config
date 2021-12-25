
print(1)

for k, v in pairs(package.loaded) do
  if string.match(k, "^my") then
    print(k)
    package.loaded[k] = nil
  end
end

print("lamo")


require('my-plugins')
require('lua.my-telescope')
require('lua.my-options')
require('lua.my-keybinds')

print(44)
