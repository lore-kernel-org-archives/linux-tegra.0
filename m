From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.11-rc4
Date: Tue, 6 Aug 2013 11:32:05 -0700
Message-ID: <52014125.7010003@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra >> \"linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org\"" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org >>
	\"linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org\"" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.11-rc4.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.11-rc4/20130806092219/

Special thanks to Jon Hunter for pointing out that the column order
of the boot time memory consumption report headings didn't match the
data, in previous reports.


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver



vmlinux object size
(delta in bytes from test_v3.11-rc3 (5ae90d8e467e625e447000cb4335c4db973b1095)):
    text     data      bss    total  kernel
   +1916       -8        0    +1908  multi_v7_defconfig
    +944      -72      +64     +936  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.11-rc3 (5ae90d8e467e625e447000cb4335c4db973b1095))
     avail    rsrvd     high    freed                board              kconfig                  dtb
       -4k       4k        .        . tegra114-dalmore-hea   multi_v7_defconfig     tegra114-dalmore
      -12k      12k        .        . tegra114-dalmore-hea      tegra_defconfig     tegra114-dalmore
       -4k       4k        .        .       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
      -12k      12k        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
