From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 04/12] clk: tegra: add support for peripheral clock suspend and resume
Date: Wed, 29 May 2019 16:30:48 -0700
Message-ID: <20190529233049.A7E5924371@mail.kernel.org>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com> <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-5-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-05-28 16:08:48)
> This patch implements peripheral clock context save and restore
> to support system suspend and resume operation.

Again, why?

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
> index 6f2862eddad7..08b788766564 100644
> --- a/drivers/clk/tegra/clk.c
> +++ b/drivers/clk/tegra/clk.c
> @@ -81,6 +81,10 @@ static struct clk **clks;
>  static int clk_num;
>  static struct clk_onecell_data clk_data;
> =20
> +#ifdef CONFIG_PM_SLEEP
> +static u32 *periph_ctx;
> +#endif

Please move this into the ifdef below.

> +
>  /* Handlers for SoC-specific reset lines */
>  static int (*special_reset_assert)(unsigned long);
>  static int (*special_reset_deassert)(unsigned long);
> @@ -210,6 +214,65 @@ const struct tegra_clk_periph_regs *get_reg_bank(int=
 clkid)
>         }
>  }
> =20
> +#ifdef CONFIG_PM_SLEEP
> +void tegra_clk_periph_suspend(void __iomem *clk_base)
> +{
> +       int i, idx;
> +
> +       idx =3D 0;
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               periph_ctx[idx] =3D
> +                       readl_relaxed(clk_base + periph_regs[i].rst_reg);
> +
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               periph_ctx[idx] =3D
> +                       readl_relaxed(clk_base + periph_regs[i].enb_reg);
> +}
> +
> +void tegra_clk_periph_force_on(u32 *clks_on, int count, void __iomem *cl=
k_base)
> +{
> +       int i;
> +
> +       WARN_ON(count !=3D periph_banks);
> +
> +       for (i =3D 0; i < count; i++)
> +               writel_relaxed(clks_on[i], clk_base + periph_regs[i].enb_=
reg);
> +}
> +
> +void tegra_clk_periph_resume(void __iomem *clk_base)
> +{
> +       int i, idx;
> +
> +       idx =3D 0;
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               writel_relaxed(periph_ctx[idx],
> +                              clk_base + periph_regs[i].rst_reg);
> +
> +       /* ensure all resets have propagated */
> +       fence_udelay(2, clk_base);
> +       tegra_read_chipid();
> +
> +       for (i =3D 0; i < periph_banks; i++, idx++)
> +               writel_relaxed(periph_ctx[idx],
> +                              clk_base + periph_regs[i].enb_reg);
> +
> +       /* ensure all enables have propagated */
> +       fence_udelay(2, clk_base);
> +       tegra_read_chipid();
> +}
> +
> +static int tegra_clk_suspend_ctx_init(int banks)
> +{
> +       int err =3D 0;
> +
> +       periph_ctx =3D kzalloc(2 * banks * sizeof(*periph_ctx), GFP_KERNE=
L);

Is this kcalloc(2 * banks, sizeof(*periph_ctx)... ?

> +       if (!periph_ctx)
> +               err =3D -ENOMEM;
> +
> +       return err;
> +}
> +#endif
> +
>  struct clk ** __init tegra_clk_init(void __iomem *regs, int num, int ban=
ks)
>  {
>         clk_base =3D regs;
> @@ -226,11 +289,20 @@ struct clk ** __init tegra_clk_init(void __iomem *r=
egs, int num, int banks)
>         periph_banks =3D banks;
> =20
>         clks =3D kcalloc(num, sizeof(struct clk *), GFP_KERNEL);
> -       if (!clks)
> +       if (!clks) {
>                 kfree(periph_clk_enb_refcnt);
> +               return NULL;
> +       }
> =20
>         clk_num =3D num;
> =20
> +#ifdef CONFIG_PM_SLEEP

Can you use if (IS_ENABLED(CONFIG_PM_SLEEP)) here?

> +       if (tegra_clk_suspend_ctx_init(banks)) {
> +               kfree(periph_clk_enb_refcnt);
> +               kfree(clks);
> +               return NULL;
> +       }
> +#endif
>         return clks;
>  }
> =20
