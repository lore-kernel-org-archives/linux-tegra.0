From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: enable RT5640 sound driver in defconfig
Date: Wed, 12 Jun 2013 11:37:16 -0600
Message-ID: <1371058636-25244-3-git-send-email-swarren@wwwdotorg.org>
References: <1371058636-25244-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371058636-25244-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Enable the ASoC machine driver that is required for audio on Dalmore
and Beaver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 44e00ed..2d9a483 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -179,6 +179,7 @@ CONFIG_SND=y
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_TEGRA=y
+CONFIG_SND_SOC_TEGRA_RT5640=y
 CONFIG_SND_SOC_TEGRA_WM8753=y
 CONFIG_SND_SOC_TEGRA_WM8903=y
 CONFIG_SND_SOC_TEGRA_TRIMSLICE=y
-- 
1.8.1.5
