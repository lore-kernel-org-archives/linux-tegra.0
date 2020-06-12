From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 20/38] dt-bindings: net: dwc-qos-ethernet: Document interconnect paths
Date: Fri, 12 Jun 2020 16:18:45 +0200
Message-ID: <20200612141903.2391044-21-thierry.reding@gmail.com>
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

Add optional interconnects and interconnect-names properties to allow
describing the interconnect paths to and from the Ethernet device.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/net/snps,dwc-qos-ethernet.yaml        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
index 252f11affd6b..779e06b32278 100644
--- a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.yaml
@@ -123,6 +123,15 @@ properties:
     description: Enable gating of the MAC TX clock during TX low-power mode.
     $ref: "/schemas/types.yaml#/definitions/flag"
 
+  interconnects:
+    description: Description of the interconnect paths for the ethernet
+      controller; see ../interconnect/interconnect.txt for details.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+
   mdio:
     description: A subnode representing the GMAC's MDIO bus.
     type: object
@@ -208,6 +217,11 @@ allOf:
             - const: tx
             - const: ptp_ref
 
+        interconnect-names:
+          items:
+            - const: dma-mem # read
+            - const: write
+
       required:
         - resets
         - reset-names
-- 
2.24.1
