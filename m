From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm64: tegra: Re-order PCIe aperture mappings
Date: Mon, 6 Jul 2020 22:44:54 +0530
Message-ID: <20200706171454.11316-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Re-order Tegra194's PCIe aperture mappings to have IO window moved to
64-bit aperture and have the entire 32-bit aperture used for accessing
the configuration space. This makes it to use the entire 32MB of the 32-bit
aperture for ECAM purpose while booting through ACPI.

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 36 ++++++++++++------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4bc187a4eacd..2b378fa06d19 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1404,9 +1404,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x30100000 0x0  0x30100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0x30000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0xc3000000 0x12 0x00000000 0x12 0x00000000 0x0 0x30000000   /* prefetchable memory (768MB) */
+			  0x82000000 0x00 0x40000000 0x12 0x30000000 0x0 0x0fff0000   /* non-prefetchable memory (256MB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x12 0x3fff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie@14120000 {
@@ -1449,9 +1449,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x32100000 0x0  0x32100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0x70000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0xc3000000 0x12 0x40000000 0x12 0x40000000 0x0 0x30000000   /* prefetchable memory (768MB) */
+			  0x82000000 0x00 0x40000000 0x12 0x70000000 0x0 0x0fff0000   /* non-prefetchable memory (256MB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x12 0x7fff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie@14140000 {
@@ -1494,9 +1494,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x34100000 0x0  0x34100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
-			  0x82000000 0x0  0x40000000 0x12 0xb0000000 0x0 0x10000000>; /* non-prefetchable memory (256MB) */
+		ranges = <0xc3000000 0x12 0x80000000 0x12 0x80000000 0x0 0x30000000   /* prefetchable memory (768MB) */
+			  0x82000000 0x00 0x40000000 0x12 0xb0000000 0x0 0x0fff0000   /* non-prefetchable memory (256MB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x12 0xbfff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie@14160000 {
@@ -1539,9 +1539,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x36100000 0x0  0x36100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x17 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0xc3000000 0x14 0x00000000 0x14 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
+			  0x82000000 0x00 0x40000000 0x17 0x40000000 0x0 0xbfff0000   /* non-prefetchable memory (3GB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x17 0xffff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie@14180000 {
@@ -1584,9 +1584,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x38100000 0x0  0x38100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x1b 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0xc3000000 0x18 0x00000000 0x18 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
+			  0x82000000 0x00 0x40000000 0x1b 0x40000000 0x0 0xbfff0000   /* non-prefetchable memory (3GB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x1b 0xffff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie@141a0000 {
@@ -1633,9 +1633,9 @@
 		nvidia,aspm-l0s-entrance-latency-us = <3>;
 
 		bus-range = <0x0 0xff>;
-		ranges = <0x81000000 0x0  0x3a100000 0x0  0x3a100000 0x0 0x00100000   /* downstream I/O (1MB) */
-			  0xc3000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
-			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
+		ranges = <0xc3000000 0x1c 0x00000000 0x1c 0x00000000 0x3 0x40000000   /* prefetchable memory (13GB) */
+			  0x82000000 0x00 0x40000000 0x1f 0x40000000 0x0 0xbfff0000   /* non-prefetchable memory (3GB - 64KB) */
+			  0x81000000 0x00 0x00000000 0x1f 0xffff0000 0x0 0x00010000>; /* downstream I/O (64KB) */
 	};
 
 	pcie_ep@14160000 {
-- 
2.17.1
