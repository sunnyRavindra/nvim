return {
'nvim-orgmode/orgmode',
 config = function()
    
    require('orgmode').setup({
      org_agenda_files = {'~/code/orgfiles/*'},
      org_default_notes_file = '~/code/orgfiles/refile.org',
    })

 end
}
