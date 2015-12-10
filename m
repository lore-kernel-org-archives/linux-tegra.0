From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.4-rc1
Date: Thu, 10 Dec 2015 12:43:34 +0000
Message-ID: <56697376.9060406@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.4-rc1.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.4-rc1/20151208093330/


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
(delta in bytes from test_v4.3 (6a13feb9c82803e2b815eca72fa7a9f5561d7861)):
   text     data      bss    total  kernel
+272788   +40576    +5824  +319188  defconfig
+260002   +38896     +320  +299218  multi_v7_defconfig
+286258   +14816     +944  +302018  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.3 (6a13feb9c82803e2b815eca72fa7a9f5561d7861))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
    -292k     292k   -8192k      24k tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
    -308k     308k   -8192k      12k tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
    -292k     292k   -8192k      24k  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
    -308k     308k   -8192k      12k  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
    -292k     292k   -8192k      24k    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
    -308k     308k   -8192k      12k    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
    -292k     292k   -8192k      24k       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
    -308k     308k   -8192k      12k       tegra30-beaver      tegra_defconfig       tegra30-beaver
