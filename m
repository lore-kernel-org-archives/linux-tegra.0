From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] dt: update Tegra PCIe binding for Tegra210
Date: Mon,  5 Oct 2015 17:41:57 -0600
Message-ID: <1444088517-31615-2-git-send-email-swarren@wwwdotorg.org>
References: <1444088517-31615-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444088517-31615-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reword the description of the ranges property so it is correct
irrespective of how many #address-cells the PCI node's parent uses.

Be more explicit about the valid values for the compatible property, and
in particular point out that Tegra210 isn't fully backwards-compatible due
to the introduction of some HW bugs whose workarounds are not present in
drivers written solely for previous chips. with Tegra124,

Still "TODO" is to fill in a complete "Power supplies for Tegra210"
section. My main use-case for the binding is U-Boot, which doesn't use
regulator bindings at present, so I have not yet researched this aspect
of the hardware.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../bindings/pci/nvidia,tegra20-pcie.txt           | 27 +++++++++++++++-------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 75321ae23c08..3d92934a079c 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -1,10 +1,15 @@
 NVIDIA Tegra PCIe controller
 
 Required properties:
-- compatible: For Tegra20, must contain "nvidia,tegra20-pcie".  For Tegra30,
-  "nvidia,tegra30-pcie".  For Tegra124, must contain "nvidia,tegra124-pcie".
-  Otherwise, must contain "nvidia,<chip>-pcie", plus one of the above, where
-  <chip> is tegra132 or tegra210.
+- compatible: Valid options are:
+  Tegra20: "nvidia,tegra20-pcie".
+  Tegra30: "nvidia,tegra30-pcie".
+  Tegra124: "nvidia,tegra124-pcie".
+  Tegra132: "nvidia,tegra132-pcie", "nvidia,tegra124-pcie".
+  Tegra210: "nvidia,tegra210-pcie".
+    Note that Tegra210 is not backwards-compatible with Tegra124 due to the
+    introduction of some HW bugs whose workarounds are not present in drivers
+    written solely for previous chips.
 - device_type: Must be "pci"
 - reg: A list of physical base address and length for each set of controller
   registers. Must contain an entry for each entry in the reg-names property.
@@ -27,10 +32,16 @@ Required properties:
     CPU address space
 - #size-cells: Size representation for root ports (must be 2)
 - ranges: Describes the translation of addresses for root ports and standard
-  PCI regions. The entries must be 6 cells each, where the first three cells
-  correspond to the address as described for the #address-cells property
-  above, the fourth cell is the physical CPU address to translate to and the
-  fifth and six cells are as described for the #size-cells property above.
+  PCI regions. The entries must be (na_pcie + na_parent + ns_pcie) cells each,
+  where:
+    na_pcie refers to #address-cells in the PCIe controller,
+    na_parent refers to #address-cells in the PCIe controller's parent node,
+    ns_pcie refers to #size-cells in the PCIe controller,
+  The first na_pcie cells correspond to the address as described for the
+  #address-cells property. The next na_parent cells contain the physical CPU
+  address to translate to and the final ns_pcie cells are as described for the
+  #size-cells property above.
+  Multiple entries must be present:
   - The first two entries are expected to translate the addresses for the root
     port registers, which are referenced by the assigned-addresses property of
     the root port nodes (see below).
-- 
1.9.1
