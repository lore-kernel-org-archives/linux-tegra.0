From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 4/5] PCI: tegra: Remove deprecated power supply properties
Date: Fri, 4 Apr 2014 16:49:28 +0200
Message-ID: <1396622969-17837-5-git-send-email-treding@nvidia.com>
References: <1396622969-17837-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396622969-17837-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These power supply properties are no longer needed since the binding now
contains the full set properties to accurately describe the power supply
inputs of the Tegra PCIe block.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
index 66e8aca4aef0..5207d4cd1fa2 100644
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
1.9.1
