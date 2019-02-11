From: Bo Yan <byan@nvidia.com>
Subject: [PATCH V2] arm64: tegra: add topology data for Tegra194 cpu
Date: Mon, 11 Feb 2019 15:47:07 -0800
Message-ID: <1549928827-14006-1-git-send-email-byan@nvidia.com>
References: <20190131222517.GB13156@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190131222517.GB13156@mithrandir>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Bo Yan <byan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The xavier CPU architecture includes 8 CPU cores organized in
4 clusters. Add cpu-map data for topology initialization, this
fixes the topology information in
/sys/devices/system/cpu/cpu[n]/topology

Signed-off-by: Bo Yan <byan@nvidia.com>
---
V2: remove cache nodes, add topology data only

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 58 +++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6dfa1ca..35e6e76 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -870,56 +870,98 @@
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
 		};
 
-		cpu@1 {
+		cl0_1: cpu@1 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10001>;
 			enable-method = "psci";
 		};
 
-		cpu@2 {
+		cl1_0: cpu@2 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
 		};
 
-		cpu@3 {
+		cl1_1: cpu@3 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x101>;
 			enable-method = "psci";
 		};
 
-		cpu@4 {
+		cl2_0: cpu@4 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
 		};
 
-		cpu@5 {
+		cl2_1: cpu@5 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x201>;
 			enable-method = "psci";
 		};
 
-		cpu@6 {
+		cl3_0: cpu@6 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10300>;
 			enable-method = "psci";
 		};
 
-		cpu@7 {
+		cl3_1: cpu@7 {
 			compatible = "nvidia,tegra194-carmel", "arm,armv8";
 			device_type = "cpu";
 			reg = <0x10301>;
-- 
2.7.4
