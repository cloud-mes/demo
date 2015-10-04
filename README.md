Full-featured demo built with the [Cloud-MES framework](http://www.cloud-mes.com/).

# Setup Guidelines #

Only possible if you are Rails 5 alpha user. :-)

```bash
# rails g cloud_mes:install is already runned
rake db:migrate
rake mes:load:semi
```