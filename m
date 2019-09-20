From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2] arm64: tegra: Add CPU and cache topology for Tegra194
Date: Fri, 20 Sep 2019 16:56:21 +0200
Message-ID: <20190920145621.12527-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra194 has four CPU clusters, each with their own cache hierarchy.
This patch creates the CPU map for these clusters and adds the second-
and third-level caches and associates them with the CPUs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- fix reg properties for CPU nodes and update unit-address to match

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 156 +++++++++++++++++++++--
 1 file changed, 144 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index adebbbf36bd0..27bf0b7c3f6b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1442,60 +1442,192 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0_0: cpu@0 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10000>;
+			reg = <0x000>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_0>;
 		};
 
-		cpu@1 {
+		cpu0_1: cpu@1 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10001>;
+			reg = <0x001>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_0>;
 		};
 
-		cpu@2 {
+		cpu1_0: cpu@100 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x100>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_1>;
 		};
 
-		cpu@3 {
+		cpu1_1: cpu@101 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x101>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_1>;
 		};
 
-		cpu@4 {
+		cpu2_0: cpu@200 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x200>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_2>;
 		};
 
-		cpu@5 {
+		cpu2_1: cpu@201 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
 			reg = <0x201>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_2>;
 		};
 
-		cpu@6 {
+		cpu3_0: cpu@300 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10300>;
+			reg = <0x300>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_3>;
 		};
 
-		cpu@7 {
+		cpu3_1: cpu@301 {
 			compatible = "nvidia,tegra194-carmel";
 			device_type = "cpu";
-			reg = <0x10301>;
+			reg = <0x301>;
 			enable-method = "psci";
+			i-cache-size = <131072>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <65536>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&l2c_3>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0_0>;
+				};
+
+				core1 {
+					cpu = <&cpu0_1>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu1_0>;
+				};
+
+				core1 {
+					cpu = <&cpu1_1>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&cpu2_0>;
+				};
+
+				core1 {
+					cpu = <&cpu2_1>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&cpu3_0>;
+				};
+
+				core1 {
+					cpu = <&cpu3_1>;
+				};
+			};
+		};
+
+		l2c_0: l2-cache0 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_1: l2-cache1 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_2: l2-cache2 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l2c_3: l2-cache3 {
+			cache-size = <2097152>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+			next-level-cache = <&l3c>;
+		};
+
+		l3c: l3-cache {
+			cache-size = <4194304>;
+			cache-line-size = <64>;
+			cache-sets = <4096>;
 		};
 	};
 
-- 
2.23.0
