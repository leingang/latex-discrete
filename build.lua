-- Build configuration for leindisc
-- Matthew Leingang, 2019-05-29

module = "leindisc"

unpackfiles = {"*.dtx"}


function update_tag(file,content,tagname,tagdate)
    tagdate_tex = string.gsub(tagdate,'-','/')
    if string.match(file, "%.dtx$") then
        content = string.gsub(content,
            "\n\\ProvidesPackage{leindisc}%[%d%d%d%d/%d%d/%d%d v.- ",
            "\n\\ProvidesPackage{leindisc}[" .. tagdate_tex .. " " .. tagname .. " "
        )
        content = string.gsub(content,
            "\n%% \\changes{unreleased}",
            "\n%% \\changes{" .. tagname .. "}"
        )
        return content
    end
end


kpse.set_program_name("texlua")
if not release_date then
   dofile(kpse.lookup("l3build.lua"))
end
