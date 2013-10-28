From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.12-rc7
Date: Mon, 28 Oct 2013 15:40:06 -0700
Message-ID: <526EE7C6.60208@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, kernel-build-reports-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.12-rc7.
Logs and other details at:

     http://nvt.pwsan.com/pub/linux/testlogs/test_v3.12-rc7/20131027163109/


Test summary
------------

Build: zImage:
     Pass: ( 2/ 2): multi_v7_defconfig, tegra_defconfig

Boot to userspace: multi_v7_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver

Boot to userspace: tegra_defconfig:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver



vmlinux object size
(delta in bytes from test_v3.12-rc6 (31d141e3a666269a3b6fcccddb0351caf7454240)):
    text     data      bss    total  kernel
  +89324   -10192    +1184   +80316  multi_v7_defconfig
   +1380      +64        0    +1444  tegra_defconfig


Boot-time memory difference
(delta in bytes from test_v3.12-rc6 (31d141e3a666269a3b6fcccddb0351caf7454240))
     avail    rsrvd     high    freed                board              kconfig                  dtb
      -60k      60k        .       4k tegra114-dalmore-hea   multi_v7_defconfig     tegra114-dalmore
       12k     -12k        .        . tegra114-dalmore-hea      tegra_defconfig     tegra114-dalmore
      -72k      72k        .       4k       tegra30-beaver   multi_v7_defconfig       tegra30-beaver
         .        .        .        .       tegra30-beaver      tegra_defconfig       tegra30-beaver
