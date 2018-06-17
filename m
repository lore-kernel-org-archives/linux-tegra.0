From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 5/8] ARM: dts: tegra20: Add clock entry to External Memory Controller
Date: Sun, 17 Jun 2018 17:55:36 +0300
Message-ID: <20180617145539.4758-6-digetx@gmail.com>
References: <20180617145539.4758-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617145539.4758-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add clock entry into the EMC DT node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 3cd3cb28cfd9..877e41fe87cf 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -610,6 +610,7 @@
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x200>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
-- 
2.17.1
