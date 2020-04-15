From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v7 1/9] arm64: tegra: Fix sor powergate clocks and reset
Date: Tue, 14 Apr 2020 19:57:35 -0700
Message-ID: <1586919463-30542-2-git-send-email-skomatineni@nvidia.com>
References: <1586919463-30542-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1586919463-30542-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 device tree lists csi clock and reset under SOR powergate
node.

But Tegra210 has csicil in SOR partition and csi in VENC partition.

So, this patch includes fix for sor powergate node.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 64c46ce..d0eff92 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -796,7 +796,9 @@
 			pd_sor: sor {
 				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
 					 <&tegra_car TEGRA210_CLK_SOR1>,
-					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
 					 <&tegra_car TEGRA210_CLK_DSIA>,
 					 <&tegra_car TEGRA210_CLK_DSIB>,
 					 <&tegra_car TEGRA210_CLK_DPAUX>,
@@ -804,7 +806,6 @@
 					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
 				resets = <&tegra_car TEGRA210_CLK_SOR0>,
 					 <&tegra_car TEGRA210_CLK_SOR1>,
-					 <&tegra_car TEGRA210_CLK_CSI>,
 					 <&tegra_car TEGRA210_CLK_DSIA>,
 					 <&tegra_car TEGRA210_CLK_DSIB>,
 					 <&tegra_car TEGRA210_CLK_DPAUX>,
-- 
2.7.4
