From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/2] arm: dts: tegra124: Add APB_MISC_GP as a mipi pad control bank
Date: Tue,  9 Sep 2014 15:58:46 -0400
Message-ID: <1410292726-9179-2-git-send-email-seanpaul@chromium.org>
References: <54088B53.6040802@wwwdotorg.org>
 <1410292726-9179-1-git-send-email-seanpaul@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1410292726-9179-1-git-send-email-seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, davidriley-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds the APB_MISC_GP_MIPI_PAD_CTRL_0 as a pinctrl
bank so the new mipi pad control group can be muxed between CSI
and DSI_B.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
	- Added patch

Changes in v3:
	- Changed comment

 arch/arm/boot/dts/tegra124.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 03916ef..33660e8 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -204,7 +204,8 @@
 	pinmux: pinmux@0,70000868 {
 		compatible = "nvidia,tegra124-pinmux";
 		reg = <0x0 0x70000868 0x0 0x164>, /* Pad control registers */
-		      <0x0 0x70003000 0x0 0x434>; /* Mux registers */
+		      <0x0 0x70003000 0x0 0x434>, /* Mux registers */
+		      <0x0 0x70000820 0x0 0x8>;   /* MIPI pad control */
 	};
 
 	/*
-- 
2.0.0
