using InteractiveUtils
using REPL

ENV["JULIA_EDITOR"] = "lvim"
#ENV["JULIA_EDITOR"] = "/usr/local/bin/nvim"

InteractiveUtils.define_editor(
    r"lvim", wait=true) do cmd, path, line
    `$cmd +$line $path`
end

atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "Error while importing OhMyREPL" e
    end
    try 
        @eval using PrettyTypes
        printType = (e -> PrettyTypes.ast_transform(e, @__MODULE__))
        if isdefined(Base, :active_repl_backend)
            pushfirst!(
                Base.active_repl_backend.ast_transforms,
                printType)
        else
            pushfirst!(
                REPL.repl_ast_transforms,
                printType)
        end 
    catch e
        @warn "Error while importing PrettyTypes" e
    end
end
