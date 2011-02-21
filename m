From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 14/21] ARM: tegra: clock: Refcount periph clock enables
Date: Sun, 20 Feb 2011 20:18:10 -0800
Message-ID: <AANLkTin8AmjM2CWoNh54NmyV6=298bGzDUPO+j4LTrBj@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-16-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-16-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Some peripheral clocks share enable bits. =A0Refcount the enables so
> that calling clk_disable on one clock will not turn off another
> clock.
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 35 +++++++++++++++++++++=
++++++++------
> =A01 files changed, 29 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index 196c249..2734889 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -154,6 +154,12 @@ static void __iomem *reg_pmc_base =3D IO_ADDRESS=
(TEGRA_PMC_BASE);
> =A0*/
> =A0static DEFINE_SPINLOCK(clock_register_lock);
>
> +/*
> + * Some peripheral clocks share an enable bit, so refcount the enabl=
e bits
> + * in registers CLK_ENABLE_L, CLK_ENABLE_H, and CLK_ENABLE_U
> + */
> +static int tegra_periph_clk_enable_refcount[3 * 32];

Given that this is always locked when incrementing/decrementing,
should it just be switched to an array of atomics instead?


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
