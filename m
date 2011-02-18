From: Erik Gilling <konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: Tegra: Add pll_d table entries for 252MHz
Date: Fri, 18 Feb 2011 15:45:35 -0800
Message-ID: <AANLkTimp==gtU2jvCYExqoV6tv-_dgvsF0yAf_k-F7CX@mail.gmail.com>
References: <1298071093-23865-1-git-send-email-swarren@nvidia.com>
	<1298071093-23865-2-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298071093-23865-2-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

These look good.  Have you run these through a CTS tester at 720x480
and 1280x720?  We pass those now and I want to make sure there's not
regressions.  We're supposed to be getting one in a week or two.  If
you haven't run it by then, I'll run a pass with these then merge.

Cheers,
   Erik

On Fri, Feb 18, 2011 at 3:18 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> This rate is required for correct generation of 640x480 HDMI video;
> see subsequent patches.
>
> Note: I tested the entry with 12MHz input. The other entries are unte=
sted,
> but appear logically correct. However, I'm not familiar enough with P=
LLs
> to know if they perhaps exceed the PLL VCO frequency, nor whether the
> cpcon values are strictly correct.
>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index 41f5953..f3ead19 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -1531,6 +1531,11 @@ static struct clk_pll_freq_table tegra_pll_d_f=
req_table[] =3D {
> =A0 =A0 =A0 =A0{ 19200000, 216000000, 135, 12, 1, 3},
> =A0 =A0 =A0 =A0{ 26000000, 216000000, 216, 26, 1, 4},
>
> + =A0 =A0 =A0 { 12000000, 252000000, 252, 12, 1, 4},
> + =A0 =A0 =A0 { 13000000, 252000000, 252, 13, 1, 4},
> + =A0 =A0 =A0 { 19200000, 252000000, 210, 16, 1, 3},
> + =A0 =A0 =A0 { 26000000, 252000000, 252, 26, 1, 4},
> +
> =A0 =A0 =A0 =A0{ 12000000, 594000000, 594, 12, 1, 8},
> =A0 =A0 =A0 =A0{ 13000000, 594000000, 594, 13, 1, 8},
> =A0 =A0 =A0 =A0{ 19200000, 594000000, 495, 16, 1, 8},
> --
> 1.7.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
