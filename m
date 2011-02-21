From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 12/21] ARM: tegra: clock: Add shared bus clock type
Date: Sun, 20 Feb 2011 20:15:25 -0800
Message-ID: <AANLkTinWQRmKhorYHQ2rHCArHN89go-2mYVAe5UUZVOV@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-1-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sat, Feb 19, 2011 at 2:25 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:
> Some clocks may have multiple downstream users that need to request a
> higher clock rate. =A0Shared bus clocks provide a unique shared_bus_u=
ser
> clock to each user. =A0The frequency of the bus is set to the highest
> enabled shared_bus_user clock, with a minimum value set by the
> shared bus. =A0Drivers can use clk_enable and clk_disable to enable
> or disable their requirement, and clk_set_rate to set the minimum rat=
e.
>
> Signed-off-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>

[...]
> diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegr=
a/tegra2_clocks.c
> index a1c86d8..dd53af3 100644
> --- a/arch/arm/mach-tegra/tegra2_clocks.c
> +++ b/arch/arm/mach-tegra/tegra2_clocks.c
[...]

> + =A0 =A0 =A0 c->u.shared_bus_user.rate =3D c->parent->max_rate;
> + =A0 =A0 =A0 c->state =3D OFF;
> +#ifdef CONFIG_DEBUG_FS
> + =A0 =A0 =A0 c->set =3D 1;
> +#endif
> +
> + =A0 =A0 =A0 spin_lock_irqsave(&c->parent->spinlock, flags);


A later patch in the series removes the ifdef. Might as well remove it
here. Also, should be c->set =3D true, which that patch also does. :)

With that fixed:

Acked-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
