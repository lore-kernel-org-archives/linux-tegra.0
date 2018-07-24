From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 14/15] ARM: tegra: apalis-tk1: reorder cpu dfll clock properties
Date: Tue, 24 Jul 2018 12:43:08 +0200
Message-ID: <20180724104309.21741-15-marcel@ziswiler.com>
References: <20180724104309.21741-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724104309.21741-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reorder CPU DFLL clock properties.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 13486fe407d2..0837af1bf658 100644
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
index 77ca508d755e..18e9e9e8b474 100644
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
