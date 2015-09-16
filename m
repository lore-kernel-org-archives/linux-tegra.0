From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.3-rc1
Date: Wed, 16 Sep 2015 09:35:48 +0100
Message-ID: <55F929E4.7000602@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra baseline test results for v4.3-rc1


Here are some basic Tegra test results for Linux v4.3-rc1.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.3-rc1/20150912170103/


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
(delta in bytes from test_v4.2 (64291f7db5bd8150a74ad2036f1037e6a0428df2)):
   text     data      bss    total  kernel
 -37902   +71864     +856   +34818  defconfig
+487145    +6536   +14016  +507697  multi_v7_defconfig
 -14232   +12960     +200    -1072  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.2 (64291f7db5bd8150a74ad2036f1037e6a0428df2))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
    -520k     520k        .      84k tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
     -12k      12k        .      12k tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
    -524k     524k        .      84k  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
     -16k      16k        .      12k  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
    -512k     512k        .      84k    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
      -4k       4k        .      12k    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
    -520k     520k        .      84k       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
     -12k      12k        .      12k       tegra30-beaver      tegra_defconfig       tegra30-beaver
