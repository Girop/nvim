local function load_project_config()
    local dir = vim.fn.getcwd() .. "/.nvim"
    if vim.fn.isdirectory(dir) == 0 then
        return {}
    end

    local config = {}
    for _, path in ipairs(vim.fn.globpath(dir, "*.json", false, true)) do
        local stem = vim.fn.fnamemodify(path, ":t:r")

        local ok, decoded = pcall(vim.fn.json_decode, vim.fn.readfile(path))
        if not ok or type(decoded) ~= "table" then
            vim.notify("project_config: failed to parse " .. path, vim.log.levels.WARN)
        else
            vim.notify("Parsed: " .. stem .. " .nvim config", vim.log.levels.WARN)
            config[stem] = decoded
        end
    end

    return config
end

PROJECT_CONFIG = load_project_config()
