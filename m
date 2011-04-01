From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: fix error check in tegra2_clocks.c
Date: Fri, 1 Apr 2011 13:39:27 -0700
Message-ID: <BANLkTimxRd6X2JhchrVw45MpbdpQw8Zpeg@mail.gmail.com>
References: <20110330155911.6dc0ef63@absol.kitzblitz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110330155911.6dc0ef63-m0oTu1HmxXpuhsjpcywf5g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Kaiser <nikai-bVCNqDZ4lKNeoWH0uzbU5w@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 30, 2011 at 6:59 AM, Nicolas Kaiser <nikai-bVCNqDZ4lKNeoWH0uzbU5w@public.gmane.org> wrote=
:
> Checking 'rate < 0' doesn't work because 'rate' is unsigned.
>
> Signed-off-by: Nicolas Kaiser <nikai-bVCNqDZ4lKNeoWH0uzbU5w@public.gmane.org>
> ---
> Untested.
>
> =A0arch/arm/mach-tegra/tegra2_clocks.c | =A0 =A09 +++++----
> =A01 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index 6d7c4ee..4459470 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
> @@ -1362,14 +1362,15 @@ static int tegra_clk_shared_bus_set_rate(stru=
ct clk *c, unsigned long rate)
> =A0{
> =A0 =A0 =A0 =A0unsigned long flags;
> =A0 =A0 =A0 =A0int ret;
> + =A0 =A0 =A0 long new_rate =3D rate;
>
> - =A0 =A0 =A0 rate =3D clk_round_rate(c->parent, rate);
> - =A0 =A0 =A0 if (rate < 0)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rate;
> + =A0 =A0 =A0 new_rate =3D clk_round_rate(c->parent, new_rate);
> + =A0 =A0 =A0 if (new_rate < 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return new_rate;
>
> =A0 =A0 =A0 =A0spin_lock_irqsave(&c->parent->spinlock, flags);
>
> - =A0 =A0 =A0 c->u.shared_bus_user.rate =3D rate;
> + =A0 =A0 =A0 c->u.shared_bus_user.rate =3D new_rate;
> =A0 =A0 =A0 =A0ret =3D tegra_clk_shared_bus_update(c->parent);
>
> =A0 =A0 =A0 =A0spin_unlock_irqrestore(&c->parent->spinlock, flags);
> --
> 1.7.3.4
>

Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
