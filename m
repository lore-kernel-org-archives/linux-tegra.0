From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 5/6] ARM: multi_v7_defconfig: enable tegra raw nand driver
Date: Fri, 20 Jul 2018 16:30:11 +0200
Message-ID: <20180720143012.7740-5-marcel@ziswiler.com>
References: <20180720143012.7740-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720143012.7740-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Stefan Agner <stefan@agner.ch>, Tony Lindgren <tony@atomide.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Now with everything being merged actually enable it.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index beacb02c734b..27a621eaa8dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -190,6 +190,7 @@ CONFIG_MTD_NAND_GPMI_NAND=y
 CONFIG_MTD_NAND_BRCMNAND=y
 CONFIG_MTD_NAND_VF610_NFC=y
 CONFIG_MTD_NAND_DAVINCI=y
+CONFIG_MTD_NAND_TEGRA=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_MTD_UBI=y
-- 
2.14.4
