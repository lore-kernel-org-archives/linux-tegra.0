From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/38] dt-bindings: interrupt-controller: arm,gic: Add compatible for Tegra186 AGIC
Date: Fri, 12 Jun 2020 16:18:26 +0200
Message-ID: <20200612141903.2391044-2-thierry.reding@gmail.com>
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

The AGIC variant of GIC found in the audio subsystem of NVIDIA Tegra186
SoCs is mostly compatible with the version found on Tegra210. Provide a
Tegra210 compatible as a fallback compatible, but also require a
Tegra186 specific compatible for forwards compatibility in case there's
ever a need to implement instantiation-specific quirks.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 96f8803ff4e6..becc4364e419 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -53,6 +53,13 @@ properties:
           - const: brcm,brahma-b15-gic
           - const: arm,cortex-a15-gic
 
+      - items:
+          - enum:
+              - nvidia,tegra186-agic
+              - nvidia,tegra194-agic
+          - enum:
+              - nvidia,tegra210-agic
+
   interrupt-controller: true
 
   "#address-cells":
-- 
2.24.1
