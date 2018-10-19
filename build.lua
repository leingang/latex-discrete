-- Build configuration for leintex

module = "leindisc"

unpackfiles = {"*.dtx"}

kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
