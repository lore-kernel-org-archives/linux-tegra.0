From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.13-rc2
Date: Mon, 2 Dec 2013 07:22:12 -0800
Message-ID: <alpine.DEB.2.02.1312020719270.6972@tamien>
Mime-Version: 1.0
Content-Type: text/plain; format=flowed; charset="US-ASCII"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Here are some basic Tegra test results for Linux v3.13-rc2.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.13-rc2/20131129133107/


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver


vmlinux object size
(delta in bytes from test_v3.13-rc1 
(6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae)):
    text     data      bss    total  kernel
    +536     +136        0     +672  multi_v7_defconfig
   +4360       -8        0    +4352  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.13-rc1 
(6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae))
     avail    rsrvd     high    freed                board              kconfig                  dtb
         .        .        .        . tegra114-dalmore-hea   multi_v7_defconfig     tegra114-dalmore
         .        .        .        . tegra114-dalmore-hea      tegra_defconfig     tegra114-dalmore
         .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
         .        .        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
