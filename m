From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
Date: Thu, 29 Aug 2019 12:56:47 +0200
Message-ID: <20190829105647.15212-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

For some reason this was never hooked up. Do it now so that over-current
interrupts can be logged.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 2db208f20191..a20cd368a772 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1458,7 +1458,9 @@
 		reg = <0x0 0x700e2000 0x0 0x600 /* SOC_THERM reg_base */
 			0x0 0x60006000 0x0 0x400>; /* CAR reg_base */
 		reg-names = "soctherm-reg", "car-reg";
-		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "thermal", "edp";
 		clocks = <&tegra_car TEGRA210_CLK_TSENSOR>,
 			<&tegra_car TEGRA210_CLK_SOC_THERM>;
 		clock-names = "tsensor", "soctherm";
-- 
2.22.0
