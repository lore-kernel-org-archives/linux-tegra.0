From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/6] ARM: tegra: add seaboard, wario and kaen boards
Date: Mon, 21 Feb 2011 19:07:00 -0800
Message-ID: <AANLkTik6OjZZ=MTU0iq3yk9X57F6ZneBnQGsYFno1zKR@mail.gmail.com>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
	<1298315206-8887-6-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298315206-8887-6-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 21, 2011 at 11:06 AM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote=
:
> This adds board support for the Seaboard eval platform and some of th=
e
> derivatives that are very similar. Since they only differ in some ver=
y
> minor ways, most of the code is shared.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
17 +++
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A03 +
> =A0arch/arm/mach-tegra/board-seaboard-pinmux.c | =A0179 +++++++++++++=
+++++++++++
> =A0arch/arm/mach-tegra/board-seaboard.c =A0 =A0 =A0 =A0| =A0195 +++++=
++++++++++++++++++++++
> =A0arch/arm/mach-tegra/board-seaboard.h =A0 =A0 =A0 =A0| =A0 38 +++++
> =A05 files changed, 432 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard-pinmux.c
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard.c
> =A0create mode 100644 arch/arm/mach-tegra/board-seaboard.h
>
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfi=
g
> index cac8a79..36f0d3c 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -27,6 +27,23 @@ config MACH_HARMONY
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for nVidia Harmony development platform
>
> +config MACH_SEABOARD
> + =A0 =A0 =A0 bool "Seaboard board family"
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Support for nVidia Seaboard development platform
> +
> +config MACH_KAEN
> + =A0 =A0 =A0 bool "Kaen board"
> + =A0 =A0 =A0 depends on MACH_SEABOARD
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Support for the Kaen version of Seaboard
> +
> +config MACH_WARIO
> + =A0 =A0 =A0 bool "Wario board"
> + =A0 =A0 =A0 depends on MACH_SEABOARD
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Support for the Wario version of Seaboard
> +
It's easier to prevent merge conflicts if these stay in alphabetical
order.  Even though these 3 are closely related, the next person to
add a board is going to assume they are not in alphabetical order and
put theirs at the bottom.  I would also suggest "selects
MACH_SEABOARD" instead of "depends on MACH_SEABOARD", which will help
when they are out of order.

> =A0config MACH_TRIMSLICE
> =A0 =A0 =A0 =A0bool "TrimSlice board"
> =A0 =A0 =A0 =A0select TEGRA_PCI

<snip>

> diff --git a/arch/arm/mach-tegra/board-seaboard-pinmux.c b/arch/arm/m=
ach-tegra/board-seaboard-pinmux.c
> new file mode 100644
> index 0000000..24e14c5
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-seaboard-pinmux.c
> @@ -0,0 +1,179 @@
> +/*
> + * Copyright (C) 2010 NVIDIA Corporation
This seems unique enough not be copyright nVidia.

> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-teg=
ra/board-seaboard.c
> new file mode 100644
> index 0000000..deeddfe
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-seaboard.c
<snip>
> +#include <mach/io.h>
#include <linux/io.h> instead

<snip>

> +static void __init __tegra_seaboard_init(void)
> +{
> + =A0 =A0 =A0 seaboard_pinmux_init();
> +
> + =A0 =A0 =A0 tegra_common_init();
My recent clock patch series includes a change to replace
tegra_common_init with tegra_early_init.  If my patch goes in before
this one, you'll need to update this one.

<snip>

> +MACHINE_START(SEABOARD, "seaboard")
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D 0x00000100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D tegra_init_irq,
> + =A0 =A0 =A0 .init_machine =A0 =3D tegra_seaboard_init,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D tegra_map_common_io,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &tegra_timer,
> +MACHINE_END
> +
> +MACHINE_START(KAEN, "kaen")
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D 0x00000100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D tegra_init_irq,
> + =A0 =A0 =A0 .init_machine =A0 =3D tegra_kaen_init,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D tegra_map_common_io,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &tegra_timer,
> +MACHINE_END
> +
> +MACHINE_START(WARIO, "wario")
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D 0x00000100,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D tegra_init_irq,
> + =A0 =A0 =A0 .init_machine =A0 =3D tegra_wario_init,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D tegra_map_common_io,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &tegra_timer,
> +MACHINE_END
These should be in the order they are called during init: map_io,
init_irq, timer, init_machine.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
