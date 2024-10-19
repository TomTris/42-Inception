This is Inception.
This Project is about to learn Administration knowledge: Docker + containers.

Here we try to connect Mariadb, nginx and Wordpress, by configuring config files, using containers and docker-compose to build them and save data by using mount-volume.

Requirement:
- It means you have to build yourself the Docker images of your project. It is then forbidden to pull ready-made Docker images, as well as using services such as DockerHub (Alpine/Debian being excluded from this rule).

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only.
- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.
- A Docker container that contains MariaDB only without nginx.
- A volume that contains your WordPress database.
- A second volume that contains your WordPress website files.
- A docker-network that establishes the connection between your containers.
- Your containers have to restart in case of a crash.
- In your WordPress database, there must be two users, one of them being the administrator. The administrator’s username can’t contain admin/Admin or administrator/Administrator (e.g., admin, administrator, Administrator, admin-123, and so forth).

Bonus list:
...
- Add redis for wordpress cache
- add ftp-server pointing to wp-volume (I also made securer through ssl)
- create a static file (https://localhost:443/qdo.html)
- Add adminer (https://localhost:443/adminer.php)
- 1 Service as i want, and i think it's usefull => Add wps-hide-login.
<!-- localhost/?login will be the default login page. We are allow to change it as we want in the setting part of admin account. 
Reason: preventing brute forcing / spam -->

<!-- This is the result of the first time of 3.5 months ago -->
Score sofar: 100 / 125

<!-- At 42, if you put it into Virtual machine, make sure to not choose gnorme and debian desktop env or it will take your too much resources that ftp-server took too long to response -> doesn't work -->

  <!-- lxde xfce4 lightdm firefox-esr are light package to still be able run firefox-->