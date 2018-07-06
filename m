From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/3] clk: tegra: refactor 7.1 div calculation
Date: Fri, 06 Jul 2018 11:21:18 -0700
Message-ID: <153090127889.143105.9965550219605167700@swboyd.mtv.corp.google.com>
References: <1530699455-27654-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1530699455-27654-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Quoting Aapo Vienamo (2018-07-04 03:17:33)
> diff --git a/drivers/clk/tegra/div71.c b/drivers/clk/tegra/div71.c
> new file mode 100644
> index 0000000..1a5e04c
> --- /dev/null
> +++ b/drivers/clk/tegra/div71.c
> @@ -0,0 +1,54 @@
> +/*
> + * Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/kernel.h>

You can include <asm/div64.h> instead.

> +
> +#include "clk.h"
> +
> +#define div_mask(w) ((1 << (w)) - 1)
> +
> +int div71_get(unsigned long rate, unsigned parent_rate, u8 width,
> +             u8 frac_width, u8 flags)
> +{
> +       u64 divider_ux1 =3D parent_rate;

Hmm ok, now it's unsigned. That's works too.

> +       int mul;
> +
> +       if (!rate)
> +               return 0;
> +
> +       mul =3D 1 << frac_width;
> +
> +       if (!(flags & TEGRA_DIVIDER_INT))
> +               divider_ux1 *=3D mul;
> +
> +       if (flags & TEGRA_DIVIDER_ROUND_UP)
> +               divider_ux1 +=3D rate - 1;
> +
> +       do_div(divider_ux1, rate);
> +
> +       if (flags & TEGRA_DIVIDER_INT)
> +               divider_ux1 *=3D mul;
> +
> +       if (divider_ux1 < mul)
> +               return 0;
> +
> +       divider_ux1 -=3D mul;
> +
> +       if (divider_ux1 > div_mask(width))
> +               return div_mask(width);
> +
> +       return divider_ux1;
> +}
