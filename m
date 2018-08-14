From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [RESEND PATCH 4/6] ARM: defconfig: tegra: enable dynamic debug
Date: Tue, 14 Aug 2018 16:06:10 +0200
Message-ID: <20180814140612.12554-4-marcel@ziswiler.com>
References: <20180814140612.12554-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814140612.12554-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Paul Kocialkowski <contact@paulk.fr>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Benjamin Gilbert <benjamin.gilbert@coreos.com>, Dmitry Osipenko <digetx@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@armlinux.org.uk>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Dynamic debug is really helpful.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index c7b99ebf5fcf..24e297659b55 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -289,6 +289,7 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
 CONFIG_DEBUG_INFO=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_SLAB=y
-- 
2.14.4
