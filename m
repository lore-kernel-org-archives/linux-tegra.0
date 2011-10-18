From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] [3.3] ARM: tegra: emc: max rate based on emc table
Date: Tue, 18 Oct 2011 11:23:46 -0700
Message-ID: <CAMbhsRSgLvvPMd69z7aa8A=9ndYuUkmhmsEzK4WFd3AsQBohzg@mail.gmail.com>
References: <1318961694-21105-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318961694-21105-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 18, 2011 at 11:14 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote=
:
> Update max rate for emc clock based on configured EMC timings,
> but by default leave it at the same rate that firmware configured.
>
> Also update the shared clocks accordingly.
>
> This patch was based on work by Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/tegra2_emc.c | =A0 19 +++++++++++++++++++
> =A01 files changed, 19 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/t=
egra2_emc.c
> index 0f7ae6e..bed7e74 100644
> --- a/arch/arm/mach-tegra/tegra2_emc.c
> +++ b/arch/arm/mach-tegra/tegra2_emc.c
> @@ -23,6 +23,7 @@
>
> =A0#include <mach/iomap.h>
>
> +#include "clock.h"
> =A0#include "tegra2_emc.h"
>
> =A0#ifdef CONFIG_TEGRA_EMC_SCALING_ENABLE
> @@ -173,6 +174,24 @@ int tegra_emc_set_rate(unsigned long rate)
>
> =A0void tegra_init_emc(const struct tegra_emc_table *table, int table=
_size)
> =A0{
> + =A0 =A0 =A0 struct clk *c =3D clk_get_sys("emc", NULL);
> + =A0 =A0 =A0 struct clk *user;
> + =A0 =A0 =A0 unsigned long max =3D 0;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 /* Since default max_rate on emc clock is the same as f=
irmware set
> + =A0 =A0 =A0 =A0* it to before booting, raise it up here based on kn=
own timings.
> + =A0 =A0 =A0 =A0*/
> +
> + =A0 =A0 =A0 for (i =3D 0; i < table_size; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (table[i].rate > max)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 max =3D table[i].rate;
> +
> =A0 =A0 =A0 =A0tegra_emc_table =3D table;
> =A0 =A0 =A0 =A0tegra_emc_table_size =3D table_size;
> +
> + =A0 =A0 =A0 c->max_rate =3D max * 2 * 1000;
I don't think you should be modifying internal variables of the struct
clk from here.

> +
> + =A0 =A0 =A0 list_for_each_entry(user, &c->shared_bus_list, u.shared=
_bus_user.node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 user->max_rate =3D c->max_rate;
> =A0}
> --
> 1.7.4.1
>
>
