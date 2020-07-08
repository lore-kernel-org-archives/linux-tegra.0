From: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v10 4/5] dt-bindings: arm-smmu: add binding for Tegra194 SMMU
Date: Tue, 7 Jul 2020 22:00:16 -0700
Message-ID: <20200708050017.31563-5-vdumpa@nvidia.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708050017.31563-1-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add binding for NVIDIA's Tegra194 SoC SMMU.

Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Docume=
ntation/devicetree/bindings/iommu/arm,smmu.yaml
index d7ceb4c34423..ac1f526c3424 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -38,6 +38,11 @@ properties:
               - qcom,sc7180-smmu-500
               - qcom,sdm845-smmu-500
           - const: arm,mmu-500
+      - description: NVIDIA SoCs that program two ARM MMU-500s identically
+        items:
+          - enum:
+              - nvidia,tegra194-smmu
+          - const: nvidia,smmu-500
       - items:
           - const: arm,mmu-500
           - const: arm,smmu-v2
@@ -138,6 +143,19 @@ required:
=20
 additionalProperties: false
=20
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nvidia,tegra194-smmu
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
 examples:
   - |+
     /* SMMU with stream matching or stream indexing */
--=20
2.26.2
