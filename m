From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 38/38] dt-bindings: serial: Document Tegra-specific properties
Date: Fri, 12 Jun 2020 16:19:03 +0200
Message-ID: <20200612141903.2391044-39-thierry.reding@gmail.com>
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

On Tegra the UART is described using additional properties, such as
clock-names, reset-names, dmas and dma-names. Document them in the
bindings so that Tegra device trees are properly validated.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/serial/8250.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index c1d4c196f005..9c8fad27c3f3 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -28,6 +28,32 @@ allOf:
           const: 2
       required:
         - reg-shift
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra20-uart
+    then:
+      properties:
+        clock-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: serial
+
+        dmas:
+          $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+        dma-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: rx
+            - const: tx
+
+        reset-names:
+          $ref: "/schemas/types.yaml#/definitions/string-array"
+          items:
+            - const: serial
   - if:
       not:
         properties:
-- 
2.24.1
