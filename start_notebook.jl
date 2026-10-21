# Run with: julia start_notebook.jl
# All paths are relative to this script, so spaces and the current directory are safe.
function prepare_environment()
    VERSION == v"1.13.2" || error(
        "This course environment was tested with Julia 1.13.2; you are running $VERSION. " *
        "Install Julia 1.13.2, then run this script again.",
    )
    all(arg -> arg in ("--setup-only", "--no-browser"), ARGS) || error(
        "Usage: julia start_notebook.jl [--setup-only] [--no-browser]",
    )

    root = @__DIR__
    depot = joinpath(root, ".local", "julia-depot")
    load_path = join(["@", "@stdlib"], Sys.iswindows() ? ';' : ':')
    # Depot and load paths must be set before Julia starts, including on Windows.
    if DEPOT_PATH != [depot] || Base.active_project() != joinpath(root, "Project.toml")
        executable = joinpath(Sys.BINDIR, Base.julia_exename())
        cmd = `$executable --startup-file=no --project=$root $(abspath(@__FILE__)) $ARGS`
        run(addenv(cmd, "JULIA_DEPOT_PATH" => depot, "JULIA_LOAD_PATH" => load_path))
        return false
    end

    return true
end

if prepare_environment()
    root = @__DIR__
    depot = joinpath(root, ".local", "julia-depot")
    load_path = join(["@", "@stdlib"], Sys.iswindows() ? ';' : ':')
    ENV["JUPYTER_DATA_DIR"] = joinpath(root, ".local", "jupyter")
    ENV["JUPYTER_CONFIG_DIR"] = joinpath(root, ".local", "jupyter-config")
    ENV["JUPYTER_RUNTIME_DIR"] = joinpath(root, ".local", "jupyter-runtime")
    ENV["IJULIA_NODEFAULTKERNEL"] = "1"
    ENV["JULIA_CONDAPKG_ENV"] = joinpath(root, ".local", "jupyter-env")
    ENV["MAMBA_ROOT_PREFIX"] = joinpath(root, ".local", "mamba")
    println("Preparing the course environment. First use downloads and compiles packages.")
    import Pkg
    Pkg.instantiate()
    import IJulia
    import CondaPkg
    IJulia.installkernel(
        "Energy System Optimization",
        "--startup-file=no",
        "--project=$root";
        julia=`$(joinpath(Sys.BINDIR, Base.julia_exename()))`,
        specname="energy-system-optimization",
        displayname="Julia 1.13.2 - Energy System Optimization",
        env=Dict("JULIA_DEPOT_PATH" => depot, "JULIA_LOAD_PATH" => load_path),
    )
    println("Preparing Jupyter. First use also downloads its private Python environment.")
    CondaPkg.resolve()
    println("Ready. Open Notebooks/01-Constrained-Optimization.ipynb.")
    println("Kernel: Julia 1.13.2 - Energy System Optimization")
    if "--setup-only" ∉ ARGS
        println("Keep this terminal open while using the notebook. Press Ctrl+C to stop.")
        notebook_args = "--no-browser" in ARGS ? `--no-browser` : ``
        CondaPkg.withenv() do
            python = CondaPkg.which("python")
            run(Cmd(`$python -m notebook --notebook-dir=$root $notebook_args`; dir=root))
        end
    end
end

