From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH V2 03/12] clk: tegra: save and restore PLLs state for system
Date: Wed, 05 Jun 2019 16:31:22 -0700
Message-ID: <20190605233123.AC6DD2083E@mail.kernel.org>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com> <1559084936-4610-4-git-send-email-skomatineni@nvidia.com> <20190529232810.14A5224366@mail.kernel.org> <f5fd9068-134a-3343-9cca-94db67cd748f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f5fd9068-134a-3343-9cca-94db67cd748f@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, thierry.reding@gmail.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Sowjanya Komatineni (2019-05-31 12:52:44)
>=20
> On 5/29/19 4:28 PM, Stephen Boyd wrote:
> > Quoting Sowjanya Komatineni (2019-05-28 16:08:47)
> >> +               WARN_ON(1);
> >> +               return;
> >> +       }
> >> +
> >> +       parent_rate =3D clk_hw_get_rate(parent);
> >> +
> >> +       if (clk_frac_div_set_rate(hw, rate, parent_rate) < 0)
> >> +               WARN_ON(1);
> >> +}
> >> +#endif
> >> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> >> index 09bccbb9640c..e4d124cc5657 100644
> >> --- a/drivers/clk/tegra/clk.h
> >> +++ b/drivers/clk/tegra/clk.h
> >> @@ -841,6 +841,15 @@ int tegra_pll_p_div_to_hw(struct tegra_clk_pll *p=
ll, u8 p_div);
> >>   int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
> >>                   u8 frac_width, u8 flags);
> >>  =20
> >> +#ifdef CONFIG_PM_SLEEP
> > Can you remove this ifdef? It just complicates compilation testing.
> OK, Will fix in next version
> >> +void tegra_clk_pll_resume(struct clk *c, unsigned long rate);
> >> +void tegra_clk_divider_resume(struct clk_hw *hw, unsigned long rate);
> >> +void tegra_clk_pll_out_resume(struct clk *clk, unsigned long rate);
> >> +void tegra_clk_plle_tegra210_resume(struct clk *c);
> >> +void tegra_clk_sync_state_pll(struct clk *c);
> >> +void tegra_clk_sync_state_pll_out(struct clk *clk);
> > Do these APIs need to operate on struct clk? Why can't they operate on
> > clk_hw or why can't we drive the suspend/resume sequence from the clk
> > provider driver itself?
> >
> Yes can change to use clk_hw.
>=20
> By clk provider driver, are you referring to clk-tegra210?

I guess so.

>=20
> clk-terga210 driver has suspend/resume implementation. These API's are=20
> for corresponding clock specific implementations (clk-pll, clk-pll-out,=20
> clk-divider) for enabling and restoring to proper rate and are invoked=20
> during clk-tegra210 driver resume.

Yes, so when the clk provider suspends it needs to do something? Our
handling of clk rates and other state like enable/disable over
suspend/resume isn't really well thought out or implemented so far. TI
has some code to do some stuff, but otherwise I haven't seen drivers
handling this. Ideally it would be something generic in the framework so
that drivers don't have to work around stuff.
