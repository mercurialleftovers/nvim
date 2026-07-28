local TEX_CMD = "tex --out "
if vim.fn.executable("tex") then

    function RenderLatex(outFile)
        vim.fn.system(TEX_CMD .. outFile)
    end

    function RenderAndViewLatex()
        local sumatraRunning = vim.fn.trim(vim.fn.system("tasklist | grep brave")) ~= ''
        local outFile = vim.fn.expand("%:e")


        RenderLatex(outFile)

        if not sumatraRunning then
            vim.system("sumatra.exe " .. outFile)
        end

    end


    RenderAndViewLatex()


    local latex_group = vim.api.nvim_create_augroup(
        "latex_group", 
        {
            clear=true
        }
    )

    vim.api.nvim_create_autocmd(
        {
            "BufRead",
        },
        {
            pattern={'*.tex'},
            callback=RenderAndViewLatex,
            group=latex_group,
        }
    )
end
