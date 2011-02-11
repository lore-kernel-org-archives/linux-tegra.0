From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: add TrimSlice board
Date: Thu, 10 Feb 2011 18:43:16 -0800
Message-ID: <AANLkTim5-dmpF8r9uZp8iDsT6p61D0iaJZuHvRLfUL6Y@mail.gmail.com>
References: <cover.1297063443.git.mike@compulab.co.il>
	<c61e1816027e51acfb5bda1e498225a4da37d92d.1297063443.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c61e1816027e51acfb5bda1e498225a4da37d92d.1297063443.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 7, 2011 at 12:10 AM, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wr=
ote:
> Add basic support for CompuLab TrimSlice platform
>
> Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A06 +
> =A0arch/arm/mach-tegra/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A03 +
> =A0arch/arm/mach-tegra/board-trimslice-pinmux.c | =A0145 ++++++++++++=
++++++++++++++
> =A0arch/arm/mach-tegra/board-trimslice.c =A0 =A0 =A0 =A0| =A0104 ++++=
++++++++++++++
> =A0arch/arm/mach-tegra/board-trimslice.h =A0 =A0 =A0 =A0| =A0 22 ++++
> =A05 files changed, 280 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-tegra/board-trimslice-pinmux.c
> =A0create mode 100644 arch/arm/mach-tegra/board-trimslice.c
> =A0create mode 100644 arch/arm/mach-tegra/board-trimslice.h
>
> diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfi=
g
> index acd9552..f0fda77 100644
> --- a/arch/arm/mach-tegra/Kconfig
> +++ b/arch/arm/mach-tegra/Kconfig
> @@ -27,6 +27,12 @@ config MACH_HARMONY
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Support for nVidia Harmony development platform
>
> +config MACH_TRIMSLICE
> + =A0 =A0 =A0 bool "TrimSlice board"
> + =A0 =A0 =A0 select TEGRA_PCI
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Support for CompuLab TrimSlice platform
> +
> =A0choice
> =A0 =A0 =A0 =A0 prompt "Low-level debug console UART"
> =A0 =A0 =A0 =A0 default TEGRA_DEBUG_UART_NONE
> diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makef=
ile
> index cdbc68e..0e1844b 100644
> --- a/arch/arm/mach-tegra/Makefile
> +++ b/arch/arm/mach-tegra/Makefile
> @@ -19,3 +19,6 @@ obj-$(CONFIG_TEGRA_PCI) =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 +=3D pcie.o
> =A0obj-${CONFIG_MACH_HARMONY} =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D board-h=
armony.o
> =A0obj-${CONFIG_MACH_HARMONY} =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D board-h=
armony-pinmux.o
> =A0obj-${CONFIG_MACH_HARMONY} =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D board-h=
armony-pcie.o
> +
> +obj-${CONFIG_MACH_TRIMSLICE} =A0 =A0 =A0 =A0 =A0 =A0+=3D board-trims=
lice.o
> +obj-${CONFIG_MACH_TRIMSLICE} =A0 =A0 =A0 =A0 =A0 =A0+=3D board-trims=
lice-pinmux.o
> diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/=
mach-tegra/board-trimslice-pinmux.c
> new file mode 100644
> index 0000000..6d4fc9f
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
> @@ -0,0 +1,145 @@
> +/*
> + * arch/arm/mach-tegra/board-trimslice-pinmux.c
> + *
> + * Copyright (C) 2011 CompuLab, Ltd.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <mach/pinmux.h>
> +
> +#include "board-trimslice.h"
> +
> +static __initdata struct tegra_pingroup_config trimslice_pinmux[] =3D=
 {
> + =A0 =A0 =A0 {TEGRA_PINGROUP_ATA, =A0 TEGRA_MUX_IDE, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_ATB, =A0 TEGRA_MUX_SDIO4, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_ATC, =A0 TEGRA_MUX_NAND, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_ATD, =A0 TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_ATE, =A0 TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CDEV1, TEGRA_MUX_OSC, =A0 =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CDEV2, TEGRA_MUX_PLLP_OUT4, =A0 =A0 TEG=
RA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CRTP, =A0TEGRA_MUX_CRT, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CSUS, =A0TEGRA_MUX_VI_SENSOR_CLK, TEGRA=
_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP1, =A0TEGRA_MUX_DAP1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP2, =A0TEGRA_MUX_DAP2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP3, =A0TEGRA_MUX_DAP3, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DAP4, =A0TEGRA_MUX_DAP4, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DDC, =A0 TEGRA_MUX_I2C2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTA, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTB, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTC, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTD, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTE, =A0 TEGRA_MUX_VI, =A0 =A0 =A0 =A0 =
=A0 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DTF, =A0 TEGRA_MUX_I2C3, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GMA, =A0 TEGRA_MUX_SDIO4, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GMB, =A0 TEGRA_MUX_NAND, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GMC, =A0 TEGRA_MUX_SFLASH, =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GMD, =A0 TEGRA_MUX_SFLASH, =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GME, =A0 TEGRA_MUX_GMI, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GPU, =A0 TEGRA_MUX_UARTA, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GPU7, =A0TEGRA_MUX_RTCK, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_GPV, =A0 TEGRA_MUX_PCIE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_HDINT, TEGRA_MUX_HDMI, =A0 =A0 =A0 =A0 =
=A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_I2CP, =A0TEGRA_MUX_I2C, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_IRRX, =A0TEGRA_MUX_UARTB, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_IRTX, =A0TEGRA_MUX_UARTB, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCA, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCB, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCC, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCD, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCE, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_KBCF, =A0TEGRA_MUX_KBC, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LCSN, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD0, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD1, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD2, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD3, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD4, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD5, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD6, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD7, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD8, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD9, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD10, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD11, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD12, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD13, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD14, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD15, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD16, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LD17, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LDC, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LDI, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LHP0, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LHP1, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LHP2, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LHS, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LM0, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LM1, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LPP, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LPW0, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LPW1, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LPW2, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSC0, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSC1, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSCK, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSDA, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSDI, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LSPI, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LVP0, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LVP1, =A0TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_LVS, =A0 TEGRA_MUX_DISPLAYA, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_OWC, =A0 TEGRA_MUX_RSVD2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMC, =A0 TEGRA_MUX_PWR_ON, =A0 =A0 =A0 =
=A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PTA, =A0 TEGRA_MUX_RSVD3, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_RM, =A0 =A0TEGRA_MUX_I2C, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SDB, =A0 TEGRA_MUX_PWM, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SDC, =A0 TEGRA_MUX_PWM, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SDD, =A0 TEGRA_MUX_PWM, =A0 =A0 =A0 =A0=
 =A0 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SDIO1, TEGRA_MUX_SDIO1, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SLXA, =A0TEGRA_MUX_PCIE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SLXC, =A0TEGRA_MUX_SDIO3, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SLXD, =A0TEGRA_MUX_SDIO3, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SLXK, =A0TEGRA_MUX_PCIE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPDI, =A0TEGRA_MUX_SPDIF, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPDO, =A0TEGRA_MUX_SPDIF, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIA, =A0TEGRA_MUX_SPI2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIB, =A0TEGRA_MUX_SPI2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIC, =A0TEGRA_MUX_SPI2, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPID, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIE, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIF, =A0TEGRA_MUX_SPI1, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_DOWN, =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIG, =A0TEGRA_MUX_SPI2_ALT, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_SPIH, =A0TEGRA_MUX_SPI2_ALT, =A0 =A0 =A0=
TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UAA, =A0 TEGRA_MUX_ULPI, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UAB, =A0 TEGRA_MUX_ULPI, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UAC, =A0 TEGRA_MUX_RSVD2, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UAD, =A0 TEGRA_MUX_IRDA, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UCA, =A0 TEGRA_MUX_UARTC, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UCB, =A0 TEGRA_MUX_UARTC, =A0 =A0 =A0 =A0=
 TEGRA_PUPD_PULL_UP, =A0 =A0 TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_UDA, =A0 TEGRA_MUX_ULPI, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_TRISTATE},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_CK32, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_DDRC, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMCA, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMCB, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMCC, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMCD, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_PMCE, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_XM2C, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> + =A0 =A0 =A0 {TEGRA_PINGROUP_XM2D, =A0TEGRA_MUX_NONE, =A0 =A0 =A0 =A0=
 =A0TEGRA_PUPD_NORMAL, =A0 =A0 =A0TEGRA_TRI_NORMAL},
> +};
> +
> +void __init trimslice_pinmux_init(void)
> +{
> + =A0 =A0 =A0 tegra_pinmux_config_table(trimslice_pinmux, ARRAY_SIZE(=
trimslice_pinmux));
> +}
> diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-te=
gra/board-trimslice.c
> new file mode 100644
> index 0000000..ef233b2
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-trimslice.c
> @@ -0,0 +1,104 @@
> +/*
> + * arch/arm/mach-tegra/board-trimslice.c
> + *
> + * Copyright (C) 2011 CompuLab, Ltd.
> + * Author: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> + *
> + * Based on board-harmony.c
> + * Copyright (C) 2010 Google, Inc.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/platform_device.h>
> +#include <linux/serial_8250.h>
> +#include <linux/io.h>
> +
> +#include <asm/mach-types.h>
> +#include <asm/mach/arch.h>
> +#include <asm/setup.h>
> +
> +#include <mach/iomap.h>
> +
> +#include "board.h"
> +#include "clock.h"
> +
> +#include "board-trimslice.h"
> +
> +static struct plat_serial8250_port debug_uart_platform_data[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .membase =A0 =A0 =A0 =A0=3D IO_ADDRESS(=
TEGRA_UARTA_BASE),
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mapbase =A0 =A0 =A0 =A0=3D TEGRA_UARTA=
_BASE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .irq =A0 =A0 =A0 =A0 =A0 =A0=3D INT_UAR=
TA,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D UPF_BOOT_=
AUTOCONF,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .iotype =A0 =A0 =A0 =A0 =3D UPIO_MEM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .regshift =A0 =A0 =A0 =3D 2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .uartclk =A0 =A0 =A0 =A0=3D 216000000,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .flags =A0 =A0 =A0 =A0 =A0=3D 0
> + =A0 =A0 =A0 }
> +};
> +
> +static struct platform_device debug_uart =3D {
> + =A0 =A0 =A0 .name =A0 =3D "serial8250",
> + =A0 =A0 =A0 .id =A0 =A0 =3D PLAT8250_DEV_PLATFORM,
> + =A0 =A0 =A0 .dev =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .platform_data =A0=3D debug_uart_platfo=
rm_data,
> + =A0 =A0 =A0 },
> +};
> +
> +static struct platform_device *trimslice_devices[] __initdata =3D {
> + =A0 =A0 =A0 &debug_uart,
> +};
> +
> +static void __init tegra_trimslice_fixup(struct machine_desc *desc,
> + =A0 =A0 =A0 struct tag *tags, char **cmdline, struct meminfo *mi)
> +{
> + =A0 =A0 =A0 mi->nr_banks =3D 2;
> + =A0 =A0 =A0 mi->bank[0].start =3D PHYS_OFFSET;
> + =A0 =A0 =A0 mi->bank[0].size =3D 448 * SZ_1M;
> + =A0 =A0 =A0 mi->bank[1].start =3D SZ_512M;
> + =A0 =A0 =A0 mi->bank[1].size =3D SZ_512M;
> +}
> +
> +static __initdata struct tegra_clk_init_table trimslice_clk_init_tab=
le[] =3D {
> + =A0 =A0 =A0 /* name =A0 =A0 =A0 =A0 parent =A0 =A0 =A0 =A0 =A0rate =
=A0 =A0 =A0 =A0 =A0 =A0enabled */
> + =A0 =A0 =A0 { "uarta", =A0 =A0 =A0"pll_p", =A0 =A0 =A0 =A0216000000=
, =A0 =A0 =A0true },
> + =A0 =A0 =A0 { NULL, =A0 =A0 =A0 =A0 NULL, =A0 =A0 =A0 =A0 =A0 0, =A0=
 =A0 =A0 =A0 =A0 =A0 =A00},
> +};
> +
> +static int __init tegra_trimslice_pci_init(void)
> +{
> + =A0 =A0 =A0 return tegra_pcie_init(true, true);
> +}
> +subsys_initcall(tegra_trimslice_pci_init);
> +
> +static void __init tegra_trimslice_init(void)
> +{
> + =A0 =A0 =A0 tegra_common_init();
> +
> + =A0 =A0 =A0 tegra_clk_init_from_table(trimslice_clk_init_table);
> +
> + =A0 =A0 =A0 trimslice_pinmux_init();
> +
> + =A0 =A0 =A0 platform_add_devices(trimslice_devices, ARRAY_SIZE(trim=
slice_devices));
> +}
> +
> +MACHINE_START(TRIMSLICE, "trimslice")
> + =A0 =A0 =A0 .boot_params =A0 =A0=3D 0x00000100,
> + =A0 =A0 =A0 .fixup =A0 =A0 =A0 =A0 =A0=3D tegra_trimslice_fixup,
> + =A0 =A0 =A0 .init_irq =A0 =A0 =A0 =3D tegra_init_irq,
> + =A0 =A0 =A0 .init_machine =A0 =3D tegra_trimslice_init,
> + =A0 =A0 =A0 .map_io =A0 =A0 =A0 =A0 =3D tegra_map_common_io,
> + =A0 =A0 =A0 .timer =A0 =A0 =A0 =A0 =A0=3D &tegra_timer,
> +MACHINE_END
> diff --git a/arch/arm/mach-tegra/board-trimslice.h b/arch/arm/mach-te=
gra/board-trimslice.h
> new file mode 100644
> index 0000000..16ec0f0
> --- /dev/null
> +++ b/arch/arm/mach-tegra/board-trimslice.h
> @@ -0,0 +1,22 @@
> +/*
> + * arch/arm/mach-tegra/board-trimslice.h
> + *
> + * Copyright (C) 2011 CompuLab, Ltd.
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef _MACH_TEGRA_BOARD_TRIMSLICE_H
> +#define _MACH_TEGRA_BOARD_TRIMSLICE_H
> +
> +void trimslice_pinmux_init(void);
> +
> +#endif
> --
> 1.7.3.1

Ack, the machine type is merged so I'll put this in for-next.  Do you
want it enabled in tegra_defconfig?
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
