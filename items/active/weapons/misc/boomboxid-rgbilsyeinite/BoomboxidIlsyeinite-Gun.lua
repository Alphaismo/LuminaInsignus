require "/items/active/weapons/ranged/gunfire.lua"
BoomboxidIlsyeinite-Gun = GunFire:new()

function BoomboxidIlsyeinite-Gun:update(...)
  GunFire.update(self, ...)
  hueshift = ((hueshift or 0) + 3) % 360
  animator.setGlobalTag("hueshift", hueshift)
end

function BoomboxidIlsyeinite-Gun:fireProjectile(name, params, ...)
  params = sb.jsonMerge(self.projectileParameters, params or {})
  params.processing = "?hueshift="..hueshift
  GunFire.fireProjectile(self, name, params, ...)
end