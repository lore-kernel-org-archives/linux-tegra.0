From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.12-rc3
Date: Thu, 3 Oct 2013 23:27:57 -0700
Message-ID: <524E5FED.4010009@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.12-rc3.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.12-rc3/20130929153116/


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver


vmlinux object size
(delta in bytes from test_v3.12-rc2 (4a10c2ac2f368583138b774ca41fac4207911983)):
    text     data      bss    total  kernel
    +788        0        0     +788  multi_v7_defconfig
    +744       +8        0     +752  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.12-rc2 (4a10c2ac2f368583138b774ca41fac4207911983))
     avail    rsrvd     high    freed                board              kconfig                  dtb
         .        .        .        . tegra114-dalmore-hea   multi_v7_defconfig     tegra114-dalmore
         .        .        .        . tegra114-dalmore-hea      tegra_defconfig     tegra114-dalmore
         .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
         .        .        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
