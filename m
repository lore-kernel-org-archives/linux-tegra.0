From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v6 1/8] dt: bindings: tegra20-emc: Document interrupt property
Date: Sun, 21 Oct 2018 21:30:45 +0300
Message-ID: <20181021183052.32023-2-digetx@gmail.com>
References: <20181021183052.32023-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021183052.32023-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

EMC has a dedicated interrupt that is used to notify about completion of
HW operations. Document the interrupt property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 .../devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
index 4c33b29dc660..a6fe401d0d48 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-emc.txt
@@ -10,6 +10,7 @@ Properties:
   and chosen using the ramcode board selector. If omitted, only one
   set of tables can be present and said tables will be used
   irrespective of ram-code configuration.
+- interrupts : Should contain EMC General interrupt.
 
 Child device nodes describe the memory settings for different configurations and clock rates.
 
@@ -20,6 +21,7 @@ Example:
 		#size-cells = < 0 >;
 		compatible = "nvidia,tegra20-emc";
 		reg = <0x7000f4000 0x200>;
+		interrupts = <0 78 0x04>;
 	}
 
 
-- 
2.19.0
