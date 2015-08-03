From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.2-rc5
Date: Mon, 3 Aug 2015 09:38:37 +0100
Message-ID: <55BF288D.6070109@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.2-rc5.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.2-rc5/20150802190102/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 1/ 1): qemu-vexpress64

Boot to userspace: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver


vmlinux object size
(delta in bytes from test_v4.2-rc4 (cbfe8fa6cd672011c755c3cd85c9ffd4e2d10a6f)):
   text     data      bss    total  kernel
    +24        0        0      +24  defconfig
  +2240        0        0    +2240  multi_v7_defconfig
   +592     +256        0     +848  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.2-rc4 (cbfe8fa6cd672011c755c3cd85c9ffd4e2d10a6f))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
        .        .        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
        .        .        .      -4k tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
        .        .        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
        .        .        .      -4k  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
        .        .        .        .    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
        .        .        .      -4k    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
        .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
        .        .        .      -4k       tegra30-beaver      tegra_defconfig       tegra30-beaver
