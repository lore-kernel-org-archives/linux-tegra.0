From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] clk: tegra20/30: Add custom EMC clock implementation
Date: Thu, 25 Apr 2019 12:07:56 -0700
Message-ID: <155621927685.15276.16453873579880842057@swboyd.mtv.corp.google.com>
References: <20190414202009.31268-1-digetx@gmail.com> <20190414202009.31268-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414202009.31268-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-14 13:20:06)
> diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-=
tegra20-emc.c
> new file mode 100644
> index 000000000000..35b67a9989c8
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra20-emc.c
> @@ -0,0 +1,307 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/clk/tegra.h>

Include clk-provider.h as this is a clk provider driver.

> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +
> +#include "clk.h"
> +
> +#define CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK     GENMASK(7, 0)
> +#define CLK_SOURCE_EMC_2X_CLK_SRC_MASK         GENMASK(31, 30)
[...]
> +
> +static const struct clk_ops tegra_clk_emc_ops =3D {
> +       .recalc_rate =3D emc_recalc_rate,
> +       .get_parent =3D emc_get_parent,
> +       .set_parent =3D emc_set_parent,
> +       .set_rate =3D emc_set_rate,
> +       .set_rate_and_parent =3D emc_set_rate_and_parent,
> +       .determine_rate =3D emc_determine_rate,
> +};
> +
> +void tegra20_clk_set_emc_round_callback(void *round_cb, void *arg_cb)

Why can't we have type safety on these function pointers?

> +{
> +       struct clk *clk =3D __clk_lookup("emc");
> +       struct tegra_clk_emc *emc;
> +       struct clk_hw *hw;
> +
> +       if (clk) {
> +               hw =3D __clk_get_hw(clk);
> +               emc =3D to_tegra_clk_emc(hw);
> +
> +               emc->round_cb =3D round_cb;
> +               emc->arg_cb =3D arg_cb;
> +       }
> +}
> +
> +bool tegra20_clk_emc_driver_available(void)
> +{
> +       struct clk *clk =3D __clk_lookup("emc");

Can we avoid using __clk_lookup()? Maybe by having the clk_hw pointer in
this driver somehow?

> +       struct tegra_clk_emc *emc;
> +       struct clk_hw *hw;
> +
> +       if (clk) {
> +               hw =3D __clk_get_hw(clk);

This gets further to the point, we don't prefer to see drivers use
__clk_get_hw() unless they absolutely need to. Maybe I don't understand
the driver structure, but it seems like maybe the driver that's
providing the callbacks could be the same driver that's registering
these clks, and thus everything could be inside one file so that we
don't have to pass around callbacks and clk_hw pointers? Commit text
says "this is how it's been" but that's not a reason to keep doing it.

> +               emc =3D to_tegra_clk_emc(hw);
> +
