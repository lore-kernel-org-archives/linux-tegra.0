From: Anna-Maria Gleixner <anna-maria-WyZXDcvM26CzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH] ARM:tegra20-colibri-512.dts: Change tristate status for i2c
 pinmux
Date: Thu, 20 Jun 2013 23:08:14 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1306202302210.11096@dionysos>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The nvidia,tristate entry for the pinmux of i2c1 an i2c3 was set to
tristate. This results in non working i2c, because the i2c pins are
not actively driven. Set the entries to "driven".

Signed-off-by: Anna-Maria Gleixner <anna-maria-WyZXDcvM26CzQB+pC5nmwQ@public.gmane.org>

diff --git a/arch/arm/boot/dts/tegra20-colibri-512.dtsi b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
index 4441620..ad699bb 100644
--- a/arch/arm/boot/dts/tegra20-colibri-512.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri-512.dtsi
@@ -86,13 +86,13 @@
  				nvidia,pins = "rm";
  				nvidia,function = "i2c1";
  				nvidia,pull = <0>;
-				nvidia,tristate = <1>;
+				nvidia,tristate = <0>;
  			};
  			i2c3 {
  				nvidia,pins = "dtf";
  				nvidia,function = "i2c3";
  				nvidia,pull = <0>;
-				nvidia,tristate = <1>;
+				nvidia,tristate = <0>;
  			};
  			i2cddc {
  				nvidia,pins = "ddc";
