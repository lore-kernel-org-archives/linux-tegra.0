From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 5/8] ARM: dts: tegra20: Add clock entry to External Memory Controller
Date: Tue, 24 Jul 2018 19:42:18 +0300
Message-ID: <20180724164221.3307-6-digetx@gmail.com>
References: <20180724164221.3307-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724164221.3307-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Add clock entry into the EMC DT node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 9eb4163a4390..979f38293fe5 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -633,6 +633,7 @@
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f400 0x200>;
 		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 	};
-- 
2.18.0
