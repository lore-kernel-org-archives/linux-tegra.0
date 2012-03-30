From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 10/11] ARM: dt: tegra cardhu: add pinmux to device tree
Date: Fri, 30 Mar 2012 17:00:03 -0600
Message-ID: <1333148404-17691-11-git-send-email-swarren@wwwdotorg.org>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148404-17691-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This adds a minimal pinmux configuration to the Tegra Cardhu device
tree. Initially, just the built-in eMMC and SD card slot are configured.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-cardhu.dts |   44 ++++++++++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
index ac3fb75..0a9f34a 100644
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -10,6 +10,50 @@
 		reg = < 0x80000000 0x40000000 >;
 	};
 
+	pinmux@70000000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&state_default>;
+
+		state_default: pinmux {
+			sdmmc1_clk_pz0 {
+				nvidia,pins = "sdmmc1_clk_pz0";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc1_cmd_pz1 {
+				nvidia,pins =	"sdmmc1_cmd_pz1",
+						"sdmmc1_dat0_py7",
+						"sdmmc1_dat1_py6",
+						"sdmmc1_dat2_py5",
+						"sdmmc1_dat3_py4";
+				nvidia,function = "sdmmc1";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc4_clk_pcc4 {
+				nvidia,pins =	"sdmmc4_clk_pcc4",
+						"sdmmc4_rst_n_pcc3";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <0>;
+				nvidia,tristate = <0>;
+			};
+			sdmmc4_dat0_paa0 {
+				nvidia,pins =	"sdmmc4_dat0_paa0",
+						"sdmmc4_dat1_paa1",
+						"sdmmc4_dat2_paa2",
+						"sdmmc4_dat3_paa3",
+						"sdmmc4_dat4_paa4",
+						"sdmmc4_dat5_paa5",
+						"sdmmc4_dat6_paa6",
+						"sdmmc4_dat7_paa7";
+				nvidia,function = "sdmmc4";
+				nvidia,pull = <2>;
+				nvidia,tristate = <0>;
+			};
+		};
+	};
+
 	serial@70006000 {
 		clock-frequency = < 408000000 >;
 	};
-- 
1.7.0.4
