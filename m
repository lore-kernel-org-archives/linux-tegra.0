From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: remove tegra_pcm_device
Date: Tue, 20 Mar 2012 14:55:50 -0600
Message-ID: <1332276950-9398-3-git-send-email-swarren@wwwdotorg.org>
References: <1332276950-9398-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332276950-9398-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra_pcm_device is no longer needed now that the Tegra ASoC code has
cleaned up its 'platform' registration. Remove it.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c   |    1 -
 arch/arm/mach-tegra/board-seaboard.c  |    1 -
 arch/arm/mach-tegra/board-trimslice.c |    1 -
 arch/arm/mach-tegra/devices.c         |    5 -----
 arch/arm/mach-tegra/devices.h         |    1 -
 5 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index c00aadb..5eb74ea 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -122,7 +122,6 @@ static struct platform_device *harmony_devices[] __initdata = {
 	&tegra_ehci3_device,
 	&tegra_i2s_device1,
 	&tegra_das_device,
-	&tegra_pcm_device,
 	&harmony_audio_device,
 };
 
diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
index d669847..0e2957f 100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -153,7 +153,6 @@ static struct platform_device *seaboard_devices[] __initdata = {
 	&seaboard_gpio_keys_device,
 	&tegra_i2s_device1,
 	&tegra_das_device,
-	&tegra_pcm_device,
 	&seaboard_audio_device,
 };
 
diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index cd52820..ba2e047 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -86,7 +86,6 @@ static struct platform_device *trimslice_devices[] __initdata = {
 	&tegra_sdhci_device4,
 	&tegra_i2s_device1,
 	&tegra_das_device,
-	&tegra_pcm_device,
 	&trimslice_audio_device,
 };
 
diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index 7a2a02d..0ed076a 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -699,8 +699,3 @@ struct platform_device tegra_das_device = {
 	.num_resources	= ARRAY_SIZE(tegra_das_resources),
 	.resource	= tegra_das_resources,
 };
-
-struct platform_device tegra_pcm_device = {
-	.name = "tegra-pcm-audio",
-	.id = -1,
-};
diff --git a/arch/arm/mach-tegra/devices.h b/arch/arm/mach-tegra/devices.h
index 873ecb2..f547094 100644
--- a/arch/arm/mach-tegra/devices.h
+++ b/arch/arm/mach-tegra/devices.h
@@ -47,6 +47,5 @@ extern struct platform_device tegra_pmu_device;
 extern struct platform_device tegra_i2s_device1;
 extern struct platform_device tegra_i2s_device2;
 extern struct platform_device tegra_das_device;
-extern struct platform_device tegra_pcm_device;
 
 #endif
-- 
1.7.0.4
