From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 14/38] dt-bindings: pci: tegra: Document interconnect paths
Date: Fri, 12 Jun 2020 16:18:39 +0200
Message-ID: <20200612141903.2391044-15-thierry.reding@gmail.com>
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
describing the interconnect paths to and from the PCIe controller.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/pci/nvidia,tegra20-pcie.yaml  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
index e7cc95bfa810..3b8a4da23934 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.yaml
@@ -104,6 +104,17 @@ properties:
   iommus:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: Description of the interconnect paths for the PCIe controller;
+      see ../interconnect/interconnect.txt for details.
+
+  interconnect-names:
+    description: A list of names identifying each entry listed in the
+      "interconnects" property.
+    items:
+      - const: dma-mem # read
+      - const: write
+
   pinctrl-names:
     items:
         # active state, puts PCIe I/O out of deep power down state
-- 
2.24.1
