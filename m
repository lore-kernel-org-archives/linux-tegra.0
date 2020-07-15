From: Enric Balletbo Serra <eballetbo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND RESEND PATCH] arm/arm64: defconfig: Update configs to use
 the new CROS_EC options
Date: Wed, 15 Jul 2020 23:30:04 +0200
Message-ID: <CAFqH_52LhfV9AsnPRZi_ZPsgYX8WrUrKEsV-E7VHOw3ZZtHd-w@mail.gmail.com>
References: <20200305111047.147355-1-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200305111047.147355-1-enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Collabora Kernel ML <kernel-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Guenter Roeck <groeck-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marcin Juszkiewicz <marcin.juszkiewicz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Leonard Crestez <leonard.crestez-3arQi8VN3Tc@public.gmane.org>, linux-samsung-soc <linux-s>
List-Id: linux-tegra@vger.kernel.org

Hi arm/arm64 maintainers,

Missatge de Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org> del
dia dj., 5 de mar=C3=A7 2020 a les 12:11:
>
> We refactored the CrOS EC drivers moving part of the code from the MFD
> subsystem to the platform chrome subsystem. During this change we needed
> to rename some config options, so, update the defconfigs accordingly.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Acked-by: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Tested-by: Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---

A gentle ping. I'd like to land this if is possible because that way I
can remove some legacy code in platform/chrome subsystem.

Thanks,
  Enric

> Dear all,
>
> This is a resend of a resend patch [3]. In some previous discussions
> maintainers would prefer to have this merged through the arm-soc tree
> but wasn't merged yet and I forget to ping again, hence, sending a new
> resend.
>
> To give some context to some discussions that can arise again (i.e
> whether some symbols should be built-in or not) please look at the
> previous resends [1] and [2].
>
> Thanks,
>  Enric
>
> [1] https://lkml.org/lkml/2019/8/23/518
> [2] https://lkml.org/lkml/2019/8/23/475
> [3] https://patchwork.kernel.org/patch/11267741/
>
>  arch/arm/configs/exynos_defconfig   | 4 +++-
>  arch/arm/configs/multi_v7_defconfig | 5 ++++-
>  arch/arm/configs/pxa_defconfig      | 4 +++-
>  arch/arm/configs/tegra_defconfig    | 2 +-
>  arch/arm64/configs/defconfig        | 5 ++++-
>  5 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_=
defconfig
> index c8e0c14092e8..cb030549dd69 100644
> --- a/arch/arm/configs/exynos_defconfig
> +++ b/arch/arm/configs/exynos_defconfig
> @@ -160,7 +160,9 @@ CONFIG_DEVFREQ_THERMAL=3Dy
>  CONFIG_THERMAL_EMULATION=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_S3C2410_WATCHDOG=3Dy
> -CONFIG_MFD_CROS_EC=3Dy
> +CONFIG_MFD_CROS_EC_DEV=3Dy
> +CONFIG_CHROME_PLATFORMS=3Dy
> +CONFIG_CROS_EC=3Dy
>  CONFIG_MFD_MAX14577=3Dy
>  CONFIG_MFD_MAX77686=3Dy
>  CONFIG_MFD_MAX77693=3Dy
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi=
_v7_defconfig
> index 017d65f86eba..9099787ccf70 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -938,7 +938,7 @@ CONFIG_SERIO_NVEC_PS2=3Dy
>  CONFIG_NVEC_POWER=3Dy
>  CONFIG_NVEC_PAZ00=3Dy
>  CONFIG_STAGING_BOARD=3Dy
> -CONFIG_MFD_CROS_EC=3Dm
> +CONFIG_MFD_CROS_EC_DEV=3Dm
>  CONFIG_CROS_EC_I2C=3Dm
>  CONFIG_CROS_EC_SPI=3Dm
>  CONFIG_COMMON_CLK_MAX77686=3Dy
> @@ -1118,3 +1118,6 @@ CONFIG_CMA_SIZE_MBYTES=3D64
>  CONFIG_PRINTK_TIME=3Dy
>  CONFIG_MAGIC_SYSRQ=3Dy
>  CONFIG_DEBUG_FS=3Dy
> +CONFIG_CHROME_PLATFORMS=3Dy
> +CONFIG_CROS_EC=3Dm
> +CONFIG_CROS_EC_CHARDEV=3Dm
> diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defcon=
fig
> index b817c57f05f1..f1b084ace88d 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -393,7 +393,9 @@ CONFIG_SA1100_WATCHDOG=3Dm
>  CONFIG_MFD_AS3711=3Dy
>  CONFIG_MFD_BCM590XX=3Dm
>  CONFIG_MFD_AXP20X=3Dy
> -CONFIG_MFD_CROS_EC=3Dm
> +CONFIG_MFD_CROS_EC_DEV=3Dm
> +CONFIG_CHROME_PLATFORMS=3Dy
> +CONFIG_CROS_EC=3Dm
>  CONFIG_CROS_EC_I2C=3Dm
>  CONFIG_CROS_EC_SPI=3Dm
>  CONFIG_MFD_ASIC3=3Dy
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_de=
fconfig
> index a27592d3b1fa..7bfae67d2016 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -147,7 +147,7 @@ CONFIG_SENSORS_LM95245=3Dy
>  CONFIG_WATCHDOG=3Dy
>  CONFIG_TEGRA_WATCHDOG=3Dy
>  CONFIG_MFD_AS3722=3Dy
> -CONFIG_MFD_CROS_EC=3Dy
> +CONFIG_MFD_CROS_EC_DEV=3Dy
>  CONFIG_MFD_MAX8907=3Dy
>  CONFIG_MFD_STMPE=3Dy
>  CONFIG_MFD_PALMAS=3Dy
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 905109f6814f..2095e61c8665 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -705,9 +705,12 @@ CONFIG_VIRTIO_BALLOON=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
>  CONFIG_XEN_GNTDEV=3Dy
>  CONFIG_XEN_GRANT_DEV_ALLOC=3Dy
> -CONFIG_MFD_CROS_EC=3Dy
> +CONFIG_MFD_CROS_EC_DEV=3Dy
> +CONFIG_CHROME_PLATFORMS=3Dy
> +CONFIG_CROS_EC=3Dy
>  CONFIG_CROS_EC_I2C=3Dy
>  CONFIG_CROS_EC_SPI=3Dy
> +CONFIG_CROS_EC_CHARDEV=3Dm
>  CONFIG_COMMON_CLK_RK808=3Dy
>  CONFIG_COMMON_CLK_SCPI=3Dy
>  CONFIG_COMMON_CLK_CS2000_CP=3Dy
> --
> 2.25.1
>
