From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] clk: tegra20/30: Add custom EMC clock implementation
Date: Thu, 25 Apr 2019 17:41:15 -0700
Message-ID: <155623927513.15276.3011897763001027401@swboyd.mtv.corp.google.com>
References: <20190414202009.31268-1-digetx@gmail.com> <20190414202009.31268-2-digetx@gmail.com> <155621927685.15276.16453873579880842057@swboyd.mtv.corp.google.com> <2b4f56cd-caf9-e6b5-6344-a045e08a9c91@gmail.com> <155623110849.15276.13181079281286430446@swboyd.mtv.corp.google.com> <1497cbbe-9748-87f1-2edc-daa54dbf6360@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497cbbe-9748-87f1-2edc-daa54dbf6360@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2019-04-25 17:03:11)
> 26.04.2019 1:25, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Quoting Dmitry Osipenko (2019-04-25 14:42:19)
> >> 25.04.2019 22:07, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> Quoting Dmitry Osipenko (2019-04-14 13:20:06)
> >>>> +{
> >>>> +       struct clk *clk =3D __clk_lookup("emc");
> >>>> +       struct tegra_clk_emc *emc;
> >>>> +       struct clk_hw *hw;
> >>>> +
> >>>> +       if (clk) {
> >>>> +               hw =3D __clk_get_hw(clk);
> >>>> +               emc =3D to_tegra_clk_emc(hw);
> >>>> +
> >>>> +               emc->round_cb =3D round_cb;
> >>>> +               emc->arg_cb =3D arg_cb;
> >>>> +       }
> >>>> +}
> >>>> +
> >>>> +bool tegra20_clk_emc_driver_available(void)
> >>>> +{
> >>>> +       struct clk *clk =3D __clk_lookup("emc");
> >>>
> >>> Can we avoid using __clk_lookup()? Maybe by having the clk_hw pointer=
 in
> >>> this driver somehow?
> >>
> >> tegra20_clk_emc_driver_available() is a private function of the Tegra's
> >> clk-core. Please note that prototype of this function is added to the
> >> local "drivers/clk/tegra/clk.h" file.
> >>
> >> It is indeed possible to use clk pointer instead of __clk_lookup() and
> >> I'll change that in v3 since it's causing some confusion.
> >=20
> > Can you use a clk_hw pointer directly? I'd like to see clk provider
> > drivers only use struct clk_hw, and clk consumers only use struct clk.
>=20
> The clk_hw pointers are not stored directly anywhere in the Tegra's
> clk-driver, it will be a quite massive change to make the clk driver's
> code to use clk_hw pointers instead of struct clk.

Well they must be stored in the clk driver somewhere because that's how
the whole clk framework works.

>=20
> I can add a global variable for the tegra_clk_emc pointer, but it is
> not really necessary since there is __clk_get_hw.
>=20
> Could you please explain what's the problem with __clk_get_hw?

If it's a large invasive change then no worries. The thin that's wrong
with __clk_get_hw() is that it's using a struct clk, meaing that most
likely this is a clk consumer driver doing something weird.

>=20
> >>
> >>>> +       struct tegra_clk_emc *emc; +       struct clk_hw *hw; + +
> >>>> if (clk) { +               hw =3D __clk_get_hw(clk);
> >>>
> >>> This gets further to the point, we don't prefer to see drivers use
> >>> __clk_get_hw() unless they absolutely need to. Maybe I don't
> >>> understand the driver structure, but it seems like maybe the
> >>> driver that's providing the callbacks could be the same driver
> >>> that's registering these clks, and thus everything could be inside
> >>> one file so that we don't have to pass around callbacks and clk_hw
> >>> pointers? Commit text says "this is how it's been" but that's not
> >>> a reason to keep doing it.
> >>
> >> Again, tegra20_clk_emc_driver_available() is for the Terga's
> >> clk-core and not for the EMC (External Memory Controller) driver.
> >> This function is used to determine whether EMC driver is ready to
> >> handle clock-rate changes (PRE/POST rate-change notifications), clk
> >> users can't get EMC clock until driver is ready (i.e. the "round"
> >> callback is registered by the driver).
> >=20
> > Who are the other users of the EMC clk? Why does the EMC driver and
> > the clk driver need to be in sync in such a way that requires us to
> > check if some code in the EMC driver is ready before we can hand out
> > clks from this clk provider? It looks like some tight coupling
> > between these two pieces of code on the clk_get() path which is
> > setting off alarms for me.
>=20
> The other EMC clk user is the devfreq driver. We don't want the
> devfreq driver to get and use the EMC clock if memory timing can't be
> programmed.

Alright, got it!

> That is correct.
>=20
> > Is there some other entity that's needing to be deferred while the
> > EMC and clk drivers tell each other that they're probed and ready so
> > that these notifiers all work? Is that entity using clks directly
> > instead of going through the EMC to change frequencies? If so, why
> > can't we funnel that logic through EMC which then goes to the clk
> > driver? That way it's clearly "thing that changes frequency" -> EMC
> > -> clk controller call chain. It might even allow us to get rid of
> > the rate notifiers?
> >=20
>=20
> That entity is the devfreq driver which uses EMC clk directly right
> now.
>=20
>         https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/tree/drivers/devfreq/tegra-devfreq.c#n484
>=20
> I think we can funnel all the rate-changing logic through the EMC
> drivers using the PM memory bandwidth QoS API, which is currently
> unsupported by the drivers. And then indeed the rate notifiers won't
> be needed.

Why does PM QoS matter here? I'm mostly asking for the chain to be
stacked and the devfreq driver to be the same as the EMC driver and then
have the EMC/devfreq combo driver use clk APIs to set rates and do
things before and after.

>=20
>         https://github.com/grate-driver/linux/commit/2aa2390dd0cb8bca98e4=
cea6a29d7bda64a51bb3
>=20
> Actually it will be the next step to wire up the PM QoS support to all
> relevant drivers that I'm going to implement after the current
> CLK/EMC/DEVFREQ patch sets will land, it's just not realistic to do
> everything in a single hop.

Ok. It doesn't make me feel great but I suppose if you don't disappear
after this code is merged things will work out in the end.
