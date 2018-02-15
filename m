From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 4/7] dt-bindings: tegra: Add missing chips and NVIDIA boards
Date: Thu, 15 Feb 2018 16:52:03 +0200
Message-ID: <20180215145206.24775-5-mperttunen@nvidia.com>
References: <20180215145206.24775-1-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180215145206.24775-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add compatibility strings for supported but undocumented Tegra chips
(Tegra114/124/132/210/186/194) and reference boards.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---

Notes:
    v2:
    - add patch

 Documentation/devicetree/bindings/arm/tegra.txt | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.txt b/Documentation/devicetree/bindings/arm/tegra.txt
index 7f1411bbabf7..32f62bb7006d 100644
--- a/Documentation/devicetree/bindings/arm/tegra.txt
+++ b/Documentation/devicetree/bindings/arm/tegra.txt
@@ -9,6 +9,12 @@ following compatible values:
 
   nvidia,tegra20
   nvidia,tegra30
+  nvidia,tegra114
+  nvidia,tegra124
+  nvidia,tegra132
+  nvidia,tegra210
+  nvidia,tegra186
+  nvidia,tegra194
 
 Boards
 -------------------------------------------
@@ -26,8 +32,18 @@ board-specific compatible values:
   nvidia,cardhu
   nvidia,cardhu-a02
   nvidia,cardhu-a04
+  nvidia,dalmore
   nvidia,harmony
+  nvidia,jetson-tk1
+  nvidia,norrin
+  nvidia,p2371-0000
+  nvidia,p2371-2180
+  nvidia,p2571
+  nvidia,p2771-0000
+  nvidia,p2972-0000
+  nvidia,roth
   nvidia,seaboard
+  nvidia,tn7
   nvidia,ventana
   toradex,apalis_t30
   toradex,apalis_t30-eval
-- 
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
