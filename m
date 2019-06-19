From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v4 01/10] clk: tegra20/30: Add custom EMC clock implementation
Date: Tue, 18 Jun 2019 18:14:00 -0700
Message-ID: <20190619011401.9DE5C2085A@mail.kernel.org>
References: <20190616233551.6838-1-digetx@gmail.com> <20190616233551.6838-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190616233551.6838-2-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-06-16 16:35:42)
> A proper External Memory Controller clock rounding and parent selection
> functionality is required by the EMC drivers. It is not available using
> the generic clock implementation, hence add a custom one.=20

Why isn't it available? Please add this information to the commit text.

> The clock rate
> rounding shall be done by the EMC drivers because they have information
> about available memory timings, so the drivers will have to register a
> callback that will round the requested rate. EMC clock users won't be able
> to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
> and the callback is set up. The functionality is somewhat similar to the
> clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
> more parent clock sources and the HW configuration and integration with
> the EMC drivers differs a tad from the older gens, hence it's not really
> worth to try to squash everything into a single source file.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
[...]
> diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-=
tegra20-emc.c
> new file mode 100644
> index 000000000000..b7f64ad5c04c
> --- /dev/null
> +++ b/drivers/clk/tegra/clk-tegra20-emc.c
> @@ -0,0 +1,305 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk/tegra.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +
> +#include "clk.h"
> +
> +#define CLK_SOURCE_EMC_2X_CLK_DIVISOR_MASK     GENMASK(7, 0)
> +#define CLK_SOURCE_EMC_2X_CLK_SRC_MASK         GENMASK(31, 30)
> +#define CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT                30
> +
> +#define MC_EMC_SAME_FREQ       BIT(16)
> +#define USE_PLLM_UD            BIT(29)
> +
> +#define EMC_SRC_PLL_M          0
> +#define EMC_SRC_PLL_C          1
> +#define EMC_SRC_PLL_P          2
> +#define EMC_SRC_CLK_M          3
> +
[...]
> +void tegra20_clk_set_emc_round_callback(tegra20_clk_emc_round_cb *round_=
cb,
> +                                       void *cb_arg)
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
> +               emc->cb_arg =3D cb_arg;
> +       }
> +}
> +
> +bool tegra20_clk_emc_driver_available(struct clk_hw *emc_hw)
> +{
> +       return to_tegra_clk_emc(emc_hw)->round_cb !=3D NULL;
> +}
> +
> +struct clk *tegra20_clk_register_emc(void __iomem *ioaddr)

Is this used outside this file?

> +{
> +       struct tegra_clk_emc *emc;
> +       struct clk_init_data init;
> +       struct clk *clk;
> +
> +       emc =3D kzalloc(sizeof(*emc), GFP_KERNEL);
> +       if (!emc)
> +               return NULL;
> +
> +       init.name =3D "emc";
> +       init.ops =3D &tegra_clk_emc_ops;
> +       init.flags =3D CLK_IS_CRITICAL;

Can you please add a comment in the code why this clk is critical?

> +       init.parent_names =3D emc_parent_clk_names;
> +       init.num_parents =3D ARRAY_SIZE(emc_parent_clk_names);
> +
> +       emc->reg =3D ioaddr;
> +       emc->hw.init =3D &init;
> +
> +       clk =3D clk_register(NULL, &emc->hw);
> +       if (IS_ERR(clk)) {
> +               kfree(emc);
> +               return NULL;
> +       }
> +
> +       return clk;
> +}
> +
> +void tegra30_clk_set_emc_round_callback(tegra30_clk_emc_round_cb *round_=
cb,
> +                                       void *cb_arg)
> +{
> +       tegra20_clk_set_emc_round_callback(round_cb, cb_arg);
> +}
> +
> +bool tegra30_clk_emc_driver_available(struct clk_hw *emc_hw)
> +{
> +       return tegra20_clk_emc_driver_available(emc_hw);
> +}
> +
> +struct clk *tegra30_clk_register_emc(void __iomem *ioaddr)
> +{
> +       struct tegra_clk_emc *emc;
> +       struct clk_hw *hw;
> +       struct clk *clk;
> +
> +       clk =3D tegra20_clk_register_emc(ioaddr);
> +       if (!clk)
> +               return NULL;
> +
> +       hw =3D __clk_get_hw(clk);

It would be nicer to not use __clk_get_hw() and have the above function
return the clk_hw pointer instead. Then some driver can return the clk
pointer from there, if it's even needed for anything?

> +       emc =3D to_tegra_clk_emc(hw);
> +       emc->want_low_jitter =3D true;
> +
> +       return clk;
> +}
> +
> +int tegra30_clk_prepare_emc_mc_same_freq(struct clk *emc_clk, bool same)
> +{
> +       struct tegra_clk_emc *emc;
> +       struct clk_hw *hw;
> +
> +       if (emc_clk) {
> +               hw =3D __clk_get_hw(emc_clk);
> +               emc =3D to_tegra_clk_emc(hw);
> +               emc->mc_same_freq =3D same;
> +
> +               return 0;
> +       }
> +
> +       return -EINVAL;
> +}
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index bcd871134f45..f937a0f35afb 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1115,6 +1083,8 @@ static struct clk *tegra20_clk_src_onecell_get(stru=
ct of_phandle_args *clkspec,
>         if (IS_ERR(clk))
>                 return clk;
> =20
> +       hw =3D __clk_get_hw(clk);
> +
>         /*
>          * Tegra20 CDEV1 and CDEV2 clocks are a bit special case, their p=
arent
>          * clock is created by the pinctrl driver. It is possible for clk=
 user
> @@ -1124,13 +1094,16 @@ static struct clk *tegra20_clk_src_onecell_get(st=
ruct of_phandle_args *clkspec,
>          */
>         if (clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV1 ||
>             clkspec->args[0] =3D=3D TEGRA20_CLK_CDEV2) {
> -               hw =3D __clk_get_hw(clk);
> -
>                 parent_hw =3D clk_hw_get_parent(hw);
>                 if (!parent_hw)
>                         return ERR_PTR(-EPROBE_DEFER);
>         }
> =20
> +       if (clkspec->args[0] =3D=3D TEGRA20_CLK_EMC) {
> +               if (!tegra20_clk_emc_driver_available(hw))
> +                       return ERR_PTR(-EPROBE_DEFER);
> +       }
> +
>         return clk;
>  }
> =20
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 7b4c6a488527..fab075808c20 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1302,6 +1298,26 @@ static struct tegra_audio_clk_info tegra30_audio_p=
lls[] =3D {
>         { "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
>  };
> =20
> +static struct clk *tegra30_clk_src_onecell_get(struct of_phandle_args *c=
lkspec,
> +                                              void *data)
> +{
> +       struct clk_hw *hw;
> +       struct clk *clk;
> +
> +       clk =3D of_clk_src_onecell_get(clkspec, data);
> +       if (IS_ERR(clk))
> +               return clk;
> +
> +       hw =3D __clk_get_hw(clk);
> +
> +       if (clkspec->args[0] =3D=3D TEGRA30_CLK_EMC) {
> +               if (!tegra30_clk_emc_driver_available(hw))
> +                       return ERR_PTR(-EPROBE_DEFER);
> +       }
> +
> +       return clk;
> +}

This above function makes me uneasy because it looks like a clk_get() on
top of a clk_get()?=20

> +
>  static void __init tegra30_clock_init(struct device_node *np)
>  {
>         struct device_node *node;
