From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.6-rc4
Date: Tue, 19 Apr 2016 10:06:22 +0100
Message-ID: <5715F50E.9000407@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.6-rc4.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.6-rc4/20160417193103/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 3/ 3): qemu-vexpress64, tegra132-norrin,
		   tegra210-p2371-0000

Boot to userspace: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver

PM: System suspend: multi_v7_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver

PM: System suspend: tegra_defconfig:
    Pass: ( 4/ 4): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra20-trimslice, tegra30-beaver


vmlinux object size
(delta in bytes from test_v4.6-rc3 (bf16200689118d19de1b8d2a3c314fc21f5dc7bb)):
   text     data      bss    total  kernel
     +1        0        0       +1  defconfig
   -667        0      -64     -731  multi_v7_defconfig
   -607        0      -64     -671  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.6-rc3 (bf16200689118d19de1b8d2a3c314fc21f5dc7bb))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
        .        .        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
        .        .        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
        .        .        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
        .        .        .        .  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
        .        .        .        .      tegra132-norrin            defconfig      tegra132-norrin
        .        .        .        .    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
        .        .        .        .    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
        .        .        .        .  tegra210-p2371-0000            defconfig  tegra210-p2371-0000
        .        .        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
        .        .        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
