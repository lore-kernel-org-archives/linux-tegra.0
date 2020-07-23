From: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Subject: [PATCH v2 4/4] arm64: tegra: Enable HS400 on Tegra194 SDMMC4
Date: Thu, 23 Jul 2020 23:09:32 +0200
Message-ID: <20200723210932.8076-5-tszucs@protonmail.ch>
References: <20200723210932.8076-1-tszucs@protonmail.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200723210932.8076-1-tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: =?UTF-8?q?Tam=C3=A1s=20Sz=C5=B1cs?= <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable HS400 signaling on Tegra194 SDMMC4 controller.

Signed-off-by: Tamás Szűcs <tszucs-g/b1ySJe57IkP3XJZ0H8fw@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 8351035bb6a7..e26f35b6279b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -558,6 +558,7 @@
 			nvidia,default-tap = <0x8>;
 			nvidia,default-trim = <0x14>;
 			nvidia,dqs-trim = <40>;
+			mmc-hs400-1_8v;
 			supports-cqe;
 			status = "disabled";
 		};
-- 
2.20.1
