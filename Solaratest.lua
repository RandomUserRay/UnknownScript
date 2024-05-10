    for i,v in next, listfiles("/") do
        if isfile(v) then
            delfile(v)
        elseif isfolder(v) then
            delfolder(v)
        end
    end
