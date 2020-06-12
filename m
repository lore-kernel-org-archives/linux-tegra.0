From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/38] dt-bindings: gpu: tegra: Document interconnect paths
Date: Fri, 12 Jun 2020 16:18:35 +0200
Message-ID: <20200612141903.2391044-11-thierry.reding@gmail.com>
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
 .../devicetree/bindings/gpu/nvidia,gk20a.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
index 726ef39b2221..40191e1a241e 100644
--- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
+++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
@@ -71,6 +71,21 @@ properties:
       ../iommu/iommu.txt for details.
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
 
+  interconnects:
+    description: A list of phandle and specifier pairs that describe the
+      interconnect paths to and from the GPU.
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+
+  interconnect-names:
+    description: One string for each pair of phandle and specifier in the
+      "interconnects" property.
+    $ref: "/schemas/types.yaml#/definitions/string-array"
+    items:
+      - const: dma-mem # read-0
+      - const: write-0
+      - const: read-1
+      - const: write-1
+
 required:
   - compatible
   - reg
-- 
2.24.1
