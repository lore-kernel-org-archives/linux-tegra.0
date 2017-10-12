From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/6] ARM: tegra: limit PCIe config space mapping to 4K for T30
Date: Fri, 13 Oct 2017 00:20:08 +0530
Message-ID: <1507834211-24922-4-git-send-email-vidyas@nvidia.com>
References: <1507834211-24922-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507834211-24922-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

reduces PCIe config space mapping size from its current
256MB to 4K to have only 4K of virtual memory mapping and to be
in line with driver implementation

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 13960fda7471..b23171f2b86f 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -15,7 +15,7 @@
 		device_type = "pci";
 		reg = <0x00003000 0x00000800   /* PADS registers */
 		       0x00003800 0x00000200   /* AFI registers */
-		       0x10000000 0x10000000>; /* configuration space */
+		       0x1FFFF000 0x00001000>; /* configuration space */
 		reg-names = "pads", "afi", "cs";
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH   /* controller interrupt */
 			      GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-- 
2.7.4
