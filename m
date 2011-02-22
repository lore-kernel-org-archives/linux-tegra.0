From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: tegra: harmony: fix pinmux for MMC slot
Date: Mon, 21 Feb 2011 19:07:41 -0800
Message-ID: <AANLkTimAF8ypviKj_xqT+1C7d0xaG4vhh=CoNeSmpmUJ@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-7-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298315206-8887-7-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 11:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote=
:
> Turns out MMC2 (the bayonet 4-lane port) wasn't enabled in the
> original pinmux. Fix that.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/board-harmony-pinmux.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/ma=
ch-tegra/board-harmony-pinmux.c
> index 98b9ab2..8c101ba 100644
> --- a/arch/arm/mach-tegra/board-harmony-pinmux.c
> +++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
> @@ -36,10 +36,10 @@ static struct tegra_pingroup_config harmony_pinmu=
x[] =3D {
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP3, =A0TEGRA_MUX_DAP3, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DAP4, =A0TEGRA_MUX_DAP4, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DDC, =A0 TEGRA_MUX_I2C2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_NORMAL},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_DTA, =A0 TEGRA_MUX_SDIO2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_DTB, =A0 TEGRA_MUX_RSVD1, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTA, =A0 TEGRA_MUX_SDIO2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTB, =A0 TEGRA_MUX_RSVD1, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DTC, =A0 TEGRA_MUX_RSVD1, =A0 =A0 =A0 =
=A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> - =A0 =A0 =A0 {TEGRA_PINGROUP_DTD, =A0 TEGRA_MUX_SDIO2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTD, =A0 TEGRA_MUX_SDIO2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 TEGRA_TRI_NORMAL},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DTE, =A0 TEGRA_MUX_RSVD1, =A0 =A0 =A0 =
=A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_DTF, =A0 TEGRA_MUX_I2C3, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_TRISTATE},
> =A0 =A0 =A0 =A0{TEGRA_PINGROUP_GMA, =A0 TEGRA_MUX_SDIO4, =A0 =A0 =A0 =
=A0 TEGRA_PUPD_NORMAL, =A0 =A0TEGRA_TRI_NORMAL},
> --
> 1.7.0.4
>
>

Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
