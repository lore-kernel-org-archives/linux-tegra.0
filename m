From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/3] ARM: dts: tegra20: Add DMA phandle to 'fuse' node
Date: Tue, 26 Sep 2017 01:35:38 +0300
Message-ID: <8268404736bd3c254f8516109465bb8db4739c33.1506378772.git.digetx@gmail.com>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <27dadd0335aac71c9d4d613c33a6a1d0a285afa4.1506378772.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Currently efuse driver requests DMA channel from an arbitrary DMA device,
it is not a problem since there is only one DMA provider for Tegra20 yet,
but it will become troublesome once another provider would be added.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/tegra20.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index fb485a5e63d7..f1579c9a7ef4 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -600,6 +600,8 @@
 		clock-names = "fuse";
 		resets = <&tegra_car 39>;
 		reset-names = "fuse";
+		dmas = <&apbdma 0>;
+		dma-names = "fuse";
 	};
 
 	pcie@80003000 {
-- 
2.14.1
