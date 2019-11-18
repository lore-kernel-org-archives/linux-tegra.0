From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 03/29] dt-bindings: memory: tegra30: mc: Document new interconnect property
Date: Mon, 18 Nov 2019 23:02:21 +0300
Message-ID: <20191118200247.3567-4-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
designates memory controller as interconnect provider.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra30-mc.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
index 84fd57bcf0dc..5436e6d420bc 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-mc.yaml
@@ -57,6 +57,9 @@ properties:
   "#iommu-cells":
     const: 1
 
+  "#interconnect-cells":
+    const: 1
+
 patternProperties:
   "^emc-timings-[0-9]+$":
     type: object
@@ -120,6 +123,7 @@ required:
   - clock-names
   - "#reset-cells"
   - "#iommu-cells"
+  - "#interconnect-cells"
 
 additionalProperties: false
 
@@ -135,6 +139,7 @@ examples:
 
         #iommu-cells = <1>;
         #reset-cells = <1>;
+        #interconnect-cells = <1>;
 
         emc-timings-1 {
             nvidia,ram-code = <1>;
-- 
2.23.0
