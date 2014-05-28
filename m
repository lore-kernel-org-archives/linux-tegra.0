From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 4/5] PCI: tegra: Remove deprecated power supply properties
Date: Wed, 28 May 2014 16:49:14 +0200
Message-ID: <1401288555-24197-5-git-send-email-thierry.reding@gmail.com>
References: <1401288555-24197-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401288555-24197-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These power supply properties are no longer needed since the binding now
contains the full set properties to accurately describe the power supply
inputs of the Tegra PCIe block.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index f56d89998a44..0823362548dc 100644
--- a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
@@ -84,11 +84,6 @@ Power supplies for Tegra30:
     - avdd-pexb-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
     - vdd-pexb-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
 
-Deprecated supplies:
-- pex-clk-supply: Supply voltage for internal reference clock
-- vdd-supply: Power supply for controller (1.05V)
-- avdd-supply: Power supply for controller (1.05V) (not required for Tegra20)
-
 Root ports are defined as subnodes of the PCIe controller node.
 
 Required properties:
-- 
1.9.2
