From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: Tegra: DMA: Fail safe if initialization fails
Date: Wed, 23 Feb 2011 09:38:12 -0800
Message-ID: <AANLkTi=iWsX_UN6pE7nE=7NBXRPv7=6Ja68B=u8U4Ww=@mail.gmail.com>
References: <1298482170-3678-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298482170-3678-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 9:29 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> tegra_dma_init currently simply bails out early if any initialization=
 fails.
> This skips various data-structure initialization. In turn, this means=
 that
> tegra_dma_allocate_channel can still hand out channels. In this case,=
 when
> tegra_dma_free_channel is called, which calls tegra_dma_cancel, the w=
alking
> on ch->list will OOPS since the list's next/prev pointers may still b=
e
> NULL.
>
> To solve this:
> * Mark all possible channels as in-use before doing anything else in =
init.
> * Only mark a channel as free once all channel-related initialization=
 has
> =A0completed.
>
> This prevents allocate_channel from handing out uninitialized channel=
s.
>
> There is still one small hole; allocate_channel can't check the usage=
 array
> for the shared channel, since this channel is permanently marked in-u=
se.
> This could be solved using an explicit "init OK" flag that allocate_c=
hannel
> could check.
If we still need an init complete flag, why not skip this patch and
just add that?

>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/dma.c | =A0 20 ++++++++------------
> =A01 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
> index 2d720f2..79765ca 100644
> --- a/arch/arm/mach-tegra/dma.c
> +++ b/arch/arm/mach-tegra/dma.c
> @@ -678,6 +678,12 @@ int __init tegra_dma_init(void)
> =A0 =A0 =A0 =A0void __iomem *addr;
> =A0 =A0 =A0 =A0struct clk *c;
>
> + =A0 =A0 =A0 memset(channel_usage, 0, sizeof(channel_usage));
> + =A0 =A0 =A0 memset(dma_channels, 0, sizeof(dma_channels));
I noticed yesterday these memsets were unnecessary, channel_usage and
dma_channels will be allocated as 0.

> +
> + =A0 =A0 =A0 for (i =3D 0; i < NV_DMA_MAX_CHANNELS; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __set_bit(i, channel_usage);
> +
> =A0 =A0 =A0 =A0c =3D clk_get_sys("tegra-dma", NULL);
> =A0 =A0 =A0 =A0if (IS_ERR(c)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("Unable to get clock for APB DM=
A\n");
> @@ -696,18 +702,9 @@ int __init tegra_dma_init(void)
> =A0 =A0 =A0 =A0writel(0xFFFFFFFFul >> (31 - TEGRA_SYSTEM_DMA_CH_MAX),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr + APB_DMA_IRQ_MASK_SET);
>
> - =A0 =A0 =A0 memset(channel_usage, 0, sizeof(channel_usage));
> - =A0 =A0 =A0 memset(dma_channels, 0, sizeof(dma_channels));
> -
> - =A0 =A0 =A0 /* Reserve all the channels we are not supposed to touc=
h */
> - =A0 =A0 =A0 for (i =3D 0; i < TEGRA_SYSTEM_DMA_CH_MIN; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 __set_bit(i, channel_usage);
> -
> =A0 =A0 =A0 =A0for (i =3D TEGRA_SYSTEM_DMA_CH_MIN; i <=3D TEGRA_SYSTE=
M_DMA_CH_MAX; i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct tegra_dma_channel *ch =3D &dma_=
channels[i];
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 __clear_bit(i, channel_usage);
> -
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ch->id =3D i;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0snprintf(ch->name, TEGRA_DMA_NAME_SIZE=
, "dma_channel_%d", i);
>
> @@ -726,13 +723,12 @@ int __init tegra_dma_init(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto fail;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ch->irq =3D irq;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 __clear_bit(i, channel_usage);
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0/* mark the shared channel allocated */
> =A0 =A0 =A0 =A0__set_bit(TEGRA_SYSTEM_DMA_CH_MIN, channel_usage);
>
> - =A0 =A0 =A0 for (i =3D TEGRA_SYSTEM_DMA_CH_MAX+1; i < NV_DMA_MAX_CH=
ANNELS; i++)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 __set_bit(i, channel_usage);
> -
> =A0 =A0 =A0 =A0return ret;
> =A0fail:
> =A0 =A0 =A0 =A0writel(0, addr + APB_DMA_GEN);
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
