From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: add clocks properties to USB PHY nodes
Date: Tue, 22 Jan 2013 17:28:23 -0700
Message-ID: <1358900903-27654-2-git-send-email-swarren@wwwdotorg.org>
References: <1358900903-27654-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358900903-27654-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The patch to add USB PHY nodes to device tree was written before Tegra
supported the clocks property in device tree. Now that it does, add the
required clocks properties to these nodes.

This will allow all clk_get_sys() calls in tegra_usb_phy.c to be replaced
by clk_get(phy->dev, clock_name), as part of converting the PHY driver to
a platform driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 2e9d1f0..d5e72ce 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -442,18 +442,24 @@
 		reg = <0xc5000400 0x3c00>;
 		phy_type = "utmi";
 		nvidia,has-legacy-mode;
+		clocks = <&tegra_car 22>, <&tegra_car 127>;
+		clock-names = "utmi", "pll_u";
 	};
 
 	phy2: usb-phy@c5004400 {
 		compatible = "nvidia,tegra20-usb-phy";
 		reg = <0xc5004400 0x3c00>;
 		phy_type = "ulpi";
+		clocks = <&tegra_car 94>, <&tegra_car 127>;
+		clock-names = "ulpi", "pll_u";
 	};
 
 	phy3: usb-phy@c5008400 {
 		compatible = "nvidia,tegra20-usb-phy";
 		reg = <0xc5008400 0x3C00>;
 		phy_type = "utmi";
+		clocks = <&tegra_car 22>, <&tegra_car 127>;
+		clock-names = "utmi", "pll_u";
 	};
 
 	usb@c5000000 {
-- 
1.7.10.4
