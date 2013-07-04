From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.10
Date: Thu, 4 Jul 2013 14:18:58 -0700
Message-ID: <51D5E6C2.60607@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Here are some basic Tegra test results for Linux v3.10.
Logs and other details at:

     http://www.pwsan.com/tegra/testlogs/test_v3.10/20130701231549/


Test summary
------------

Build: zImage:
     Pass: ( 1/ 1): tegra_defconfig

Boot to userspace:
     Pass: ( 2/ 2): tegra114-dalmore-headless, tegra30-beaver



vmlinux object size
(delta in bytes from test_v3.10-rc6 (7d132055814ef17a6c7b69f342244c410a5e000f)):
    text     data      bss    total  kernel
   +1256       -8        0    +1248  tegra_defconfig
