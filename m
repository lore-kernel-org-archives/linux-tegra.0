From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH v2 32/34] ARM: tegra: colibri_t30: add mcp2515 vdd and xceiver supplies
Date: Sat,  1 Sep 2018 10:12:46 +0200
Message-ID: <20180901081248.22639-33-marcel@ziswiler.com>
References: <20180901081248.22639-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180901081248.22639-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Add the MCP2515 SPI CAN controller's vdd-supply being the regular
carrier board's reg_3v3 and xceiver-supply being reg_5v0.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes in v2: None

 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 618a4b3b6bc8..9985d0a91f69 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -88,6 +88,8 @@
 			/* CAN_INT */
 			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_FALLING>;
 			spi-max-frequency = <10000000>;
+			vdd-supply = <&reg_3v3>;
+			xceiver-supply = <&reg_5v0>;
 		};
 	};
 
-- 
2.14.4
