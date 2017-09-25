From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v4.14-rc2
Date: Mon, 25 Sep 2017 15:29:21 +0100
Message-ID: <dbdcc12f-b1fa-4160-1b96-32270a528eed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra baseline test results for v4.14-rc2


Here are some basic Tegra test results for Linux v4.14-rc2.
Logs and other details at:

    https://nvtb.github.io//linux/test_v4.14-rc2/20170924170104/


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
(delta in bytes from test_v4.14-rc1 (2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e)):
   text     data      bss    total  kernel
  +3781    +1948        0    +5729  defconfig


Boot-time memory difference
(delta in bytes from test_v4.14-rc1 (2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e))
    avail    rsrvd     high    freed                board              kconfig                  dtb
     -64k      64k        .      64k      qemu-vexpress64            defconfig           __internal
     -64k      64k        .      64k      tegra132-norrin            defconfig      tegra132-norrin
     -64k      64k        .      64k  tegra210-p2371-0000            defconfig  tegra210-p2371-0000
     -64k      64k        .      64k       tegra210-smaug            defconfig       tegra210-smaug

--
nvpublic
