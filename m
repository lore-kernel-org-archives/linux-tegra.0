From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: Tegra: Add to tegra_wm8903_platform_data
Date: Tue, 12 Apr 2011 11:29:01 -0600
Message-ID: <1302629341-2302-4-git-send-email-swarren@nvidia.com>
References: <1302629341-2302-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302629341-2302-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Seaboard derivate Kaen has a GPIO to mute the headphone output. Add a field
to tegra_wm8903_platform_data so the board files can pass the GPIO number
for that to the ASoC machine driver.

Also, initialize this new field to a "not present" value for Harmony.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch needs special merge handling; please see the cover letter.

 arch/arm/mach-tegra/board-harmony.c                |    1 +
 .../mach-tegra/include/mach/tegra_wm8903_pdata.h   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 987c5e4..30e18bc 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -70,6 +70,7 @@ static struct platform_device debug_uart = {
 static struct tegra_wm8903_platform_data harmony_audio_pdata = {
 	.gpio_spkr_en		= TEGRA_GPIO_SPKR_EN,
 	.gpio_hp_det		= TEGRA_GPIO_HP_DET,
+	.gpio_hp_mute		= -1,
 	.gpio_int_mic_en	= TEGRA_GPIO_INT_MIC_EN,
 	.gpio_ext_mic_en	= TEGRA_GPIO_EXT_MIC_EN,
 };
diff --git a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h b/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
index c34bd5e..9d29334 100644
--- a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
+++ b/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
@@ -17,6 +17,7 @@
 struct tegra_wm8903_platform_data {
 	int gpio_spkr_en;
 	int gpio_hp_det;
+	int gpio_hp_mute;
 	int gpio_int_mic_en;
 	int gpio_ext_mic_en;
 };
-- 
1.7.1
