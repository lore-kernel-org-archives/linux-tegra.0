From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/8] arm/tegra: prepare early init for multiple tegra variants
Date: Wed, 2 Nov 2011 11:30:43 -0700
Message-ID: <CAMbhsRSTcR8qgYESmM6OxkXeVeg6vS49woCe_OX6CY4pAj2g_A@mail.gmail.com>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
	<1320242948-21061-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1320242948-21061-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Nov 2, 2011 at 7:09 AM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> This patch splits the early init code in a common and a tegra20 speci=
fic part.
> L2 cache initialization is generalized and discovers the cache associ=
ativity
> at runtime.
>
> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
<snip>

> -static __initdata struct tegra_clk_init_table common_clk_init_table[=
] =3D {
> +void (*arch_reset)(char mode, const char *cmd) =3D tegra_assert_syst=
em_reset;
> +
This is unrelated to the patch description?

> +static __initdata struct tegra_clk_init_table tegra20_clk_init_table=
[] =3D {
> =A0 =A0 =A0 =A0/* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate=
 =A0 =A0 =A0 =A0 =A0 =A0enabled */
> =A0 =A0 =A0 =A0{ "clk_m", =A0 =A0 =A0NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A0true },
> =A0 =A0 =A0 =A0{ "pll_p", =A0 =A0 =A0"clk_m", =A0 =A0 =A0 =A021600000=
0, =A0 =A0 =A0true },
> @@ -59,25 +61,34 @@ static __initdata struct tegra_clk_init_table com=
mon_clk_init_table[] =3D {
> =A0 =A0 =A0 =A0{ NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> =A0};
>
> -static void __init tegra_init_cache(void)
> +static void __init tegra_init_cache(u32 tag_latency, u32 data_latenc=
y)
> =A0{
> =A0#ifdef CONFIG_CACHE_L2X0
> =A0 =A0 =A0 =A0void __iomem *p =3D IO_ADDRESS(TEGRA_ARM_PERIF_BASE) +=
 0x3000;
> + =A0 =A0 =A0 u32 aux_ctrl;
> +
> + =A0 =A0 =A0 writel_relaxed(tag_latency, p + L2X0_TAG_LATENCY_CTRL);
> + =A0 =A0 =A0 writel_relaxed(data_latency, p + L2X0_DATA_LATENCY_CTRL=
);
>
> - =A0 =A0 =A0 writel_relaxed(0x331, p + L2X0_TAG_LATENCY_CTRL);
> - =A0 =A0 =A0 writel_relaxed(0x441, p + L2X0_DATA_LATENCY_CTRL);
> + =A0 =A0 =A0 aux_ctrl =3D readl(p + L2X0_CACHE_TYPE);
> + =A0 =A0 =A0 aux_ctrl =3D (aux_ctrl & 0x700) << (17-8);

If I'm interpreting the PL310 TRM correctly, the cache associativity
value in the L2X0_CACHE_TYPE register is read from the aux control
register, so this is just leaving the existing value in place.  If the
value is not being modified, just take it out of the aux_ctrl mask
passed to l2x0_init.

> + =A0 =A0 =A0 aux_ctrl |=3D 0x7C000001;

This adds the BRESP bit to the aux control register.  Considering the
problems I've seen with random bits in the L2 cache causing all sorts
of instabilities, this should be split out into a separate change so
that it's obvious in a bisect.

>
> - =A0 =A0 =A0 l2x0_init(p, 0x6C080001, 0x8200c3fe);
> + =A0 =A0 =A0 l2x0_init(p, aux_ctrl, 0x8200c3fe);
> =A0#endif
>
> =A0}
>
> -void __init tegra_init_early(void)
> +static void __init tegra_setup_system_reset(void)
> +{
> + =A0 =A0 =A0 arm_arch_reset =3D tegra_assert_system_reset;
> +}
> +
> +void __init tegra20_init_early(void)
> =A0{
> =A0 =A0 =A0 =A0tegra_init_fuse();
> =A0 =A0 =A0 =A0tegra_init_clock();
> - =A0 =A0 =A0 tegra_clk_init_from_table(common_clk_init_table);
> - =A0 =A0 =A0 tegra_init_cache();
> -
> - =A0 =A0 =A0 arm_arch_reset =3D tegra_assert_system_reset;
> + =A0 =A0 =A0 tegra_clk_init_from_table(tegra20_clk_init_table);
> + =A0 =A0 =A0 tegra_init_cache(0x331, 0x441);
> + =A0 =A0 =A0 tegra_setup_system_reset();

It seems likely that there will be multiple init functions that need
to be called from init_early on both tegra20 and tegra30.  Maybe add a
common function that only calls tegra_setup_system_reset() for now?

> =A0}
> --
> 1.7.7.rc0.72.g4b5ea.dirty
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
