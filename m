From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 21/21] ARM: dt: tegra124: add sdhci iommus bindings
Date: Fri, 30 May 2014 14:20:34 +0300
Message-ID: <1401448834-32659-22-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add sdhci iommus bindings.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 5b339ca8a1ab..011831ffd390 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -472,6 +472,7 @@
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
+		iommus=<&smmu TEGRA_SWGROUP_CELLS(SDMMC1A)>;
 	};
 
 	sdhci@0,700b0200 {
@@ -482,6 +483,7 @@
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
+		iommus=<&smmu TEGRA_SWGROUP_CELLS(SDMMC2A)>;
 	};
 
 	sdhci@0,700b0400 {
@@ -492,6 +494,7 @@
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
+		iommus=<&smmu TEGRA_SWGROUP_CELLS(SDMMC3A)>;
 	};
 
 	sdhci@0,700b0600 {
@@ -502,6 +505,7 @@
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
+		iommus=<&smmu TEGRA_SWGROUP_CELLS(SDMMC4A)>;
 	};
 
 	ahub@0,70300000 {
-- 
2.0.0.rc1.15.g7e76a2f
