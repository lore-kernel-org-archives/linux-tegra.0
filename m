From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.14-rc1
Date: Mon, 18 Sep 2017 12:35:54 +0100
Message-ID: <78b1e33f-cc9f-85c6-c7ae-3ecf0f1c2da4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v4.14-rc1.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.14-rc1/20170916163103/


Test summary
------------

Build: zImage:
    FAIL: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Build: Image:
    Pass: ( 1/ 1): defconfig

Boot to userspace: defconfig:
    Pass: ( 4/ 4): qemu-vexpress64, tegra132-norrin,
		   tegra210-p2371-0000, tegra210-smaug


vmlinux object size
(delta in bytes from test_v4.13 (569dbb88e80deb68974ef6fdd6a13edb9d686261)):
   text     data      bss    total  kernel
+147008  +131988    +1024  +280020  defconfig


Boot-time memory difference
(delta in bytes from test_v4.13 (569dbb88e80deb68974ef6fdd6a13edb9d686261))
    avail    rsrvd     high    freed                board              kconfig                  dtb
    -252k     252k        .        .      qemu-vexpress64            defconfig           __internal
    -248k     248k        .        .      tegra132-norrin            defconfig      tegra132-norrin
    -216k     216k        .        .  tegra210-p2371-0000            defconfig  tegra210-p2371-0000
    -220k     220k        .        .       tegra210-smaug            defconfig       tegra210-smaug
