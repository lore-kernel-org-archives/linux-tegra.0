From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.11-rc2
Date: Mon, 29 Jul 2013 22:29:36 -0700
Message-ID: <51F74F40.2080403@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.11-rc2.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.11-rc2/20130729210232/


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver


vmlinux object size
(delta in bytes from test_v3.11-rc1 (ad81f0545ef01ea651886dddac4bef6cec930092)):
    text     data      bss    total  kernel
    +872     +184        0    +1056  multi_v7_defconfig
    +674     +256        0     +930  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.11-rc1 (ad81f0545ef01ea651886dddac4bef6cec930092))
     avail    rsrvd     high    freed                board              kconfig                  dtb
         .        .        .        . tegra114-dalmore-hea     tegra114-dalmore   multi_v7_defconfig
         .        .        .        . tegra114-dalmore-hea     tegra114-dalmore      tegra_defconfig
         .        .        .        .       tegra30-beaver       tegra30-beaver   multi_v7_defconfig
         .        .        .        .       tegra30-beaver       tegra30-beaver      tegra_defconfig
