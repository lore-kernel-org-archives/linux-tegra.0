From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 03/38] dt-bindings: memory: Increase number of reg entries on Tegra194
Date: Fri, 12 Jun 2020 16:18:28 +0200
Message-ID: <20200612141903.2391044-4-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The memory controller and external memory controller control multiple
channels that require additional register ranges. Allow the number of
ranges to be up to 3 or 2 for the memory controller and the external
memory controller, respectively.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../nvidia,tegra186-mc.yaml                   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 581572fe3077..774b04d0da0d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -102,6 +102,31 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nvidia,tegra194-mc
+    then:
+      properties:
+        reg:
+          maxItems: 3
+
+  - if:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            compatible:
+              contains:
+                const: nvidia,tegra194-emc
+    then:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            reg:
+              maxItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/tegra186-clock.h>
-- 
2.24.1
