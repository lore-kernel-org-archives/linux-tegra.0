From: Alan Ott <alan@signal11.us>
Subject: [PATCH 2/8] ARM: tegra: do not hide dma declarations
Date: Thu,  1 Mar 2012 14:26:44 -0500
Message-ID: <1330630010-11241-3-git-send-email-alan@signal11.us>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330630010-11241-1-git-send-email-alan@signal11.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The declarations are actually required for the device
definitions, and are still valid even if the dma controller
is disabled:

arch/arm/mach-tegra/devices.c:559:12: error: 'TEGRA_DMA_REQ_SEL_I2S_1' undeclared here (not in a function)
arch/arm/mach-tegra/devices.c:577:12: error: 'TEGRA_DMA_REQ_SEL_I2S2_1' undeclared here (not in a function)

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-tegra/include/mach/dma.h |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/dma.h b/arch/arm/mach-tegra/include/mach/dma.h
index 3c93390..9077092 100644
--- a/arch/arm/mach-tegra/include/mach/dma.h
+++ b/arch/arm/mach-tegra/include/mach/dma.h
@@ -51,8 +51,6 @@
 #define TEGRA_DMA_REQ_SEL_OWR			25
 #define TEGRA_DMA_REQ_SEL_INVALID		31
 
-#if defined(CONFIG_TEGRA_SYSTEM_DMA)
-
 struct tegra_dma_req;
 struct tegra_dma_channel;
 
@@ -151,5 +149,3 @@ void tegra_dma_free_channel(struct tegra_dma_channel *ch);
 int __init tegra_dma_init(void);
 
 #endif
-
-#endif
-- 
1.7.0.4
