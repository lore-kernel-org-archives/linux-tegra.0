From: Wei Ni <wni@nvidia.com>
Subject: [PATCH v1 10/12] arm64: dts: tegra210: set EDP interrupt line
Date: Tue, 18 Dec 2018 15:34:42 +0800
Message-ID: <1545118484-23641-12-git-send-email-wni@nvidia.com>
References: <1545118484-23641-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1545118484-23641-1-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, daniel.lezcano@linaro.org, edubezval@gmail.com, linux-tegra@vger.kernel.org
Cc: rui.zhang@intel.com, srikars@nvidia.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Wei Ni <wni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Set EDP interrupt line.

Signed-off-by: Wei Ni <wni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 57dae9cc7b7d..b4531a8c18f6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1324,7 +1324,8 @@
 		reg = <0x0 0x700e2000 0x0 0x600 /* SOC_THERM reg_base */
 			0x0 0x60006000 0x0 0x400>; /* CAR reg_base */
 		reg-names = "soctherm-reg", "car-reg";
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH
+			      GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA210_CLK_TSENSOR>,
 			<&tegra_car TEGRA210_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
-- 
2.7.4
