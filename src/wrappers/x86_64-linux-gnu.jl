# Autogenerated wrapper script for mpg123_jll for x86_64-linux-gnu
export mpg123_strip, mpg123_id3dump, libmpg123, libout123, out123, mpg123

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `mpg123_strip`
const mpg123_strip_splitpath = ["bin", "mpg123-strip"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mpg123_strip_path = ""

# mpg123_strip-specific global declaration
function mpg123_strip(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mpg123_strip_path)
    end
end


# Relative path to `mpg123_id3dump`
const mpg123_id3dump_splitpath = ["bin", "mpg123-id3dump"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mpg123_id3dump_path = ""

# mpg123_id3dump-specific global declaration
function mpg123_id3dump(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mpg123_id3dump_path)
    end
end


# Relative path to `libmpg123`
const libmpg123_splitpath = ["lib", "libmpg123.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmpg123_path = ""

# libmpg123-specific global declaration
# This will be filled out by __init__()
libmpg123_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmpg123 = "libmpg123.so.0"


# Relative path to `libout123`
const libout123_splitpath = ["lib", "libout123.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libout123_path = ""

# libout123-specific global declaration
# This will be filled out by __init__()
libout123_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libout123 = "libout123.so.0"


# Relative path to `out123`
const out123_splitpath = ["bin", "out123"]

# This will be filled out by __init__() for all products, as it must be done at runtime
out123_path = ""

# out123-specific global declaration
function out123(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(out123_path)
    end
end


# Relative path to `mpg123`
const mpg123_splitpath = ["bin", "mpg123"]

# This will be filled out by __init__() for all products, as it must be done at runtime
mpg123_path = ""

# mpg123-specific global declaration
function mpg123(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(mpg123_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global mpg123_strip_path = abspath(joinpath(artifact"mpg123", mpg123_strip_splitpath...))

    push!(PATH_list, dirname(mpg123_strip_path))
    global mpg123_id3dump_path = abspath(joinpath(artifact"mpg123", mpg123_id3dump_splitpath...))

    push!(PATH_list, dirname(mpg123_id3dump_path))
    global libmpg123_path = abspath(joinpath(artifact"mpg123", libmpg123_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmpg123_handle = dlopen(libmpg123_path)
    push!(LIBPATH_list, dirname(libmpg123_path))

    global libout123_path = abspath(joinpath(artifact"mpg123", libout123_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libout123_handle = dlopen(libout123_path)
    push!(LIBPATH_list, dirname(libout123_path))

    global out123_path = abspath(joinpath(artifact"mpg123", out123_splitpath...))

    push!(PATH_list, dirname(out123_path))
    global mpg123_path = abspath(joinpath(artifact"mpg123", mpg123_splitpath...))

    push!(PATH_list, dirname(mpg123_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

