From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/9] arm/tegra: Don't WARN_ON() for too early dma channel allocations
Date: Thu, 22 Dec 2011 16:17:40 -0800
Message-ID: <1324599468-12845-2-git-send-email-olof@lixom.net>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324599468-12845-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Since we'll do opportunistic allocations before the dma subsystem is
enabled we want just silent failures and retries instead.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/dma.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
index c0cf967..98b33c8 100644
--- a/arch/arm/mach-tegra/dma.c
+++ b/arch/arm/mach-tegra/dma.c
@@ -357,7 +357,7 @@ struct tegra_dma_channel *tegra_dma_allocate_channel(int mode)
 	int channel;
 	struct tegra_dma_channel *ch = NULL;
 
-	if (WARN_ON(!tegra_dma_initialized))
+	if (!tegra_dma_initialized)
 		return NULL;
 
 	mutex_lock(&tegra_dma_lock);
-- 
1.7.8.GIT
