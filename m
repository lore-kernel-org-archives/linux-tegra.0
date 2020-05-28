From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Wed, 27 May 2020 17:38:15 -0700
Message-ID: <159062629560.69627.6748976171636917991@swboyd.mtv.corp.google.com>
References: <20200330231617.17079-1-digetx@gmail.com> <20200330231617.17079-3-digetx@gmail.com> <159055894944.88029.2029223648098859689@swboyd.mtv.corp.google.com> <3fcac59c-7a37-d4af-9d12-710d7af05845@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3fcac59c-7a37-d4af-9d12-710d7af05845-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-05-27 10:57:01)
> 27.05.2020 08:55, Stephen Boyd \u043f\u0438\u0448\u0435\u0442:
> > Quoting Dmitry Osipenko (2020-03-30 16:16:14)
> >> In same cases it may be desired to round clock's rate without taking i=
nto
> >> account current min/max requests made by the clock's users. One exampl=
e is
> >> building up OPP table based on a possible clock rates.
> >=20
> > Shouldn't the OPP table come from firmware/DT? I don't quite understand
> > why we're generating OPP tables on top of the rate rounding API.
> > clk_round_rate() is supposed to tell us what rate we'll get if we call
> > clk_set_rate() with the same arguments. An unboundly version of that
> > doesn't make sense.=20
>=20
> The OPP should come from the DT, but unfortunately DT and Tegra's
> devfreq driver wasn't designed like that from the start, so it will take
> some extra effort to re-do it properly now. I wanted to postpone that
> effort a tad and get at least the basics upstreamed for the starter.
>=20
> > I wonder if perhaps the clk provider should be populating OPP tables in
> > this case? Or basically anything besides adding another clk consumer API
> > to solve this problem. Who is the caller? Something later in this
> > series?
>=20
> I'll try to add a proper OPP table with freqs and voltages, will see how
> it goes. We will need to do it sooner or later anyways. So perhaps it's
> fine to drop the current approach with the clk_round_rate_unboundly()
> and re-focus on a proper OPP implementation.
>=20
> Thank you for getting back and replying to this topic :)

Alright, it sounds better to me if we can avoid a one off addition to
the clk API in favor of implementing a proper OPP table from the start.
