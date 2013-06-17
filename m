From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.10-rc6
Date: Mon, 17 Jun 2013 20:37:14 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306172036110.17176@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Here are some basic Tegra test results for Linux v3.10-rc6.
Logs and other details at:

    http://www.pwsan.com/tegra/testlogs/test_v3.10-rc6/20130617123049/


Test summary
------------

Build: zImage:
    Pass ( 1/ 1): tegra_defconfig

Boot to userspace:
    Pass ( 1/ 1): tegra30-beaver


vmlinux object size
(delta in bytes from test_v3.10-rc5 
(317ddd256b9c24b0d78fa8018f80f1e495481a10)):
   text     data      bss    total  kernel
  +1813        0        0    +1813  tegra_defconfig
