From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH] arm64: dts: tegra210: Add L2 cache topology
Date: Fri, 1 Feb 2019 11:43:47 +0800
Message-ID: <20190201034347.18470-1-josephl@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add L2 cache topology.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
Notice that,
This patch depends on the series of CPU idle support[1].
And that one depneds on [2].
[1]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=89446
[2]: http://patchwork.ozlabs.org/project/linux-tegra/list/?series=84380
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 75534692604c..baf3d45c46e8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1319,6 +1319,7 @@
 			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
 			clock-latency = <300000>;
 			cpu-idle-states = <&C7>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu@1 {
@@ -1326,6 +1327,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <1>;
 			cpu-idle-states = <&C7>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu@2 {
@@ -1333,6 +1335,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <2>;
 			cpu-idle-states = <&C7>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu@3 {
@@ -1340,6 +1343,7 @@
 			compatible = "arm,cortex-a57";
 			reg = <3>;
 			cpu-idle-states = <&C7>;
+			next-level-cache = <&L2>;
 		};
 
 		idle-states {
@@ -1356,6 +1360,10 @@
 				status = "disabled";
 			};
 		};
+
+		L2: l2-cache {
+			compatible = "cache";
+		};
 	};
 
 	timer {
-- 
2.20.1
