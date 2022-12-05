local db = require('dashboard')
db.custom_center = {
    {
        icon = '  ',
        desc = 'Load recently latest session             ',
        shortcut = 'sa',
        action ='SessionManager load_last_session'
    },
    {
        icon = '  ',
        desc = 'Select and load session                  ',
        action =  'SessionManager load_session',
        shortcut = 'sl'
    },
    {
        icon = '  ',
        desc = 'Select and delete session                ',
        action =  'SessionManager delete_session',
        shortcut = 'sd'
    },
}