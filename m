From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 31/34] ARM: tegra: colibri_t30: remove unused mcp2515 can0 label
Date: Sat,  1 Sep 2018 10:12:45 +0200
Message-ID: <20180901081248.22639-32-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Get rid of the unused MCP2515 SPI CAN controller can0 label.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2:
- New patch.

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index ee0a3e5df5b8..618a4b3b6bc8 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -80,7 +80,7 @@
 		status = "okay";
 		spi-max-frequency = <25000000>;
 
-		can0: can@0 {
+		can@0 {
 			compatible = "microchip,mcp2515";
 			reg = <0>;
 			clocks = <&clk16m>;
-- 
2.14.4
