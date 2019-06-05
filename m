From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2] arm64: tegra: add CPU cache topology for Tegra186
Date: Wed, 5 Jun 2019 10:26:40 +0800
Message-ID: <20190605022640.17837-1-josephl@nvidia.com>
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
Cc: linux-tegra@vger.kernel.org, Joseph Lo <josephl@nvidia.com>, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
List-Id: linux-tegra@vger.kernel.org

Tegra186 has two CPU clusters with its own cache hierarchy. This patch
adds them with the cache information of each of the CPUs.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
v2:
 - add detail cache information
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 60 ++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 426ac0bdf6a6..8759fcfaf4ed 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1128,38 +1128,98 @@
 		cpu@0 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
+			i-cache-size = <0x20000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_DENVER>;
 			reg = <0x000>;
 		};
 
 		cpu@1 {
 			compatible = "nvidia,tegra186-denver";
 			device_type = "cpu";
+			i-cache-size = <0x20000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <512>;
+			d-cache-size = <0x10000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_DENVER>;
 			reg = <0x001>;
 		};
 
 		cpu@2 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_A57>;
 			reg = <0x100>;
 		};
 
 		cpu@3 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_A57>;
 			reg = <0x101>;
 		};
 
 		cpu@4 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_A57>;
 			reg = <0x102>;
 		};
 
 		cpu@5 {
 			compatible = "arm,cortex-a57";
 			device_type = "cpu";
+			i-cache-size = <0xC000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			next-level-cache = <&L2_A57>;
 			reg = <0x103>;
 		};
+
+		L2_DENVER: l2-cache0 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
+
+		L2_A57: l2-cache1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			cache-size = <0x200000>;
+			cache-line-size = <64>;
+			cache-sets = <2048>;
+		};
 	};
 
 	bpmp: bpmp {
-- 
2.21.0
