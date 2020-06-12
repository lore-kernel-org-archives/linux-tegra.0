From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 36/38] dt-bindings: power: supply: sbs-battery: Document TI BQ20Z45 compatible
Date: Fri, 12 Jun 2020 16:19:01 +0200
Message-ID: <20200612141903.2391044-37-thierry.reding@gmail.com>
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

The TI BQ20Z45 battery is used for example on Tegra114 Dalmore but was
never documented. Add the missing compatible string.

While at it, also pull in the power-supply.yaml core bindings so that
the standard power-supplies property is properly validated. Also switch
to unevaluatedProperties to make sure the power-supply.yaml snippet is
properly validated against (additionalProperties doesn't have visibility
across a $ref).

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/power/supply/sbs,sbs-battery.yaml   | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
index 205bc826bd20..bb2803850ea6 100644
--- a/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
+++ b/Documentation/devicetree/bindings/power/supply/sbs,sbs-battery.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - ti,bq20z45
               - ti,bq20z65
               - ti,bq20z75
           - enum:
@@ -62,7 +63,10 @@ required:
   - compatible
   - reg
 
-additionalProperties: false
+allOf:
+  - $ref: power-supply.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.24.1
