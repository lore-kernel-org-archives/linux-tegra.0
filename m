From: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ARM: dts: tegra: Correct PCIe entry
Date: Mon, 8 Apr 2013 21:11:27 +0530
Message-ID: <1365435688-4179-2-git-send-email-jagarwal@nvidia.com>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1365435688-4179-1-git-send-email-jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

- Add interrupt-names property
- Correct downstream I/O size
- Correct cml clock name for tegra30
- Based on git://gitorious.org/thierryreding/linux.git

 arch/arm/boot/dts/tegra30.dtsi |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 5a270ff..289ef93 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -124,7 +124,7 @@
 		reg-names = "pads", "afi", "cs";
 		interrupts = <0 98 0x04   /* controller interrupt */
 		              0 99 0x04>; /* MSI interrupt */
-
+		interrupt-names = "intr", "msi";
 		bus-range = <0x00 0xff>;
 		#address-cells = <3>;
 		#size-cells = <2>;
@@ -132,13 +132,13 @@
 		ranges = <0x82000000 0 0x00000000 0x00000000 0 0x00001000   /* port 0 configuration space */
 			  0x82000000 0 0x00001000 0x00001000 0 0x00001000   /* port 1 configuration space */
 			  0x82000000 0 0x00004000 0x00004000 0 0x00001000   /* port 2 configuration space */
-			  0x81000000 0 0          0x02000000 0 0x00010000   /* downstream I/O */
+			  0x81000000 0 0          0x02000000 0 0x00100000   /* downstream I/O */
 			  0x82000000 0 0x20000000 0x20000000 0 0x10000000   /* non-prefetchable memory */
 			  0xc2000000 0 0x30000000 0x30000000 0 0x10000000>; /* prefetchable memory */
 
 		clocks = <&tegra_car 70>, <&tegra_car 72>, <&tegra_car 74>,
 			 <&tegra_car 118>, <&tegra_car 215>;
-		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml";
+		clock-names = "pex", "afi", "pcie_xclk", "pll_e", "cml0";
 		status = "disabled";
 
 		pci@1,0 {
-- 
1.7.0.4
