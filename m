From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.17
Date: Mon, 6 Oct 2014 21:58:46 -0700
Message-ID: <54337306.6040807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.17.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.17/20141006214755/


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
(delta in bytes from test_v3.17-rc7 (fe82dcec644244676d55a1384c958d5f67979adb)):
    text     data      bss    total  kernel
     -57       -8       +8      -57  multi_v7_defconfig
     +91      +24       +4     +119  tegra_defconfig



Boot-time memory difference
(delta in bytes from test_v3.17-rc7 (fe82dcec644244676d55a1384c958d5f67979adb))
     avail    rsrvd     high    freed                board              kconfig                  dtb
         .        .        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
         .        .        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
         .        .        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
         .        .        .        .  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
         .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
         .        .        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
