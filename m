From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Subject: [PATCH 3/4] arm64: tegra: Configure SDIO cards on Jetson Xavier SDMMC1
Date: Sat, 13 Jun 2020 15:22:11 +0200
Message-ID: <20200613132212.8538-4-tszucs@protonmail.ch>
References: <20200613132212.8538-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200613132212.8538-1-tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Preserve SDIO card power during a suspend/resume cycle and enable wake up of
host system on SDIO IRQ assertion.

Signed-off-by: Tamás Szűcs <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 5c40e5c7ee9c..4cf3830e37c3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -59,6 +59,8 @@
 		/* SDMMC1 (SD/MMC) */
 		sdhci@3400000 {
 			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			keep-power-in-suspend;
+			wakeup-source;
 		};
 
 		/* SDMMC4 (eMMC) */
-- 
2.20.1
