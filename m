From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/10] ARM: tegra: Add Tegra114 gr3d support
Date: Thu, 19 Dec 2013 16:59:31 +0100
Message-ID: <1387468774-14216-8-git-send-email-treding@nvidia.com>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387468774-14216-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add the gr3d device tree node. The gr3d block on Tegra114 is backwards-
compatible with the one on Tegra20.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- add reset and reset-names properties

 arch/arm/boot/dts/tegra114.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 3dd7b50d8f93..bac5b231ff42 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -39,6 +39,14 @@
 			reset-names = "2d";
 		};
 
+		gr3d@54180000 {
+			compatible = "nvidia,tegra114-gr3d", "nvidia,tegra20-gr3d";
+			reg = <0x54180000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_GR3D>;
+			resets = <&tegra_car 24>;
+			reset-names = "3d";
+		};
+
 		dc@54200000 {
 			compatible = "nvidia,tegra114-dc", "nvidia,tegra20-dc";
 			reg = <0x54200000 0x00040000>;
-- 
1.8.4.2
