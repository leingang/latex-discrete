-- Build configuration for leindisc
-- Matthew Leingang, 2019-05-29

module = "leindisc"

unpackfiles = {"*.dtx"}


function update_tag(file,content,tagname,tagdate)
    -- This should go in a pre-tag hook, but there isn't one.
    -- ensure that the tagname matches `v`x.y.z
    assert(string.match(tagname,"^v%d+%.%d+%.%d+$"),
        "invalid tag name. Use a literal v, then a semantic version number.")
    -- Make sure the working directory is "clean"
    assert(os.execute("git diff-index --quiet HEAD") == 0,
        "Working directory dirty.  Commit changes and try again.")
    -- TeX dates are in yyyy/mm/dd format.  tagdate is in yyyy-mm-dd format.
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
