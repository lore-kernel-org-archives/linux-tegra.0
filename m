From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 1/5] ARM: Tegra: Add devices.c entries for audio
Date: Wed, 23 Feb 2011 13:04:16 -0800
Message-ID: <AANLkTi=awEAk3MA5LjrnxBE8epqv7c4xLXN8RnErkLSS@mail.gmail.com>
References: <1298487532-5000-1-git-send-email-swarren@nvidia.com>
	<1298487532-5000-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298487532-5000-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 10:58 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> For I2S, DAS, PCM devices
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> NOTE: This patch will not apply until Olof's recently posted
> boards-for-next branch is merged.
>
> =A0arch/arm/mach-tegra/devices.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 70 ++++=
++++++++++++++++++++++++++
> =A0arch/arm/mach-tegra/devices.h =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A04 ++
> =A0arch/arm/mach-tegra/include/mach/iomap.h | =A0 =A03 +
> =A03 files changed, 77 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devi=
ces.c
> index 682e6d3..1528f9d 100644
> --- a/arch/arm/mach-tegra/devices.c
> +++ b/arch/arm/mach-tegra/devices.c
> @@ -503,3 +503,73 @@ struct platform_device tegra_uarte_device =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.coherent_dma_mask =A0 =A0 =A0=3D DMA_=
BIT_MASK(32),
> =A0 =A0 =A0 =A0},
> =A0};
> +
> +static struct resource i2s_resource1[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D INT_I2S1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D INT_I2S1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D TEGRA_DMA_REQ_SEL_I2S_1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D TEGRA_DMA_REQ_SEL_I2S_1=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_DMA
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D TEGRA_I2S1_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D TEGRA_I2S1_BASE + TEGRA=
_I2S1_SIZE - 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM
> + =A0 =A0 =A0 }
> +};
> +
> +static struct resource i2s_resource2[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D INT_I2S2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D INT_I2S2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_IRQ
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [1] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D TEGRA_DMA_REQ_SEL_I2S2_1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D TEGRA_DMA_REQ_SEL_I2S2_=
1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_DMA
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 [2] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =A0=3D TEGRA_I2S2_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =A0 =A0=3D TEGRA_I2S2_BASE + TEGRA=
_I2S2_SIZE - 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0=3D IORESOURCE_MEM
> + =A0 =A0 =A0 }
> +};
> +
> +struct platform_device tegra_i2s_device1 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "tegra-i2s",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 0,
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D i2s_resource1,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(i2s_resource1),
> +};
> +
> +struct platform_device tegra_i2s_device2 =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "tegra-i2s",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D 1,
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D i2s_resource2,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(i2s_resource2),
> +};
> +
> +static struct resource tegra_das_resources[] =3D {
> + =A0 =A0 =A0 [0] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .start =3D TEGRA_APB_MISC_DAS_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .end =3D TEGRA_APB_MISC_DAS_BASE + TEGR=
A_APB_MISC_DAS_SIZE - 1,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =3D IORESOURCE_MEM,
> + =A0 =A0 =A0 },
> +};
> +
> +struct platform_device tegra_das_device =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "tegra-das",
> + =A0 =A0 =A0 .id =A0 =A0 =A0 =A0 =A0 =A0 =3D -1,
> + =A0 =A0 =A0 .num_resources =A0=3D ARRAY_SIZE(tegra_das_resources),
> + =A0 =A0 =A0 .resource =A0 =A0 =A0 =3D tegra_das_resources,
> +};
> +
> +struct platform_device tegra_pcm_device =3D {
> + =A0 =A0 =A0 .name =3D "tegra-pcm-audio",
> + =A0 =A0 =A0 .id =3D -1,
> +};
> diff --git a/arch/arm/mach-tegra/devices.h b/arch/arm/mach-tegra/devi=
ces.h
> index 888810c..4a7dc0a 100644
> --- a/arch/arm/mach-tegra/devices.h
> +++ b/arch/arm/mach-tegra/devices.h
> @@ -42,5 +42,9 @@ extern struct platform_device tegra_uartc_device;
> =A0extern struct platform_device tegra_uartd_device;
> =A0extern struct platform_device tegra_uarte_device;
> =A0extern struct platform_device tegra_pmu_device;
> +extern struct platform_device tegra_i2s_device1;
> +extern struct platform_device tegra_i2s_device2;
> +extern struct platform_device tegra_das_device;
> +extern struct platform_device tegra_pcm_device;
>
> =A0#endif
> diff --git a/arch/arm/mach-tegra/include/mach/iomap.h b/arch/arm/mach=
-tegra/include/mach/iomap.h
> index 691cdab..19dec3a 100644
> --- a/arch/arm/mach-tegra/include/mach/iomap.h
> +++ b/arch/arm/mach-tegra/include/mach/iomap.h
> @@ -122,6 +122,9 @@
> =A0#define TEGRA_APB_MISC_BASE =A0 =A0 =A0 =A0 =A0 =A00x70000000
> =A0#define TEGRA_APB_MISC_SIZE =A0 =A0 =A0 =A0 =A0 =A0SZ_4K
>
> +#define TEGRA_APB_MISC_DAS_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x700=
00c00
> +#define TEGRA_APB_MISC_DAS_SIZE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0SZ_12=
8
> +
> =A0#define TEGRA_AC97_BASE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00x70002000
> =A0#define TEGRA_AC97_SIZE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0SZ_512

Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
