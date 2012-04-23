From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm/dts: Tegra30: Add device tree support for SMMU
Date: Mon, 23 Apr 2012 14:58:55 +0300
Message-ID: <1335182340-17237-3-git-send-email-hdoyu@nvidia.com>
References: <1335182340-17237-1-git-send-email-hdoyu@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335182340-17237-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add device tree support for Tegra30 IOMMU(SMMU).

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30.dtsi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 15200a9..f4929d5 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -224,4 +224,14 @@
 			nvidia,ahub-cif-ids = <8 8>;
 		};
 	};
+
+	smmu: smmu@7000f000 {
+		compatible = "nvidia,tegra30-smmu";
+		reg = <0x7000f010 0x2c		/* controller registers */
+		       0x7000f1f0 0x10		/* statics */
+		       0x7000f228 0x5c>;	/* module configuration */
+		interrupts = <0 13 0x40>;
+		asids = <4>;			/* # of ASIDs */
+		dma-window = <0 0x40000000>;	/* IOVA start & length */
+	};
 };
-- 
1.7.5.4
