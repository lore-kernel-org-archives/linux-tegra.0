From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Only 1 CPU on Jetson TX1
Date: Wed, 22 Mar 2017 17:11:31 -0700
Message-ID: <20170323001131.GA7507@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vagrant Cascadian <vagrant-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Vagrant Cascadian observed that only 1 CPU is activated on the Jetson
TX1 development kit.

I can confirm this with mainline Linux and u-boot from mainline (2016.11)
or L4T (2016.03-00633-g3ef9cdb from R23.2).

I see the following in dmesg:

[    0.000000] /cpus/cpu@1: missing enable-method property
[    0.000000] /cpus/cpu@2: missing enable-method property
[    0.000000] /cpus/cpu@3: missing enable-method property

[    0.052643] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
[    0.053149] EFI services will not be available.
[    0.053316] Brought up 1 CPUs
[    0.053325] SMP: Total of 1 processors activated.
[    0.053341] CPU: All CPU(s) started at EL2

-- 
Martin Michlmayr
http://www.cyrius.com/
