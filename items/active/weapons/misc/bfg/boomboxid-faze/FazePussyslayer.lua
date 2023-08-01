require "/items/active/weapons/ranged/gunfire.lua"
FazePussyslayer = GunFire:new()

function FazePussyslayer:update(...)
  GunFire.update(self, ...)
  hueshift = ((hueshift or 0) + 3) % 360
  animator.setGlobalTag("hueshift", hueshift)
end

function FazePussyslayer:fireProjectile(name, params, ...)
  params = sb.jsonMerge(self.projectileParameters, params or {})
  params.processing = "?hueshift="..hueshift
  GunFire.fireProjectile(self, name, params, ...)
end