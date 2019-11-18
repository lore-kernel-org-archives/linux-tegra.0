From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 06/29] dt-bindings: memory: tegra124: emc: Document new interconnect property
Date: Mon, 18 Nov 2019 23:02:24 +0300
Message-ID: <20191118200247.3567-7-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

External memory controller is interconnected with memory controller and
with external memory. Document new interconnect property which designates
external memory controller as interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.txt        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
index ba0bc3f12419..ff48b46604e6 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.txt
@@ -5,6 +5,7 @@ Required properties :
 - compatible : Should be "nvidia,tegra124-emc".
 - reg : physical base address and length of the controller's registers.
 - nvidia,memory-controller : phandle of the MC driver.
+- #interconnect-cells : Should be 1.
 
 The node should contain a "emc-timings" subnode for each supported RAM type
 (see field RAM_CODE in register PMC_STRAPPING_OPT_A), with its unit address
@@ -195,6 +196,8 @@ Example SoC include file:
 		reg = <0x0 0x7001b000 0x0 0x1000>;
 
 		nvidia,memory-controller = <&mc>;
+
+		#interconnect-cells = <1>;
 	};
 };
 
-- 
2.23.0
