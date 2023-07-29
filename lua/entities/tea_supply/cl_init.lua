include('shared.lua')

language.Add( "Cleanup_tea_supply", "Tea Supplier")
language.Add( "Cleaned_tea_supply", "Cleaned up Tea Supplier")

function ENT:Draw()
   self:DrawEntityOutline( 0.0 )
   self.Entity:DrawModel()	
end

function ENT:DrawEntityOutline()
   return
end
