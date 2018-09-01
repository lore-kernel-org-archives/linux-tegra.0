From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 12/19] ARM: tegra: apalis-tk1: reorder cpu dfll clock properties
Date: Sat,  1 Sep 2018 15:04:57 +0200
Message-ID: <20180901130504.14318-13-marcel@ziswiler.com>
References: <20180901130504.14318-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901130504.14318-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder CPU DFLL clock properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 37e443e21ce6..07dd208296d3 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1925,8 +1925,8 @@
 	/* CPU DFLL clock */
 	clock@70110000 {
 		status = "okay";
-		vdd-cpu-supply = <&reg_vdd_cpu>;
 		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&reg_vdd_cpu>;
 	};
 
 	ahub@70300000 {
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index f76580f6cc80..fe10c5180768 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1954,8 +1954,8 @@
 	/* CPU DFLL clock */
 	clock@70110000 {
 		status = "okay";
-		vdd-cpu-supply = <&reg_vdd_cpu>;
 		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&reg_vdd_cpu>;
 	};
 
 	ahub@70300000 {
-- 
2.14.4
