From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v9 07/22] clk: Add API to get index of the clock parent
Date: Fri, 08 Nov 2019 13:15:37 -0800
Message-ID: <20191108211538.9543720869@mail.kernel.org>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com> <1565984527-5272-8-git-send-email-skomatineni@nvidia.com> <20191106231005.F2CD820869@mail.kernel.org> <fcc43ccb-8c6e-d518-4c70-503501706ffd@gmail.com> <20191107152115.GA2580600@ulmo> <20191107191933.0B18021D6C@mail.kernel.org> <20191108101116.GA2583136@ulmo> <20191108181249.E284E214DB@mail.kernel.org> <20191108185503.GB3384779@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191108185503.GB3384779@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, jason@lakedaemon.net, jonathanh@nvidia.com, linus.walleij@linaro.org, marc.zyngier@arm.com, mark.rutland@arm.com, stefan@agner.ch, tglx@linutronix.de, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2019-11-08 10:55:03)
> On Fri, Nov 08, 2019 at 10:12:49AM -0800, Stephen Boyd wrote:
> >=20
> > Sure a WARN_ON() sounds fair. That will not take the whole task down
> > and makes sure that drivers aren't doing something incorrect. Otherwise,
> > this looks good and we can optimize by caching the parent index later if
> > we really need to.
>=20
> Okay, great. I'll go replace the above patch in the branch that I have.
> I'm not sure if you saw it, but I had sent this in a pull request for
> v5.5-rc1 about a week ago because I've got Tegra clock driver patches
> that depend on this. I can replace this patch with the above proposal
> and update the Tegra clock driver branch and then resend the two pull
> requests.
>=20
> Does that sound like a plan?
>=20

Yes please refresh the PRs. I don't think anything else is concerning
but I'll go do a sweep over the Tegra patches right now.
