name              "bash"
maintainer        "Abel Lopez"
maintainer_email  "alop@att.com"
license           "Apache 2.0"
description       "Configures bash"
version           "0.0.7"

recipe            "bash", "Installs/Configures bash"

%w{ubuntu debian centos redhat amazon scientific fedora}.each do |os|
  supports os
end
