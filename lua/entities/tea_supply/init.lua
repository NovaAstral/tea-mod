AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')

function ENT:SpawnFunction(ply, tr)
	local ent = ents.Create("tea_supply")
	ent:SetPos(tr.HitPos + Vector(0, 0, 0))
	ent:Spawn()
	return ent 
end 

ENT.Sounds ={
	CuppaTea = Sound("tea/cuppa.mp3"), --Cup of earl gray? That would be perfect.
	DarjeelingTea = Sound("tea/darjeeling.mp3"),
	ExcellentTea = Sound("tea/excellenttea.mp3"),
	GarakTea = Sound("tea/garaktea.mp3"),
	KlingonTea = Sound("tea/klingontea.mp3"),
	RikerTea = Sound("tea/rikertea.mp3"),
	ShinzonTea = Sound("tea/shinzontea.mp3"),
	TeaTea = Sound("tea/tea.mp3"),
	OldPicardTea = Sound("tea/oldpicardtea.mp3"),
	PicardFailTea = Sound("tea/picardtea_fail.mp3"),
	PicardFailTea2 = Sound("tea/picardtea_fail2.mp3"),
	PicardTea1 = Sound("tea/picardtea1.mp3"),
	PicardTea2 = Sound("tea/picardtea2.mp3"),
	PicardTea3 = Sound("tea/picardtea3.mp3"),
	PicardTea4 = Sound("tea/picardtea4.mp3"),
	PicardTea5 = Sound("tea/picardtea5.mp3"),
	PicardTea6 = Sound("tea/picardtea6.mp3"),
	PicardTea7 = Sound("tea/picardtea7.mp3"),
	PicardTea8 = Sound("tea/picardtea8.mp3"),
	PicardTea9 = Sound("tea/picardtea9.mp3"),
	PicardTea10 = Sound("tea/picardtea10.mp3"),
	PicardTea11 = Sound("tea/picardtea11.mp3")
}

function ENT:Initialize()
	util.PrecacheModel("models/props/cs_office/microwave_static.mdl")
	
	self.Entity:SetModel("models/props/cs_office/microwave_static.mdl")
	
	self.Entity:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	
	self.Entity:DrawShadow(false)

	self.Entity:SetUseType(SIMPLE_USE)
	
	local phys = self.Entity:GetPhysicsObject()
	
	if(phys:IsValid()) then
		phys:SetMass(100)
		phys:EnableGravity(true)
		phys:Wake()
		phys:EnableMotion(false)
	end
end

function ENT:Use(ply)
	if(IsValid(ply)) then
		local number = math.random(1,22)

		if(number == 1) then
			self.TeaSound = self.Sounds.CuppaTea
			self:MakeTea(true,3.4,true)
		elseif(number == 2) then
			self.TeaSound = self.Sounds.DarjeelingTea
			self:MakeTea(true,2.8,true)
		elseif(number == 3) then
			self.TeaSound = self.Sounds.ExcellentTea
			self:MakeTea(true,3.9,true)
		elseif(number == 4) then
			self.TeaSound = self.Sounds.GarakTea
			self:MakeTea(false,5.2	,true)
		elseif(number == 5) then
			self.TeaSound = self.Sounds.KlingonTea
			self:MakeTea(true,3,true)
		elseif(number == 6) then
			self.TeaSound = self.Sounds.RikerTea
			self:MakeTea(true,2.8,true)
		elseif(number == 7) then
			self.TeaSound = self.Sounds.ShinzonTea
			self:MakeTea(true,2.2,true)
		elseif(number == 8) then
			self.TeaSound = self.Sounds.TeaTea
			self:MakeTea(true,1.5,true)
		elseif(number == 9) then
			self.TeaSound = self.Sounds.OldPicardTea
			self:MakeTea(true,4.8,true)
		elseif(number == 10) then
			self.TeaSound = self.Sounds.PicardFailTea
			self:MakeTea(false,6,false)
		elseif(number == 11) then
			self.TeaSound = self.Sounds.PicardFailTea2
			self:MakeTea(false,11.8,false)
		elseif(number == 12) then
			self.TeaSound = self.Sounds.PicardTea1
			self:MakeTea(true,1.5,true)
		elseif(number == 13) then
			self.TeaSound = self.Sounds.PicardTea2
			self:MakeTea(true,1.4,true)
		elseif(number == 14) then
			self.TeaSound = self.Sounds.PicardTea3
			self:MakeTea(true,1.4,true)
		elseif(number == 15) then
			self.TeaSound = self.Sounds.PicardTea4
			self:MakeTea(true,1.7,true)
		elseif(number == 16) then
			self.TeaSound = self.Sounds.PicardTea5
			self:MakeTea(true,1.3,true)
		elseif(number == 17) then
			self.TeaSound = self.Sounds.PicardTea6
			self:MakeTea(true,1.4,true)
		elseif(number == 18) then
			self.TeaSound = self.Sounds.PicardTea7
			self:MakeTea(true,1.8,true)
		elseif(number == 19) then
			self.TeaSound = self.Sounds.PicardTea8
			self:MakeTea(true,2.5,true)
		elseif(number == 20) then
			self.TeaSound = self.Sounds.PicardTea9
			self:MakeTea(true,1.5,true)
		elseif(number == 21) then
			self.TeaSound = self.Sounds.PicardTea10
			self:MakeTea(true,2.6,true)
		elseif(number == 22) then
			self.TeaSound = self.Sounds.PicardTea11
			self:MakeTea(true,7.8,true)
		end	
	end
end

function ENT:MakeTea(explode,delay,maketea)
	self.Entity:EmitSound(self.TeaSound,100,100,1)

	if(explode == true) then
		timer.Create("TeaSupply_TeaExplode",delay,1,function()
			if(IsValid(TheTeaEntity)) then
				self.Entity:EmitSound("phx/explode06.wav",100,100,1)

				NEasyEffect(TheTeaEntity:GetPos(),TheTeaEntity:GetPos(),10,"Explosion")

				util.BlastDamage(self.Entity,self.Entity,TheTeaEntity:GetPos(),750,750)

				NRadiusPush(TheTeaEntity:GetPos(),2000,30)

				NScreenShake("teasupply_shake",200,750,5,255,TheTeaEntity:GetPos())

				TheTeaEntity:Remove()
			end
		end)
	end

	if(maketea == true) then
		TheTeaEntity = ents.Create("prop_physics")
		TheTeaEntity:SetModel("models/props_junk/garbage_coffeemug001a.mdl")
		TheTeaEntity:SetPos(self.Entity:LocalToWorld(Vector(0,0,25)))
		TheTeaEntity:Activate()
		TheTeaEntity:Spawn()
	end
end

function ENT:Splode() --Explode the entity
	if(!self.Exploded) then
		self.Exploded = true

		timer.Create("ResDep_Explode1",1,3,function() --3 Small Explosions
			self.Entity:EmitSound("phx/explode06.wav",80,100,1)

			util.BlastDamage(self.Entity,self.Entity,self.Entity:GetPos(),250,25)
		
			--This is a function from my (Nova Astral) lib
			NEasyEffect(self.Entity:GetPos(),self.Entity:GetPos(),20,"HelicopterMegaBomb")
		end)

		timer.Create("ResDep_Explode2",5,1,function() --main explosion
			

			
		end)
	end
end

function ENT:PreEntityCopy()
	if WireAddon then
		duplicator.StoreEntityModifier(self,"WireDupeInfo",WireLib.BuildDupeInfo(self.Entity))
	end
end

function ENT:PostEntityPaste(ply, ent, createdEnts)
	if WireAddon then
		local emods = ent.EntityMods
		if not emods then return end
		WireLib.ApplyDupeInfo(ply, ent, emods.WireDupeInfo, function(id) return createdEnts[id] end)
	end
end

function ENT:OnRemove()
	timer.Stop("ResDep_Explode1")
	timer.Stop("ResDep_Explode2")
end