From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 5/6] ARM: tegra: harmony: fix pinmux for MMC slot
Date: Mon, 21 Feb 2011 23:55:16 -0600
Message-ID: <1298354117-19097-6-git-send-email-olof@lixom.net>
References: <1298354117-19097-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298354117-19097-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Turns out MMC2 (the bayonet 4-lane port) wasn't enabled in the
original pinmux. Fix that.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pinmux.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/mach-tegra/board-harmony-pinmux.c
index 98b9ab2..8c101ba 100644
--- a/arch/arm/mach-tegra/board-harmony-pinmux.c
+++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
@@ -36,10 +36,10 @@ static struct tegra_pingroup_config harmony_pinmux[] = {
 	{TEGRA_PINGROUP_DAP3,  TEGRA_MUX_DAP3,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DAP4,  TEGRA_MUX_DAP4,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DDC,   TEGRA_MUX_I2C2,          TEGRA_PUPD_PULL_UP,   TEGRA_TRI_NORMAL},
-	{TEGRA_PINGROUP_DTA,   TEGRA_MUX_SDIO2,         TEGRA_PUPD_PULL_UP,   TEGRA_TRI_TRISTATE},
-	{TEGRA_PINGROUP_DTB,   TEGRA_MUX_RSVD1,         TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
+	{TEGRA_PINGROUP_DTA,   TEGRA_MUX_SDIO2,         TEGRA_PUPD_PULL_UP,   TEGRA_TRI_NORMAL},
+	{TEGRA_PINGROUP_DTB,   TEGRA_MUX_RSVD1,         TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_DTC,   TEGRA_MUX_RSVD1,         TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
-	{TEGRA_PINGROUP_DTD,   TEGRA_MUX_SDIO2,         TEGRA_PUPD_PULL_UP,   TEGRA_TRI_TRISTATE},
+	{TEGRA_PINGROUP_DTD,   TEGRA_MUX_SDIO2,         TEGRA_PUPD_PULL_UP,   TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_DTE,   TEGRA_MUX_RSVD1,         TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_DTF,   TEGRA_MUX_I2C3,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_GMA,   TEGRA_MUX_SDIO4,         TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
