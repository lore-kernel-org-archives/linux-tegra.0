From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/2] arm64: tegra: Enable SDHCI controllers on P3110
Date: Wed,  8 Mar 2017 14:39:43 +0100
Message-ID: <20170308133944.32568-1-thierry.reding@gmail.com>
References: <20170223173053.19701-7-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170223173053.19701-7-thierry.reding@gmail.com>
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

The P3110 processor module wires one of the SDHCI controllers to an on-
board eMMC and exposes another set of SD/MMC signals on the connector to
support an external SD/MMC card. A third controller is connected to the
SDIO pins of an M.2 KEY E connector.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- move SD_CARD_SW_PWR regulator to carrier board (separate patch)
- move status = "okay" to carrier board
- fix card-detect GPIO for SDMMC1

 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 69553bde7ef7..847e7db59b47 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -7,6 +7,8 @@
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
+		sdhci0 = "/sdhci@3460000";
+		sdhci1 = "/sdhci@3400000";
 		serial0 = &uarta;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/i2c@3160000";
@@ -72,6 +74,29 @@
 		status = "okay";
 	};
 
+	/* SDMMC1 (SD/MMC) */
+	sdhci@3400000 {
+		cd-gpios = <&gpio TEGRA_MAIN_GPIO(P, 5) GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpio TEGRA_MAIN_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+
+		vqmmc-supply = <&vddio_sdmmc1>;
+	};
+
+	/* SDMMC3 (SDIO) */
+	sdhci@3440000 {
+		status = "okay";
+	};
+
+	/* SDMMC4 (eMMC) */
+	sdhci@3460000 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+
+		vqmmc-supply = <&vdd_1v8_ap>;
+		vmmc-supply = <&vdd_3v3_sys>;
+	};
+
 	hsp@3c00000 {
 		status = "okay";
 	};
-- 
2.12.0
