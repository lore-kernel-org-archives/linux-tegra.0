From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2] ARM: Tegra: DMA: Fail safe if initialization fails
Date: Wed, 23 Feb 2011 13:03:07 -0800
Message-ID: <AANLkTimrhHO=kWp9c__qfub3jBYrpsjy5J2zKb+LCnsh@mail.gmail.com>
References: <1298491602-20072-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298491602-20072-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 23, 2011 at 12:06 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
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
> To solve this, add an explicit "initialized" flag, only set this once=
 _init
> has fully completed successfully, and have _allocate_channel refuse t=
o hand
> out channels if this is not set.
>
> While at it, simplify _init:
> * Remove redundant memsets
> * Use bitmap_fill to mark all channels as in-use up-front, and remove
> =A0some now-redundant bitmap initialization loops.
> * Only mark a channel as free once all channel-related initialization=
 has
> =A0completed.
>
> Finally, the successful exit path from _init always has ret=3D=3D0, s=
o just
> hard-code that return. The error path still returns ret.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2:
> * Added explicit initialized flag. I chose not to re-use the shared-c=
hannel
> =A0bitmap entry for this purpose, since that bit needs to be marked i=
n-use
> =A0so that the non-shared-channel path doesn't hand out that channel.
> * Removed redundant memsets
> * Use bitmap_fill instead of a loop
> * Hard-code success return value
>
> =A0arch/arm/mach-tegra/dma.c | =A0 23 ++++++++++-------------
> =A01 files changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
> index bd4f62a..01db832 100644
> --- a/arch/arm/mach-tegra/dma.c
> +++ b/arch/arm/mach-tegra/dma.c
> @@ -127,8 +127,8 @@ struct tegra_dma_channel {
>
> =A0#define =A0NV_DMA_MAX_CHANNELS =A032
>
> +static int initialized;
Use a bool, and call it something like tegra_dma_initialized to
prevent warnings if someone else forgets a static on a variable called
initialized.

> =A0static DEFINE_MUTEX(tegra_dma_lock);
> -
Unnecessary whitespace change

> =A0static DECLARE_BITMAP(channel_usage, NV_DMA_MAX_CHANNELS);
> =A0static struct tegra_dma_channel dma_channels[NV_DMA_MAX_CHANNELS];
>
> @@ -352,6 +352,9 @@ struct tegra_dma_channel *tegra_dma_allocate_chan=
nel(int mode)
> =A0 =A0 =A0 =A0int channel;
> =A0 =A0 =A0 =A0struct tegra_dma_channel *ch =3D NULL;
>
> + =A0 =A0 =A0 if (!initialized)
Maybe if (WARN_ON(!initialized))?

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> +
> =A0 =A0 =A0 =A0mutex_lock(&tegra_dma_lock);
>
> =A0 =A0 =A0 =A0/* first channel is the shared channel */
> @@ -678,6 +681,8 @@ int __init tegra_dma_init(void)
> =A0 =A0 =A0 =A0void __iomem *addr;
> =A0 =A0 =A0 =A0struct clk *c;
>
> + =A0 =A0 =A0 bitmap_fill(channel_usage, NV_DMA_MAX_CHANNELS);
> +
> =A0 =A0 =A0 =A0c =3D clk_get_sys("tegra-dma", NULL);
> =A0 =A0 =A0 =A0if (IS_ERR(c)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_err("Unable to get clock for APB DM=
A\n");
> @@ -696,18 +701,9 @@ int __init tegra_dma_init(void)
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
> @@ -726,14 +722,15 @@ int __init tegra_dma_init(void)
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
> + =A0 =A0 =A0 initialized =3D 1;
intialized =3D true

>
> - =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 return 0;
> =A0fail:
> =A0 =A0 =A0 =A0writel(0, addr + APB_DMA_GEN);
> =A0 =A0 =A0 =A0for (i =3D TEGRA_SYSTEM_DMA_CH_MIN; i <=3D TEGRA_SYSTE=
M_DMA_CH_MAX; i++) {
> --
> 1.7.1
>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
