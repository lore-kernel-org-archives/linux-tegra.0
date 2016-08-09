From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.8-rc1
Date: Tue, 9 Aug 2016 15:14:27 +0100
Message-ID: <6f1baf82-11c8-9c60-a52e-83cec7df03a5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.8-rc1.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.8-rc1/20160807183103/


Test summary
------------

Build: zImage:
    Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 4/ 4): qemu-vexpress64, tegra132-norrin,
		   tegra210-p2371-0000, tegra210-smaug

Boot to userspace: multi_v7_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

Boot to userspace: tegra_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

PM: System suspend: multi_v7_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver

PM: System suspend: tegra_defconfig:
    Pass: ( 5/ 5): tegra114-dalmore-a04, tegra124-jetson-tk1,
		   tegra124-nyan-big, tegra20-trimslice, tegra30-beaver


vmlinux object size
(delta in bytes from test_v4.7 (523d939ef98fd712632d93a5a2b588e477a7565e)):
   text     data      bss    total  kernel
+698018  +144600    +9592  +852210  defconfig
+133651  -519960      -88  -386397  multi_v7_defconfig
 +81268  -406304       +8  -325028  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v4.7 (523d939ef98fd712632d93a5a2b588e477a7565e))
    avail    rsrvd     high    freed                board              kconfig                  dtb
        .        .        .        .      qemu-vexpress64            defconfig           __internal
     -20k      20k        .        . tegra114-dalmore-a04   multi_v7_defconfig     tegra114-dalmore
     -16k      16k        .        . tegra114-dalmore-a04      tegra_defconfig     tegra114-dalmore
     -20k      20k        .        .  tegra124-jetson-tk1   multi_v7_defconfig  tegra124-jetson-tk1
     -16k      16k        .        .  tegra124-jetson-tk1      tegra_defconfig  tegra124-jetson-tk1
     -20k      20k        .        .    tegra124-nyan-big   multi_v7_defconfig    tegra124-nyan-big
        .        .        .        .    tegra124-nyan-big      tegra_defconfig    tegra124-nyan-big
        .        .        .        .      tegra132-norrin            defconfig      tegra132-norrin
     -12k      12k        .        .    tegra20-trimslice   multi_v7_defconfig    tegra20-trimslice
      -8k       8k        .        .    tegra20-trimslice      tegra_defconfig    tegra20-trimslice
        .        .        .        .  tegra210-p2371-0000            defconfig  tegra210-p2371-0000
        .        .        .        .       tegra210-smaug            defconfig       tegra210-smaug
     -20k      20k        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
     -16k      16k        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver

--
nvpublic
