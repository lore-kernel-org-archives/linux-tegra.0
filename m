From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V4 8/9] ARM: tegra: config: defconfig update
Date: Mon, 18 Mar 2013 16:13:19 +0800
Message-ID: <1363594400-11663-9-git-send-email-josephl@nvidia.com>
References: <1363594400-11663-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363594400-11663-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

KEYBOARD_GPIO:
* Enable gpio-key driver

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V8:
* no change
V3:
* no change
V2:
* no change
---
 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index aba4881..6eee91d 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -108,6 +108,7 @@ CONFIG_RT2X00=y
 CONFIG_RT2800USB=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_TEGRA=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MPU3050=y
 # CONFIG_LEGACY_PTYS is not set
-- 
1.8.1.5
