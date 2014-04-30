From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 7/7] ARM: tegra: Add the EC i2c tunnel to tegra124-venice2
Date: Wed, 30 Apr 2014 10:44:10 -0700
Message-ID: <1398879850-9111-8-git-send-email-dianders@chromium.org>
References: <1398879850-9111-1-git-send-email-dianders@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398879850-9111-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org
Cc: abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This adds the EC i2c tunnel (and devices under it) to the
tegra124-venice2 device tree.

Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v3: None
Changes in v2:
- Removed i2c20 alias for i2c tunnel

 arch/arm/boot/dts/tegra124-venice2.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index c17283c..89cf776 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -813,6 +813,32 @@
 
 			google,cros-ec-spi-msg-delay = <2000>;
 
+			i2c-tunnel {
+				compatible = "google,cros-ec-i2c-tunnel";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				google,remote-bus = <0>;
+
+				charger: bq24735@9 {
+					compatible = "ti,bq24735";
+					reg = <0x9>;
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA_GPIO(J, 0)
+							GPIO_ACTIVE_HIGH>;
+					ti,ac-detect-gpios = <&gpio
+							TEGRA_GPIO(J, 0)
+							GPIO_ACTIVE_HIGH>;
+				};
+
+				battery: sbs-battery@b {
+					compatible = "sbs,sbs-battery";
+					reg = <0xb>;
+					sbs,i2c-retry-count = <2>;
+					sbs,poll-retry-count = <1>;
+				};
+			};
+
 			cros-ec-keyb {
 				compatible = "google,cros-ec-keyb";
 				keypad,num-rows = <8>;
-- 
1.9.1.423.g4596e3a

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
