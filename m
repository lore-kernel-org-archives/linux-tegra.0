From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/2] ARM: tegra: roth: pinmux fixes
Date: Mon, 23 Jun 2014 16:32:57 +0900
Message-ID: <1403508779-25896-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Two small but important fixes to SHIELD's pinmux configuration.
The use of invalid properties caused the pinmux to not be applied
at all. Also the setting for sdmmc clock lines resulted in random
errors or even the impossibility to probe attached devices.

Alexandre Courbot (2):
  ARM: tegra: roth: fix unsupported pinmux properties
  ARM: tegra: roth: enable input on mmc clock pins

 arch/arm/boot/dts/tegra114-roth.dts | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.0.0
