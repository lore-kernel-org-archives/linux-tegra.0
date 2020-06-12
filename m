From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 34/38] dt-bindings: memory-controller: Fix "reg" entries on Tegra194
Date: Fri, 12 Jun 2020 16:18:59 +0200
Message-ID: <20200612141903.2391044-35-thierry.reding@gmail.com>
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

The Tegra194 memory controller needs a couple more "reg" entries.
Document this properly so that device trees can be validated.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../nvidia,tegra186-mc.yaml                   | 39 ++++++++++++++-----
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
index 774b04d0da0d..b04485c5cf5f 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
@@ -27,13 +27,15 @@ properties:
     pattern: "^memory-controller@[0-9a-f]+$"
 
   compatible:
-    items:
-      - enum:
-          - nvidia,tegra186-mc
-          - nvidia,tegra194-mc
+    oneOf:
+      - description: NVIDIA Tegra186 memory controller
+        const: nvidia,tegra186-mc
+      - description: NVIDIA Tegra194 memory controller
+        const: nvidia,tegra194-mc
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   interrupts:
     maxItems: 1
@@ -74,12 +76,13 @@ patternProperties:
               - nvidia,tegra186-emc
               - nvidia,tegra194-emc
 
-      reg:
-        maxItems: 1
-
       interrupts:
         maxItems: 1
 
+      reg:
+        minItems: 1
+        maxItems: 2
+
       clocks:
         items:
           - description: external memory clock
@@ -107,11 +110,18 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nvidia,tegra194-mc
+            anyOf:
+              - const: nvidia,tegra194-mc
     then:
       properties:
         reg:
+          minItems: 3
           maxItems: 3
+    else:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
 
   - if:
       patternProperties:
@@ -119,13 +129,22 @@ allOf:
           properties:
             compatible:
               contains:
-                const: nvidia,tegra194-emc
+                anyOf:
+                  - const: nvidia,tegra194-emc
     then:
       patternProperties:
         "^external-memory-controller@[0-9a-f]+$":
           properties:
             reg:
+              minItems: 2
               maxItems: 2
+    else:
+      patternProperties:
+        "^external-memory-controller@[0-9a-f]+$":
+          properties:
+            reg:
+              minItems: 1
+              maxItems: 1
 
 examples:
   - |
-- 
2.24.1
