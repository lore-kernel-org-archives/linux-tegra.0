From: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra baseline test results for v3.10-rc3
Date: Wed, 5 Jun 2013 06:13:21 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1306050611570.13098@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


Here are some basic Tegra test results for Linux v3.10-rc3.
Logs and other details at:

    http://www.pwsan.com/tegra/testlogs/test_v3.10-rc3/20130528120832/


Test summary
------------

Build: zImage:
    Pass ( 1/ 1): tegra_defconfig

Boot to userspace:
    Pass ( 1/ 1): t33beaver


vmlinux object size
(delta in bytes from test_v3.10-rc2 
(c7788792a5e7b0d5d7f96d0766b4cb6112d47d75)):
   text     data      bss    total  kernel
  +6357      -56        0    +6301  tegra_defconfig
