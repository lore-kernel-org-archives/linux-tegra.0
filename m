From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v5 2/8] dt: bindings: tegra20-emc: Document clock property
Date: Tue, 24 Jul 2018 19:42:15 +0300
Message-ID: <20180724164221.3307-3-digetx@gmail.com>
References: <20180724164221.3307-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724164221.3307-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Embedded memory controller has a corresponding clock, document the clock
property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
index a6fe401d0d48..add95367640b 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
@@ -11,6 +11,7 @@ Properties:
   set of tables can be present and said tables will be used
   irrespective of ram-code configuration.
 - interrupts : Should contain EMC General interrupt.
+- clocks : Should contain EMC clock.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -22,6 +23,7 @@ Example:
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f4000 0x200>;
 		interrupts = <0 78 0x04>;
+		clocks = <&tegra_car TEGRA20_CLK_EMC>;
 	}
 
 
-- 
2.18.0
