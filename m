From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 07/22] clk: Add API to get index of the clock parent
Date: Thu, 07 Nov 2019 11:19:32 -0800
Message-ID: <20191107191933.0B18021D6C@mail.kernel.org>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com> <1565984527-5272-8-git-send-email-skomatineni@nvidia.com> <20191106231005.F2CD820869@mail.kernel.org> <fcc43ccb-8c6e-d518-4c70-503501706ffd@gmail.com> <20191107152115.GA2580600@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191107152115.GA2580600@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2019-11-07 07:21:15)
> On Thu, Nov 07, 2019 at 03:54:03AM +0300, Dmitry Osipenko wrote:
> > 07.11.2019 02:10, Stephen Boyd =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > Quoting Sowjanya Komatineni (2019-08-16 12:41:52)
> > >> This patch adds an API clk_hw_get_parent_index to get index of the
> > >> clock parent to use during the clock restore operations on system
> > >> resume.
> > > =20
> > > Is there a reason we can't save the clk hw index at suspend time by
> > > reading the hardware to understand the current parent? The parent ind=
ex
> > > typically doesn't matter unless we're trying to communicate something
> > > from the framework to the provider driver. Put another way, I would
> > > think the provider driver can figure out the index itself without hav=
ing
> > > to go through the framework to do so.
> >=20
> > Isn't it a bit wasteful to duplicate information about the parent within
> > a provider if framework already has that info? The whole point of this
> > new API is to allow providers to avoid that unnecessary duplication.
> >=20
> > Please note that clk_hw_get_parent_index is getting used only at the
> > resume time and not at suspend.
>=20
> I agree with this. All of the information that we need is already cached
> in the framework. Doing this in the driver would mean essentially adding
> a "saved parent" field along with code to read the value at suspend time
> to the three types of clocks that currently use this core helper.

Don't we already have a "saved parent" field by storing the pointer to
the clk_hw?

>=20
> That's certainly something that we *can* do, but it doesn't sound like a
> better option than simply querying the framework for the value that we
> need.
>=20

Let me say this another way. Why does this driver want to know the index
that the framework uses for some clk_hw pointer? Perhaps it happens to
align with the same value that hardware uses, but I still don't
understand why the driver wants to know what the framework has decided
is the index for some clk_hw pointer.

Or is this something like "give me the index for the parent that the
framework thinks I currently have but in reality don't have anymore
because the register contents were wiped and we need to reparent it"? A
generic API to get any index for this question is overkill and we should
consider adding some sort of API like clk_hw_get_current_parent_index(),
or a framework flag that tells the framework this parent is incorrect
and we need to call the .set_parent() op again to reconfigure it.
