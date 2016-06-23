From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] dt-bindings: display: tegra: Add source clock for SOR
Date: Thu, 23 Jun 2016 12:27:58 +0200
Message-ID: <20160623102759.23078-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The SOR clock can have various sources, with the most commonly used
being the sor_safe, pll_d2_out0, pll_dp and sor_brick clocks. These
are configured using a three level mux, of which the first 2 levels
can be treated as one. The direct parents of the SOR clock are the
sor_safe, sor_brick and sor_src clocks, whereas the pll_d2_out0 and
pll_dp clocks can be selected as parents of the sor_src clock via a
second mux.

Previous generations of Tegra have only supported eDP and LVDS with
the SOR, where LVDS was never used on publicly available hardware.
Clocking for this only ever required the first level mux (to select
between sor_safe and sor_brick).

Tegra210 has a new revision of the SOR that supports HDMI and hence
needs to support the second level mux to allow selecting pll_d2_out0
as the SOR clock's parent. This second mux is knows as sor_src, and
operating system software needs a reference to it in order to select
the proper parent.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index a3bd8c050c4e..21de27a7f0a1 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -208,6 +208,7 @@ of the following host1x client modules:
     See ../clocks/clock-bindings.txt for details.
   - clock-names: Must include the following entries:
     - sor: clock input for the SOR hardware
+    - source: source clock for the SOR clock
     - parent: input for the pixel clock
     - dp: reference clock for the SOR clock
     - safe: safe reference for the SOR clock during power up
-- 
2.8.3
