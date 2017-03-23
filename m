From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Only 3.5 GB RAM on Jetson TX1
Date: Wed, 22 Mar 2017 17:13:57 -0700
Message-ID: <20170323001357.GA7546@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Vagrant Cascadian observed that only 3.5 GB RAM are available on the
Jetson TX1 development kit.

[    0.000000] Memory: 3501036K/3670016K available (6780K kernel code, 1020K rwdata, 2164K rodata, 3264K init, 634K bss, 168980K reserved, 0K cma-reserved)

Interestingly, even u-boot only shows 3.5 GB:

DRAM:  3.5 GiB

This is with mainline u-boot 2016.11 and R23.2 (2016.03-00633-g3ef9cdb).

However, 2015.07-rc2-g78c8468 (from R23.1.1) shows:

DRAM:  4 GiB

but that u-boot doesn't boot mainline kernels (some DT errors).

-- 
Martin Michlmayr
http://www.cyrius.com/
