function! RunVHDL(entity)
    execute '!ghdl -a '.@%
    execute '!ghdl -e '.a:entity
    execute '!ghdl -r '.a:entity.' --vcd='.a:entity.'.vcd'
endfunction
function! CompileVHDL(entity, filename)
    execute '!ghdl -a '.a:filename
    execute '!ghdl -e '.a:entity
endfunction
command! PyRun execute ":AsyncRun python %"
command! JavaRun execute ":AsyncRun ./gradlew run"
command! MDRun execute "AsyncRun grip -b %"
command! HTMLRun execute "AsyncRun python -m http.server"
command! CPPRun execute "AsyncRun g++ % && ./a.out"
command! -nargs=1 VHDLRun call RunVHDL(<f-args>)
command! -nargs=* VHDLCompile call CompileVHDL(<f-args>)

inoremap <C-S> <C-O>:w<Return>

autocmd! FileType python nnoremap <F5> :PyRun <Return>
autocmd! FileType java nnoremap <F5> :JavaRun <Return>
autocmd! FileType markdown nnoremap <F5> :MDRun <Return>
autocmd! FileType html nnoremap <F5> :HTMLRun <Return>
autocmd! FileType cpp nnoremap <F5> :CPPRun <Return>
