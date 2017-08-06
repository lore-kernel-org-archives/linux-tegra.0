From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/8] ARM: defconfig: tegra: Enable ChipIdea UDC driver
Date: Sun,  6 Aug 2017 18:10:31 +0300
Message-ID: <d56d881e1a26c287c31562680a3b8bf4cd09eeb0.1502031673.git.digetx@gmail.com>
References: <cover.1502031673.git.digetx@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1502031673.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1502031673.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1502031673.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since NVIDIA Tegra is supported now by the ChipIdea USB driver, let's
enable this driver in tegra_defconfig.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index fe1275aa067e..9c9c644ed9d7 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -121,7 +121,6 @@ CONFIG_TOUCHSCREEN_WM97XX=y
 CONFIG_TOUCHSCREEN_STMPE=y
 CONFIG_INPUT_MISC=y
 # CONFIG_LEGACY_PTYS is not set
-# CONFIG_DEVKMEM is not set
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
@@ -220,6 +219,9 @@ CONFIG_USB_EHCI_TEGRA=y
 CONFIG_USB_ACM=y
 CONFIG_USB_WDM=y
 CONFIG_USB_STORAGE=y
+CONFIG_USB_CHIPIDEA=m
+CONFIG_USB_CHIPIDEA_UDC=y
+CONFIG_USB_GADGET=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_SDHCI=y
@@ -249,8 +251,6 @@ CONFIG_RTC_DRV_TEGRA=y
 CONFIG_DMADEVICES=y
 CONFIG_TEGRA20_APB_DMA=y
 CONFIG_STAGING=y
-CONFIG_SENSORS_ISL29018=y
-CONFIG_SENSORS_ISL29028=y
 CONFIG_MFD_NVEC=y
 CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
@@ -265,6 +265,8 @@ CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y
 CONFIG_MPU3050_I2C=y
+CONFIG_SENSORS_ISL29018=y
+CONFIG_SENSORS_ISL29028=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
 CONFIG_PWM_TEGRA=y
@@ -290,13 +292,11 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_SLAB=y
 CONFIG_DEBUG_VM=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_SCHEDSTATS=y
-CONFIG_TIMER_STATS=y
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_DEBUG_MUTEXES=y
 CONFIG_DEBUG_SG=y
-- 
2.13.3

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
