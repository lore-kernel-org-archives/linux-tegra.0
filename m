From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: Move pinmux init call
Date: Mon, 21 Feb 2011 19:21:42 -0800
Message-ID: <AANLkTimcadeAHWuFApw_H+AEs+hgURxCRO2X92M9cehG@mail.gmail.com>
References: <1298173137-9242-1-git-send-email-swarren@nvidia.com>
	<1298173137-9242-5-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298173137-9242-5-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 19, 2011 at 7:38 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> In order for the clock initialization to pick up the results of the
> pinmux initialization (which will initialize various parameters of
> clocks cdev1, cdev2), the pinmux initialization must happen first.
> Move the pinmux init to achieve this.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/board-harmony.c =A0 | =A0 =A04 ++--
> =A0arch/arm/mach-tegra/board-trimslice.c | =A0 =A04 ++--
> =A02 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegr=
a/board-harmony.c
> index b9dbdb1..eea5ad6 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
> @@ -104,12 +104,12 @@ static __initdata struct tegra_clk_init_table h=
armony_clk_init_table[] =3D {
>
> =A0static void __init tegra_harmony_init(void)
> =A0{
> + =A0 =A0 =A0 harmony_pinmux_init();
> +
> =A0 =A0 =A0 =A0tegra_common_init();
>
> =A0 =A0 =A0 =A0tegra_clk_init_from_table(harmony_clk_init_table);
>
> - =A0 =A0 =A0 harmony_pinmux_init();
> -
> =A0 =A0 =A0 =A0platform_add_devices(harmony_devices, ARRAY_SIZE(harmo=
ny_devices));
> =A0}
>
> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-te=
gra/board-trimslice.c
> index ef233b2..aef6abb 100644
> --- a/arch/arm/mach-tegra/board-trimslice.c
> +++ b/arch/arm/mach-tegra/board-trimslice.c
> @@ -85,12 +85,12 @@ subsys_initcall(tegra_trimslice_pci_init);
>
> =A0static void __init tegra_trimslice_init(void)
> =A0{
> + =A0 =A0 =A0 trimslice_pinmux_init();
> +
> =A0 =A0 =A0 =A0tegra_common_init();
>
> =A0 =A0 =A0 =A0tegra_clk_init_from_table(trimslice_clk_init_table);
>
> - =A0 =A0 =A0 trimslice_pinmux_init();
> -
> =A0 =A0 =A0 =A0platform_add_devices(trimslice_devices, ARRAY_SIZE(tri=
mslice_devices));
> =A0}

This isn't going to work any more.  In order for the timer to get a
reference to its clock, clocks have to be up before the system timer
is initialized, so Russell added an init_early hook for clock
initialization.  init_machine happens much later, so the per-board
pinmux init will always happen after clock init.

The calls from clk_dev1/2 init into tegra_pinmux_get_func should be
fine, but they will pick up the bootloader's settings instead of the
board pinmux table settings.  You would need to use the pinmux tables
to untristate the pins (or maybe add untristating, but not
re-tristating, to the clk_enable op?), and add clk_dev1/2 entries to
the clock init table to set the parent to get the correct pinmux
settings.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
