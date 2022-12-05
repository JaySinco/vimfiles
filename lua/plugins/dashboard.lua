local db = require('dashboard')
db.custom_center = {
    {
        icon = '  ',
        desc = 'Recently latest session                  ',
        shortcut = 'sa',
        action ='SessionManager load_last_session'
    },
    {
        icon = '  ',
        desc = 'Recently sessions                        ',
        action =  'SessionManager load_session',
        shortcut = 'sl'
    },
}