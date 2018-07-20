From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 6/6] ARM: defconfig: tegra: enable tegra raw nand driver
Date: Fri, 20 Jul 2018 16:30:12 +0200
Message-ID: <20180720143012.7740-6-marcel@ziswiler.com>
References: <20180720143012.7740-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720143012.7740-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Paul Kocialkowski <contact@paulk.fr>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Benjamin Gilbert <benjamin.gilbert@coreos.com>, Dmitry Osipenko <digetx@gmail.com>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <linux@armlinux.org.uk>, "Robin H. Johnson" <robbat2@gentoo.org>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Now with everything being merged actually enable it. Also enable
MTD_OF_PARTS, MTD_BLOCK, MTD_NAND, MTD_UBI and UBIFS without which
the former would not make much sense and is also in-line with
multi_v7_defconfig.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/configs/tegra_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 24e297659b55..b248e231900f 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -79,8 +79,13 @@ CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_TEGRA_GMI=y
 CONFIG_MTD=y
+CONFIG_MTD_OF_PARTS=y
+CONFIG_MTD_BLOCK=y
 CONFIG_MTD_M25P80=y
+CONFIG_MTD_NAND=y
+CONFIG_MTD_NAND_TEGRA=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_AD525X_DPOT=y
 CONFIG_AD525X_DPOT_I2C=y
@@ -280,6 +285,7 @@ CONFIG_EXT3_FS_SECURITY=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UBIFS_FS=y
 CONFIG_SQUASHFS=y
 CONFIG_SQUASHFS_LZO=y
 CONFIG_SQUASHFS_XZ=y
-- 
2.14.4
