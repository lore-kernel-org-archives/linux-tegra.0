From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 5/7] dt-bindings: Add bindings for the Tegra VIC
Date: Wed, 14 Dec 2016 13:16:15 +0200
Message-ID: <20161214111617.24548-6-mperttunen@nvidia.com>
References: <20161214111617.24548-1-mperttunen@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161214111617.24548-1-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The VIC (Video Image Compositor) is a Host1x client unit
that can do various 2D composition and transform operations.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/display/tegra/nvidia,tegra20-host1x.txt        | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 0fad7ed..74e1e8a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -249,6 +249,19 @@ of the following host1x client modules:
   See ../pinctrl/nvidia,tegra124-dpaux-padctl.txt for information
   regarding the DPAUX pad controller bindings.
 
+- vic: Video Image Compositor
+  - compatible : "nvidia,tegra<chip>-vic"
+  - reg: Physical base address and length of the controller's registers.
+  - interrupts: The interrupt outputs from the controller.
+  - clocks: Must contain an entry for each entry in clock-names.
+    See ../clocks/clock-bindings.txt for details.
+  - clock-names: Must include the following entries:
+    - vic: clock input for the VIC hardware
+  - resets: Must contain an entry for each entry in reset-names.
+    See ../reset/reset.txt for details.
+  - reset-names: Must include the following entries:
+    - vic
+
 Example:
 
 / {
-- 
2.10.2
