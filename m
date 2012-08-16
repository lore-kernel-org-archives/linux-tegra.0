From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: defconfig updates
Date: Thu, 16 Aug 2012 10:06:43 +0200
Message-ID: <11057342.IZzS6D55yK@fb07-iapwap2>
References: <1345052375-13374-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1345052375-13374-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

Am Mittwoch, 15. August 2012, 11:39:35 schrieb Stephen Warren:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Removed:
> 
> * MACH_HARMONY
> * MACH_PAZ00
> * MACH_TRIMSLICE
> 
>   These used to enable board support for individual boards. Now that we
>   only support device tree, these options have been removed.
> 
> Added:
> 
> * TEGRA_PCI
> 
>   This used to be selected by the board options above. Select this
>   explicitly now that the board options have been removed.
> 
> * TEGRA_DEBUG_UART_AUTO_ODMDATA
> 
>   This makes the kernel automatically pick a UART for earlyprintk. It's
>   likely to be a useful option for everyone.
> 
> * PWM
> * PWM_TEGRA
> 
>   Enable the new PWM subsystem, and the Tegra driver within it.
> 
> * GPIO_PCA953X
> * GPIO_PCA953X_IRQ
> * MFD_MAX8907
> * REGULATOR_MAX8907
> * RTC_DRV_MAX8907
> 
>   Various drivers required for the Whistler board.

any reason why Wifi is not enabled yet?

Something like (pseudo patch):

-# CONFIG_WIRELESS is not set
+CONFIG_CFG80211=m
+CONFIG_CFG80211_WEXT=y
+CONFIG_MAC80211=m
+CONFIG_MAC80211_LEDS=y
+CONFIG_RFKILL=y
+CONFIG_RFKILL_INPUT=y
+CONFIG_RFKILL_GPIO=y
+CONFIG_RT2X00=m
+CONFIG_RT2800USB=m

would be nice (rt2x00 is the wifi chip on paz00).

The Wifi LED needs something like this:

+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGER_GPIO=y

Marc



> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig |   15 ++++++++++-----
>  1 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/configs/tegra_defconfig
> b/arch/arm/configs/tegra_defconfig index db22453..4f078e0 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -24,11 +24,11 @@ CONFIG_EFI_PARTITION=y
>  # CONFIG_IOSCHED_DEADLINE is not set
>  # CONFIG_IOSCHED_CFQ is not set
>  CONFIG_ARCH_TEGRA=y
> +CONFIG_GPIO_PCA953X=y
>  CONFIG_ARCH_TEGRA_2x_SOC=y
>  CONFIG_ARCH_TEGRA_3x_SOC=y
> -CONFIG_MACH_HARMONY=y
> -CONFIG_MACH_PAZ00=y
> -CONFIG_MACH_TRIMSLICE=y
> +CONFIG_TEGRA_PCI=y
> +CONFIG_TEGRA_DEBUG_UART_AUTO_ODMDATA=y
>  CONFIG_TEGRA_EMC_SCALING_ENABLE=y
>  CONFIG_SMP=y
>  CONFIG_PREEMPT=y
> @@ -105,17 +105,20 @@ CONFIG_I2C_MUX_PINCTRL=y
>  CONFIG_I2C_TEGRA=y
>  CONFIG_SPI=y
>  CONFIG_SPI_TEGRA=y
> -CONFIG_GPIO_TPS65910=y
> +CONFIG_GPIO_PCA953X_IRQ=y
>  CONFIG_GPIO_TPS6586X=y
> +CONFIG_GPIO_TPS65910=y
>  CONFIG_POWER_SUPPLY=y
>  CONFIG_BATTERY_SBS=y
>  CONFIG_SENSORS_LM90=y
>  CONFIG_MFD_TPS6586X=y
>  CONFIG_MFD_TPS65910=y
> +CONFIG_MFD_MAX8907=y
>  CONFIG_REGULATOR=y
>  CONFIG_REGULATOR_FIXED_VOLTAGE=y
>  CONFIG_REGULATOR_VIRTUAL_CONSUMER=y
>  CONFIG_REGULATOR_GPIO=y
> +CONFIG_REGULATOR_MAX8907=y
>  CONFIG_REGULATOR_TPS62360=y
>  CONFIG_REGULATOR_TPS6586X=y
>  CONFIG_REGULATOR_TPS65910=y
> @@ -123,7 +126,6 @@ CONFIG_SOUND=y
>  CONFIG_SND=y
>  # CONFIG_SND_SUPPORT_OLD_API is not set
>  # CONFIG_SND_DRIVERS is not set
> -# CONFIG_SND_PCI is not set
>  # CONFIG_SND_ARM is not set
>  # CONFIG_SND_SPI is not set
>  # CONFIG_SND_USB is not set
> @@ -143,6 +145,7 @@ CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_TEGRA=y
>  CONFIG_RTC_CLASS=y
> +CONFIG_RTC_DRV_MAX8907=y
>  CONFIG_RTC_DRV_EM3027=y
>  CONFIG_RTC_DRV_TEGRA=y
>  CONFIG_STAGING=y
> @@ -156,6 +159,8 @@ CONFIG_TEGRA_IOMMU_GART=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_MEMORY=y
>  CONFIG_IIO=y
> +CONFIG_PWM=y
> +CONFIG_PWM_TEGRA=y
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT2_FS_XATTR=y
>  CONFIG_EXT2_FS_POSIX_ACL=y
