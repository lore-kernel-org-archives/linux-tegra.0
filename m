From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.17-rc2
Date: Wed, 17 Sep 2014 01:24:50 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1409170123190.5860@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Here are some basic Tegra test results for Linux v3.17-rc2.
Logs and other details at:

    http://nvt.pwsan.com/pub/linux/testlogs/test_v3.17-rc2/20140916145434/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
    Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 3/ 3): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra30-beaver


vmlinux object size
(delta in bytes from test_v3.17-rc1 
(7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9)):
   text     data      bss    total  kernel
  +1592       +8        0    +1600  multi_v7_defconfig
  +1124       +8        0    +1132  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.17-rc1 
(7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
      -8k       8k        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
        .        .        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
      -8k       8k        .        .  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
        .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
      -8k       8k        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
