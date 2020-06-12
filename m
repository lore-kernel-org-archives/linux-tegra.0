From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 27/38] dt-bindings: tegra: Add missing compatible strings
Date: Fri, 12 Jun 2020 16:18:52 +0200
Message-ID: <20200612141903.2391044-28-thierry.reding@gmail.com>
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

The Nyan Blaze and Nyan Big, as well as Jetson Nano (P3450-0000), Darcy
(P2894-0050-A08) and Pixel C (Smaug) were never mentioned. Add them.

While at it, also fix a typo in the compatible string for Apalis Tegra30
v1.1 evaluation board.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/arm/tegra.yaml        | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 60b38eb5c61a..043ca543be8c 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -49,7 +49,7 @@ properties:
           - const: toradex,apalis_t30
           - const: nvidia,tegra30
       - items:
-          - const: toradex,apalis_t30-eval-v1.1
+          - const: toradex,apalis_t30-v1.1-eval
           - const: toradex,apalis_t30-eval
           - const: toradex,apalis_t30-v1.1
           - const: toradex,apalis_t30
@@ -80,6 +80,33 @@ properties:
           - const: toradex,apalis-tk1-v1.2
           - const: toradex,apalis-tk1
           - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-blaze-rev10
+          - const: google,nyan-blaze-rev9
+          - const: google,nyan-blaze-rev8
+          - const: google,nyan-blaze-rev7
+          - const: google,nyan-blaze-rev6
+          - const: google,nyan-blaze-rev5
+          - const: google,nyan-blaze-rev4
+          - const: google,nyan-blaze-rev3
+          - const: google,nyan-blaze-rev2
+          - const: google,nyan-blaze-rev1
+          - const: google,nyan-blaze-rev0
+          - const: google,nyan-blaze
+          - const: google,nyan
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,norrin
@@ -91,7 +118,22 @@ properties:
               - nvidia,p2371-0000
               - nvidia,p2371-2180
               - nvidia,p2571
-              - nvidia,p2894-0050-a08
+              - nvidia,p3450-0000
+          - const: nvidia,tegra210
+      - items:
+          - const: nvidia,p2894-0050-a08
+          - const: nvidia,darcy
+          - const: nvidia,tegra210
+      - items:
+          - const: google,smaug-rev8
+          - const: google,smaug-rev7
+          - const: google,smaug-rev6
+          - const: google,smaug-rev5
+          - const: google,smaug-rev4
+          - const: google,smaug-rev3
+          - const: google,smaug-rev2
+          - const: google,smaug-rev1
+          - const: google,smaug
           - const: nvidia,tegra210
       - items:
           - enum:
-- 
2.24.1
