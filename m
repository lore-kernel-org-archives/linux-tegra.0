From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 5/5] ARM: dts: tegra114: Add IOMMU nodes to Host1x and its clients
Date: Fri,  4 May 2018 02:47:23 +0300
Message-ID: <20180503234723.4368-6-digetx@gmail.com>
References: <20180503234723.4368-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180503234723.4368-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Enable IOMMU support for Host1x and its clients.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra114.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 0e4a13295d8a..84c4358dacac 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -19,6 +19,7 @@
 		clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
+		iommus = <&mc TEGRA_SWGROUP_HC>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -32,6 +33,8 @@
 			clocks = <&tegra_car TEGRA114_CLK_GR2D>;
 			resets = <&tegra_car 21>;
 			reset-names = "2d";
+
+			iommus = <&mc TEGRA_SWGROUP_G2>;
 		};
 
 		gr3d@54180000 {
@@ -40,6 +43,8 @@
 			clocks = <&tegra_car TEGRA114_CLK_GR3D>;
 			resets = <&tegra_car 24>;
 			reset-names = "3d";
+
+			iommus = <&mc TEGRA_SWGROUP_NV>;
 		};
 
 		dc@54200000 {
-- 
2.17.0
