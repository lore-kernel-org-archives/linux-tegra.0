From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.15-rc3
Date: Mon, 28 Apr 2014 15:23:22 -0700
Message-ID: <535ED4DA.4080602@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.15-rc3.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.15-rc3/20140427210106/


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-a04, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-a04, tegra30-beaver



vmlinux object size
(delta in bytes from test_v3.15-rc2 (a798c10faf62a505d24e5f6213fbaf904a39623f)):
    text     data      bss    total  kernel
   +1184       -8        0    +1176  multi_v7_defconfig
    +752        0        0     +752  tegra_defconfig



Boot-time memory difference
(delta in bytes from test_v3.15-rc2 (a798c10faf62a505d24e5f6213fbaf904a39623f))
     avail    rsrvd     high    freed                board              kconfig                  dtb
         .        .        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
       -8k       8k        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
         .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
       -8k       8k        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
