From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt-bindings: memory-controller: Update example for Tegra124 EMC
Date: Tue, 14 Jan 2020 13:38:21 +0100
Message-ID: <20200114123821.2649367-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The example in the Tegra124 EMC device tree binding looks like an old
version that doesn't contain all the required fields. Update it with a
version from the current DTS files to fix the make dt_binding_check
target.

Reported-by: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../nvidia,tegra124-emc.yaml                  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index dd1843489ad1..163d160264a7 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -363,20 +363,23 @@ examples:
             timing-0 {
                 clock-frequency = <12750000>;
 
-                nvidia,emc-zcal-cnt-long = <0x00000042>;
-                nvidia,emc-auto-cal-interval = <0x001fffff>;
-                nvidia,emc-ctt-term-ctrl = <0x00000802>;
-                nvidia,emc-cfg = <0x73240000>;
-                nvidia,emc-cfg-2 = <0x000008c5>;
-                nvidia,emc-sel-dpd-ctrl = <0x00040128>;
-                nvidia,emc-bgbias-ctl0 = <0x00000008>;
                 nvidia,emc-auto-cal-config = <0xa1430000>;
                 nvidia,emc-auto-cal-config2 = <0x00000000>;
                 nvidia,emc-auto-cal-config3 = <0x00000000>;
-                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-auto-cal-interval = <0x001fffff>;
+                nvidia,emc-bgbias-ctl0 = <0x00000008>;
+                nvidia,emc-cfg = <0x73240000>;
+                nvidia,emc-cfg-2 = <0x000008c5>;
+                nvidia,emc-ctt-term-ctrl = <0x00000802>;
                 nvidia,emc-mode-1 = <0x80100003>;
                 nvidia,emc-mode-2 = <0x80200008>;
                 nvidia,emc-mode-4 = <0x00000000>;
+                nvidia,emc-mode-reset = <0x80001221>;
+                nvidia,emc-mrs-wait-cnt = <0x000e000e>;
+                nvidia,emc-sel-dpd-ctrl = <0x00040128>;
+                nvidia,emc-xm2dqspadctrl2 = <0x0130b118>;
+                nvidia,emc-zcal-cnt-long = <0x00000042>;
+                nvidia,emc-zcal-interval = <0x00000000>;
 
                 nvidia,emc-configuration = <
                     0x00000000 /* EMC_RC */
-- 
2.24.1
