From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 06/38] dt-bindings: display: tegra: Document display-hub
Date: Fri, 12 Jun 2020 16:18:31 +0200
Message-ID: <20200612141903.2391044-7-thierry.reding@gmail.com>
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

Tegra186 and later have an additional component in the display pipeline
called the display hub. Document the bindings which were missing.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../display/tegra/nvidia,tegra20-host1x.txt   | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 47319214b5f6..2cf3cc4893da 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,56 @@ of the following host1x client modules:
   - reset-names: Must include the following entries:
     - vic
 
+- display-hub: display controller hub
+  Required properties:
+  - compatible: "nvidia,tegra<chip>-display"
+  - reg: Physical base address and length of the controller's registers.
+  - interrupts: The interrupt outputs from the controller.
+  - clocks: Must contain an entry for each entry in clock-names.
+    See ../clocks/clock-bindings.txt for details.
+  - clock-names: Must include the following entries:
+    - disp
+    - dsc
+    - hub
+  - resets: Must contain an entry for each entry in reset-names.
+    See ../reset/reset.txt for details.
+  - reset-names: Must include the following entries:
+    - misc
+    - wgrp0
+    - wgrp1
+    - wgrp2
+    - wgrp3
+    - wgrp4
+    - wgrp5
+  - power-domains: A list of phandle and specifiers identifying the power
+    domains that the display hub is part of.
+  - ranges: Range of registers used for the display controllers.
+
+  Each subnode of the display hub represents one of the display controllers
+  available:
+
+  - display: display controller
+    - compatible: "nvidia,tegra<chip>-dc"
+    - reg: Physical base address and length of the controller's registers.
+    - interrupts: The interrupt outputs from the controller.
+    - clocks: Must contain an entry for each entry in clock-names.
+      See ../clocks/clock-bindings.txt for details.
+    - clock-names: Must include the following entries:
+      - dc
+    - resets: Must contain an entry for each entry in reset-names.
+      See ../reset/reset.txt for details.
+    - reset-names: Must include the following entries:
+      - dc
+    - power-domains: A list of phandle and specifiers that identify the power
+      domains that this display controller is part of.
+    - iommus: A phandle and specifier identifying the SMMU master interface of
+      this display controller.
+    - nvidia,outputs: A list of phandles of outputs that this display
+      controller can drive.
+    - nvidia,head: The number of the display controller head. This is used to
+      setup the various types of output to receive video data from the given
+      head.
+
 Example:
 
 / {
-- 
2.24.1
