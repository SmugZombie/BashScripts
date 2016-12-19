fancontrol.sh


Designed for use on a 2012 Macbook Pro Retina with a hardware defect that allows the machine to overheat. Either the sensors or the fans fail to engage upon high temps requiring human intervention. This script replaces the need.


Crontab Example - Runs every 15 seconds.
<pre>
* * * * * /bin/bash /Users/regli/fancontrol.sh
* * * * * sleep 15; /bin/bash /Users/regli/fancontrol.sh
* * * * * sleep 30 ; /bin/bash /Users/regli/fancontrol.sh
* * * * * sleep 45; /bin/bash /Users/regli/fancontrol.sh
</pre>
