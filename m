From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 141/191] ARM: tegra: colibri_t30: fix mcp2515 can controller interrupt polarity
Date: Sat,  9 Nov 2019 21:39:23 -0500
Message-ID: <20191110024013.29782-141-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <treding@nvidia.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

[ Upstream commit 503fcd8464fb6cd18073e97dec59b933930655d6 ]

Fix the MCP2515 SPI CAN controller interrupt polarity which according
to its datasheet defaults to low-active aka falling edge.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
index 16e1f387aa6db..a0c550e26738f 100644
--- a/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
+++ b/arch/arm/boot/dts/tegra30-colibri-eval-v3.dts
@@ -79,7 +79,8 @@
 			reg = <0>;
 			clocks = <&clk16m>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_RISING>;
+			/* CAN_INT */
+			interrupts = <TEGRA_GPIO(S, 0) IRQ_TYPE_EDGE_FALLING>;
 			spi-max-frequency = <10000000>;
 		};
 		spidev0: spi@1 {
-- 
2.20.1
