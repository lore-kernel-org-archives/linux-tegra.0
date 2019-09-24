From: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 08/11] dts: arm64: layerscape: add dma-ranges property to pcie nodes
Date: Tue, 24 Sep 2019 20:12:39 +0200
Message-ID: <20190924181244.7159-9-nsaenzjulienne@suse.de>
References: <20190924181244.7159-1-nsaenzjulienne@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20190924181244.7159-1-nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, etnaviv-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Li Yang <leoyang.li-3arQi8VN3Tc@public.gmane.org>
Cc: mbrugger-IBi9RG/b67k@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, james.quinlan-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, wahrenst-hi6Y0CQ0nG0@public.gmane.org, Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The bus behind the board's PCIe core has DMA addressing limitations. Add
an empty 'dma-ranges' property on all PCIe bus descriptions to inform
the OF core that a translation is due further down the line.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne-l3A5Bk7waGM@public.gmane.org>
---

 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index fd6036b7865c..2c41cfc66bb9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -640,6 +640,7 @@
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
+			dma-ranges;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
@@ -661,6 +662,7 @@
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
+			dma-ranges;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
@@ -682,6 +684,7 @@
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
+			dma-ranges;
 			num-viewport = <256>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
@@ -703,6 +706,7 @@
 			#size-cells = <2>;
 			device_type = "pci";
 			dma-coherent;
+			dma-ranges;
 			num-viewport = <6>;
 			bus-range = <0x0 0xff>;
 			msi-parent = <&its>;
-- 
2.23.0
