Exec { path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games", }

import 'classes/**'
include base
include maven
include users::appuser
include webapp
include users::git
rubyapp::app{'my_rails_project': }
