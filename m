From: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] arm64: defconfig: Enable Tegra PCI controller
Date: Wed, 18 Oct 2017 17:46:20 +0300
Message-ID: <20171018144620.4699-1-tuomas.tynkkynen@iki.fi>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The driver has supported the 64-bit Tegra210 for a while now, so enable
it in the defconfig.

Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
---
I didn't personally test this but got a report from our distro users
that it works.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 719602300d9b..21c173fcbc3c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -74,6 +74,7 @@ CONFIG_PCIE_QCOM=y
 CONFIG_PCIE_KIRIN=y
 CONFIG_PCIE_ARMADA_8K=y
 CONFIG_PCI_AARDVARK=y
+CONFIG_PCI_TEGRA=y
 CONFIG_PCIE_RCAR=y
 CONFIG_PCIE_ROCKCHIP=m
 CONFIG_PCI_HOST_GENERIC=y
-- 
2.14.2
