From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 3/6] ARM: tegra: Add efuse bindings
Date: Thu, 19 Dec 2013 17:54:31 +0200
Message-ID: <1387468474-26521-4-git-send-email-pdeschrijver@nvidia.com>
References: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add efuse bindings for Tegra20, Tegra30, Tegra114 and Tegra124.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 arch/arm/boot/dts/tegra114.dtsi |    6 ++++++
 arch/arm/boot/dts/tegra124.dtsi |    6 ++++++
 arch/arm/boot/dts/tegra20.dtsi  |    7 +++++++
 arch/arm/boot/dts/tegra30.dtsi  |    6 ++++++
 4 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 8d42787..09a69bf 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -316,6 +316,12 @@
 		clock-names = "pclk", "clk32k_in";
 	};
 
+	efuse@7000f800 {
+		compatible = "nvidia,tegra114-efuse";
+		reg = <0x7000f800 0x400>;
+		clocks = <&tegra_car TEGRA114_CLK_FUSE>;
+	};
+
 	iommu {
 		compatible = "nvidia,tegra114-smmu", "nvidia,tegra30-smmu";
 		reg = <0x70019010 0x02c
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index b741300..5e82956 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -106,6 +106,12 @@
 		reg = <0x7000e400 0x400>;
 	};
 
+	efuse@7000f800 {
+		compatible = "nvidia,tegra124-efuse";
+		reg = <0x7000f800 0x400>;
+		clocks = <&tegra_car TEGRA124_CLK_FUSE>;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index df40b54..85daed6 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -121,6 +121,7 @@
 		};
 	};
 
+
 	timer@50004600 {
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0x50040600 0x20>;
@@ -455,6 +456,12 @@
 		#size-cells = <0>;
 	};
 
+	efuse@7000F800 {
+		compatible = "nvidia,tegra20-efuse";
+		reg = <0x7000F800 0x400>;
+		clocks = <&tegra_car TEGRA20_CLK_FUSE>;
+	};
+
 	pcie-controller {
 		compatible = "nvidia,tegra20-pcie";
 		device_type = "pci";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 2bd55cf..da1b998 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -535,6 +535,12 @@
 		nvidia,ahb = <&ahb>;
 	};
 
+	efuse@7000f800 {
+		compatible = "nvidia,tegra30-efuse";
+		reg = <0x7000f800 0x400>;
+		clocks = <&tegra_car TEGRA30_CLK_FUSE>;
+	};
+
 	ahub {
 		compatible = "nvidia,tegra30-ahub";
 		reg = <0x70080000 0x200
-- 
1.7.7.rc0.72.g4b5ea.dirty
