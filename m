From: Bo Yan <byan@nvidia.com>
Subject: [PATCH] arm64: tegra: add topology data for Tegra194 cpu
Date: Thu, 31 Jan 2019 10:35:54 -0800
Message-ID: <1548959754-3941-1-git-send-email-byan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org
Cc: mark.rutland@arm.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, Bo Yan <byan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The xavier CPU architecture includes 8 CPU cores organized in
4 clusters. Add cpu-map data for topology initialization, add
cache data for cache node creation in sysfs.

Signed-off-by: Bo Yan <byan@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 148 +++++++++++++++++++++++++++++--
 1 file changed, 140 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6dfa1ca..7c2a1fb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -870,63 +870,195 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cl0_0>;
+				};
+
+				core1 {
+					cpu = <&cl0_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cl1_0>;
+				};
+
+				core1 {
+					cpu = <&cl1_1>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cl2_0>;
+				};
+
+				core1 {
+					cpu = <&cl2_1>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&cl3_0>;
+				};
+
+				core1 {
+					cpu = <&cl3_1>;
+				};
+			};
+		};
+
+		cl0_0: cpu@0 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10000>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_0>;
 		};
 
-		cpu@1 {
+		cl0_1: cpu@1 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10001>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_0>;
 		};
 
-		cpu@2 {
+		cl1_0: cpu@2 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_1>;
 		};
 
-		cpu@3 {
+		cl1_1: cpu@3 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x101>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_1>;
 		};
 
-		cpu@4 {
+		cl2_0: cpu@4 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_2>;
 		};
 
-		cpu@5 {
+		cl2_1: cpu@5 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x201>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_2>;
 		};
 
-		cpu@6 {
+		cl3_0: cpu@6 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10300>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_3>;
 		};
 
-		cpu@7 {
+		cl3_1: cpu@7 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10301>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache_sets = <256>;
+			l2-cache = <&l2_3>;
 		};
 	};
 
+	l2_0: l2-cache0 {
+		cache-size = <2097152>;
+		cache-line-size = <64>;
+		cache-sets = <2048>;
+		next-level-cache = <&l3>;
+	};
+
+	l2_1: l2-cache1 {
+		cache-size = <2097152>;
+		cache-line-size = <64>;
+		cache-sets = <2048>;
+		next-level-cache = <&l3>;
+	};
+
+	l2_2: l2-cache2 {
+		cache-size = <2097152>;
+		cache-line-size = <64>;
+		cache-sets = <2048>;
+		next-level-cache = <&l3>;
+	};
+
+	l2_3: l2-cache3 {
+		cache-size = <2097152>;
+		cache-line-size = <64>;
+		cache-sets = <2048>;
+		next-level-cache = <&l3>;
+	};
+
+	l3: l3-cache {
+		cache-size = <4194304>;
+		cache-line-size = <64>;
+		cache-sets = <4096>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		status = "okay";
-- 
2.7.4
