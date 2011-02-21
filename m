From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2 15/21] ARM: tegra: clock: Round rate before setting rate
Date: Sun, 20 Feb 2011 20:19:53 -0800
Message-ID: <AANLkTi=jJRhyMZXbs3Unr-U+J59rt4SxMQtT4KtCqWbe@mail.gmail.com>
References: <1298154371-5641-1-git-send-email-ccross@android.com>
	<1298154371-5641-17-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298154371-5641-17-git-send-email-ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Sat, Feb 19, 2011 at 2:26 PM, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org> wrote=
:

> diff --git a/arch/arm/mach-tegra/clock.c b/arch/arm/mach-tegra/clock.=
c
> index 8d01a49..9798585 100644
> --- a/arch/arm/mach-tegra/clock.c
> +++ b/arch/arm/mach-tegra/clock.c
> @@ -86,6 +86,7 @@ static unsigned long clk_predict_rate_from_parent(s=
truct clk *c, struct clk *p)
>
> =A0 =A0 =A0 =A0if (c->mul !=3D 0 && c->div !=3D 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rate *=3D c->mul;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rate +=3D c->div / 2; /* round up */

Shouldn't this be "rate +=3D c->div - 1;"?



-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
