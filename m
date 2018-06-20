From: Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH 2/2] arm64: tegra: Add CPU nodes to Tegra194 device tree
Date: Wed, 20 Jun 2018 15:28:27 +0300
Message-ID: <20180620122827.14165-2-mperttunen@nvidia.com>
References: <20180620122827.14165-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180620122827.14165-1-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add CPU and PSCI nodes to device tree. The Tegra194 SoC contains
eight NVIDIA Carmel CPUs.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 40 +++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 53 ++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index ecb034177fc2..859ab5af17c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -229,6 +229,46 @@
 		};
 	};
 
+	cpus {
+		cpu@0 {
+			enable-method = "psci";
+		};
+
+		cpu@1 {
+			enable-method = "psci";
+		};
+
+		cpu@2 {
+			enable-method = "psci";
+		};
+
+		cpu@3 {
+			enable-method = "psci";
+		};
+
+		cpu@4 {
+			enable-method = "psci";
+		};
+
+		cpu@5 {
+			enable-method = "psci";
+		};
+
+		cpu@6 {
+			enable-method = "psci";
+		};
+
+		cpu@7 {
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		status = "okay";
+		method = "smc";
+	};
+
 	regulators {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 6322ef265c2f..6d699815a84f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -329,6 +329,59 @@
 		};
 	};
 
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x10000>;
+		};
+
+		cpu@1 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x10001>;
+		};
+
+		cpu@2 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x100>;
+		};
+
+		cpu@3 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x101>;
+		};
+
+		cpu@4 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x200>;
+		};
+
+		cpu@5 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x201>;
+		};
+
+		cpu@6 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x10300>;
+		};
+
+		cpu@7 {
+			compatible = "nvidia,tegra194-carmel", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x10301>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13
-- 
2.16.1
