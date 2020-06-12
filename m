From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 18/38] dt-bindings: usb: tegra-xusb: Document interconnect paths
Date: Fri, 12 Jun 2020 16:18:43 +0200
Message-ID: <20200612141903.2391044-19-thierry.reding@gmail.com>
References: <20200612141903.2391044-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200612141903.2391044-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add optional interconnects and interconnect-names properties to allow
describing the interconnect paths to and from the XUSB controller.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
index 4d9e4cfc459a..cb1d9a6f5acc 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
@@ -82,6 +82,17 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: Description of the interconnect paths for the XHCI
+      controller; see ../interconnect/interconnect.txt for details.
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
+      - const: write
+
   phys:
     description: Must contain an entry for each entry in phy-names. See
       ../phy/phy-bindings.txt for details.
-- 
2.24.1
