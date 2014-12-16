From: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Subject: [PATCHv2 8/8] arm: dts: tegra: update isl29028 compatible string to use isil vendor prefix
Date: Tue, 16 Dec 2014 22:21:16 +0100
Message-ID: <8cfd0ac11713262036dca415e59e56508fb07c3c.1418763328.git.arno@natisbad.org>
References: <cover.1418763328.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1418763328.git.arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Darshana Padmadas <darshanapadmadas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


"isil" and "isl" prefixes are used at various locations inside the kernel
to reference Intersil corporation. This patch is part of a series fixing
those locations were "isl" is used in compatible strings to use the now
expected "isil" prefix instead (NASDAQ symbol for Intersil and most used
version).

Note: isl29028 is an I2C device so the patch does not in fact currently
depend on the introduction of "isil"-based compatible string in isl29028
driver because I2C core does not check the prefix yet.

Signed-off-by: Arnaud Ebalard <arno-LkuqDEemtHBg9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index cbf5a1ae0ca7..a1b682ea01bd 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -189,7 +189,7 @@
 
 		/* ALS and Proximity sensor */
 		isl29028@44 {
-			compatible = "isl,isl29028";
+			compatible = "isil,isl29028";
 			reg = <0x44>;
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(L, 0) IRQ_TYPE_LEVEL_HIGH>;
-- 
2.1.1
