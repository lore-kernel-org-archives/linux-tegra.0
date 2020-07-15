From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [RFC PATCH v3 02/18] arm64: tegra: Add missing clocks and power-domains to Tegra210 VI I2C
Date: Tue, 14 Jul 2020 21:20:39 -0700
Message-ID: <1594786855-26506-3-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com, hverkuil@xs4all.nl, sakari.ailus@iki.fi, robh+dt@kernel.org, helen.koike@collabora.com
Cc: digetx@gmail.com, sboyd@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 VI I2C is in VE power domain and i2c-vi node should have
power-domains property.

Current Tegra210 i2c-vi device node is missing both VI I2C clocks
and power-domains property.

This patch adds them.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index f4e0cc2..3827e43 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -375,6 +375,12 @@
 			compatible = "nvidia,tegra210-i2c-vi";
 			reg = <0x0 0x546c0000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA210_CLK_VI_I2C>,
+				 <&tegra_car TEGRA210_CLK_I2CSLOW>;
+			clock-names = "div-clk", "slow";
+			resets = <&tegra_car TEGRA210_CLK_VI_I2C>;
+			reset-names = "i2c";
+			power-domains = <&pd_venc>;
 			status = "disabled";
 		};
 	};
-- 
2.7.4
