From: Bhadram Varka <vbhadram@nvidia.com>
Subject: [PATCH 2/3] arm64: tegra: Enable multi-queue for DWC EQOS
Date: Sat, 2 Jun 2018 14:41:52 +0530
Message-ID: <1527930713-4479-2-git-send-email-vbhadram@nvidia.com>
References: <1527930713-4479-1-git-send-email-vbhadram@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1527930713-4479-1-git-send-email-vbhadram@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, treding@nvidia.com, mperttunen@nvidia.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

DWC EQOS supports four MTL queues for Tx and Rx
separately.

Signed-off-by: Bhadram Varka <vbhadram@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 0f4bed8..f27730d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -37,6 +37,52 @@
 		gpio-controller;
 	};
 
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,priority = <0x0>;
+		};
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,priority = <0x1>;
+		};
+		queue2 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,priority = <0x2>;
+		};
+		queue3 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,priority = <0x3>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-sp;
+		queue0 {
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+		queue1 {
+			snps,dcb-algorithm;
+			snps,priority = <0x1>;
+		};
+		queue2 {
+			snps,dcb-algorithm;
+			snps,priority = <0x2>;
+		};
+		queue3 {
+			snps,dcb-algorithm;
+			snps,priority = <0x3>;
+		};
+	};
+
 	ethernet@2490000 {
 		compatible = "nvidia,tegra186-eqos",
 			     "snps,dwc-qos-ethernet-4.10";
@@ -57,6 +103,8 @@
 		snps,burst-map = <0x7>;
 		snps,txpbl = <32>;
 		snps,rxpbl = <8>;
+		snps,mtl-rx-config = <&mtl_rx_setup>;
+		snps,mtl-tx-config = <&mtl_tx_setup>;
 	};
 
 	memory-controller@2c00000 {
-- 
2.7.4
