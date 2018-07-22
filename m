From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 01/28] ARM: tegra: apalis_t30: enable broken-hpi on emmc
Date: Sun, 22 Jul 2018 18:49:09 +0200
Message-ID: <20180722164936.20581-2-marcel@ziswiler.com>
References: <20180722164936.20581-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180722164936.20581-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Avoid eMMC issues by specifying broken-hpi.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra30-apalis.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index 2f807d40c1b7..23ffe6a3bc2d 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -699,8 +699,16 @@
 	/* eMMC */
 	sdhci@78000600 {
 		status = "okay";
+		#address-cells = <1>;
+		#size-cells = <0>;
 		bus-width = <8>;
 		non-removable;
+
+		emmc: emmc@0 {
+			reg = <0>;
+			compatible = "mmc-card";
+			broken-hpi;
+		};
 	};
 
 	clocks {
-- 
2.14.4
