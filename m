From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [RESEND PATCH 5/6] ARM: multi_v7_defconfig: enable tegra raw nand driver
Date: Tue, 14 Aug 2018 16:06:11 +0200
Message-ID: <20180814140612.12554-5-marcel@ziswiler.com>
References: <20180814140612.12554-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814140612.12554-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, Tony Lindgren <tony@atomide.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Now with everything being merged actually enable it.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65646b39430b..5420b48ded2a 100644
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
