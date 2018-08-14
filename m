From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [RESEND PATCH 3/6] ARM: multi_v7_defconfig: enable dynamic debug
Date: Tue, 14 Aug 2018 16:06:09 +0200
Message-ID: <20180814140612.12554-3-marcel@ziswiler.com>
References: <20180814140612.12554-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180814140612.12554-1-marcel@ziswiler.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>, Stefan Agner <stefan@agner.ch>, Tony Lindgren <tony@atomide.com>, Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>, Simon Horman <horms+renesas@verge.net.au>
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Dynamic debug is really helpful.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 1299c0cf2f3a..65646b39430b 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -976,6 +976,7 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_PRINTK_TIME=y
+CONFIG_DYNAMIC_DEBUG=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_USER_API_HASH=m
-- 
2.14.4
