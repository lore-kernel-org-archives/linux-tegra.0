From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/6] ARM64: tegra: limit PCIe config space mapping to 4K for T210
Date: Fri, 13 Oct 2017 00:20:11 +0530
Message-ID: <1507834211-24922-7-git-send-email-vidyas@nvidia.com>
References: <1507834211-24922-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507834211-24922-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

reduces PCIe config space mapping size from its current 256MB
to 4K to have only 4K of virtual memory mapping and to be
in line with driver implementation

Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 29f471e0f22a..8cad2516597b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -16,7 +16,7 @@
 		device_type = "pci";
 		reg = <0x0 0x01003000 0x0 0x00000800   /* PADS registers */
 		       0x0 0x01003800 0x0 0x00000800   /* AFI registers */
-		       0x0 0x02000000 0x0 0x10000000>; /* configuration space */
+		       0x0 0x11FFF000 0x0 0x00001000>; /* configuration space */
 		reg-names = "pads", "afi", "cs";
 		interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>, /* controller interrupt */
 			     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>; /* MSI interrupt */
-- 
2.7.4
