From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.2-rc1
Date: Mon, 6 Jul 2015 10:43:57 +0100
Message-ID: <559A4DDD.3090700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.2-rc1.
Logs and other details at:

    https://nvtb.github.io/linux/test_v4.2-rc1/20150705123104/


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
(delta in bytes from test_v4.1 (b953c0d234bc72e8489d3bf51a276c5c4ec85345)):
   text     data      bss    total  kernel
+190723   +29792     +936  +221451  defconfig
-318491   +45664    +8640  -264187  multi_v7_defconfig
+367808   +33128   +11840  +412776  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.1 (b953c0d234bc72e8489d3bf51a276c5c4ec85345))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
     276k    -276k        .      60k tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
    -388k     388k        .       4k tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
     276k    -276k        .      60k  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
    -388k     388k        .       4k  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
     268k    -268k        .      60k    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
    -396k     396k        .       4k    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
     276k    -276k        .      60k       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
    -388k     388k        .       4k       tegra30-beaver      tegra_defconfig       tegra30-beaver
