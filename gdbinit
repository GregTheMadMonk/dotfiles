define ninja
    shell ninja
    python gdb.execute("file " + gdb.current_progspace().filename)
    directory
end
