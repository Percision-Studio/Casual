-- params : ...

local sp = script.Parent
update = function()
  
  sp.Scope.Position = UDim2.new(0.5, -10 - sp.AbsoluteSize.y / 2, 0, -26)
  sp.Scope.Size = UDim2.new(0, 20 + sp.AbsoluteSize.y, 0, 20 + sp.AbsoluteSize.y)
  sp.ScopeId.Position = UDim2.new(0.5, -10 - sp.AbsoluteSize.y / 2, 0, -26)
  sp.ScopeId.Size = UDim2.new(0, 20 + sp.AbsoluteSize.y, 0, 20 + sp.AbsoluteSize.y)
  sp.F1.Size = UDim2.new(0, 20 + (sp.AbsoluteSize.x - sp.AbsoluteSize.y) / 2, 1, 20)
  sp.F2.Size = UDim2.new(0, 20 + (sp.AbsoluteSize.x - sp.AbsoluteSize.y) / 2, 1, 20)
  sp.F2.Position = UDim2.new(1, -10 - (sp.AbsoluteSize.x - sp.AbsoluteSize.y) / 2, 0, -10)
end

wait()
sp.Changed:connect(update)
update()
