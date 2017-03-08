From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/2] arm64: tegra: Enable SD/MMC slot on P2771
Date: Wed,  8 Mar 2017 14:39:44 +0100
Message-ID: <20170308133944.32568-2-thierry.reding@gmail.com>
References: <20170223173053.19701-7-thierry.reding@gmail.com>
 <20170308133944.32568-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170308133944.32568-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The P3310 processor module makes provisions for exposing the SDMMC1
controller via a standard SD/MMC slot, which the P2771 supports. Hook
up the power supply provided on the P2771 carrier board and enable
the device tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- new patch

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 0d3c0996d832..b80c1c3483db 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -5,4 +5,27 @@
 / {
 	model = "NVIDIA Tegra186 P2771-0000 Development Board";
 	compatible = "nvidia,p2771-0000", "nvidia,tegra186";
+
+	/* SDMMC1 (SD/MMC) */
+	sdhci@3400000 {
+		status = "okay";
+
+		vmmc-supply = <&vdd_sd>;
+	};
+
+	regulators {
+		vdd_sd: regulator@100 {
+			compatible = "regulator-fixed";
+			reg = <100>;
+
+			regulator-name = "SD_CARD_SW_PWR";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+
+			gpio = <&gpio TEGRA_MAIN_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+
+			vin-supply = <&vdd_3v3_sys>;
+		};
+	};
 };
-- 
2.12.0
