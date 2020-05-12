From: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 3/4] arm64: tegra186: add reserved-only flag in sysram node
Date: Tue, 12 May 2020 16:48:02 +0200
Message-ID: <20200512144803.24344-3-ykaukab@suse.de>
References: <20200512144803.24344-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200512144803.24344-1-ykaukab-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, afaerber-l3A5Bk7waGM@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

bpmp driver has reserved regions in sysram. Since sysram is only used
by the bpmp driver, add ‘reserved-only’ flag to the sysram node so
that only regions used by the bpmp driver are remapped. Other regions
of the sysram may not be accessible to the kernel and a speculative
access to them can cause SError.

Signed-off-by: Mian Yousaf Kaukab <ykaukab-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58100fb9cd8b..07ce7e7b270c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1219,6 +1219,7 @@ sysram@30000000 {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges = <0 0x0 0x0 0x30000000 0x0 0x50000>;
+		reserved-only;
 
 		cpu_bpmp_tx: shmem@4e000 {
 			compatible = "nvidia,tegra186-bpmp-shmem";
-- 
2.25.0
