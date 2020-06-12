From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/38] dt-bindings: display: tegra: Document interconnect paths
Date: Fri, 12 Jun 2020 16:18:33 +0200
Message-ID: <20200612141903.2391044-9-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.yaml  | 52 ++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3347e1b3c8f0..684fe25641f1 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -97,8 +97,17 @@ properties:
   iommus:
     $ref: "/schemas/iommu/iommu.yaml#/properties/iommus"
 
-  memory-controllers:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+  interconnects:
+    description: Description of the interconnect paths for the host1x
+      controller; see ../interconnect/interconnect.txt for details.
+    items:
+      - description: memory read client for host1x
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
 
 required:
   - compatible
@@ -489,6 +498,26 @@ allOf:
             iommus:
               $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+            #interconnects:
+            #  items:
+            #    - description: memory read client for window A
+            #    - description: memory read client for window B
+            #    - description: memory read client for window C
+            #    - description: memory read client for cursor
+            #    # disp only
+            #    - description: memory read client for window T
+            #    - description: memory read client for window D
+
+            #interconnect-names:
+            #  items:
+            #    - const: wina
+            #    - const: winb
+            #    - const: winc
+            #    - const: cursor
+            #    # disp only
+            #    - const: wint
+            #    - const: wind
+
             nvidia,head:
               description: The number of the display controller head. This is
                 used to setup the various types of output to receive video
@@ -634,8 +663,15 @@ allOf:
                     master interface of this display controller.
                   $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
-                memory-controllers:
-                  $ref: /schemas/types.yaml#/definitions/phandle-array
+                interconnects:
+                  description: Description of the interconnect paths for the
+                    display controller; see ../interconnect/interconnect.txt
+                    for details.
+
+                interconnect-names:
+                  items:
+                    - const: dma-mem # read-0
+                    - const: read-1
 
                 nvidia,outputs:
                   description: A list of phandles of outputs that this display
@@ -1027,8 +1063,12 @@ allOf:
             iommus:
               $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
-            memory-controllers:
-              $ref: /schemas/types.yaml#/definitions/phandle-array
+            interconnects: true
+
+            interconnect-names:
+              items:
+                - const: dma-mem # read
+                - const: write
 
           unevaluatedProperties: false
 
-- 
2.24.1
