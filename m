From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Tue, 26 May 2020 22:55:49 -0700
Message-ID: <159055894944.88029.2029223648098859689@swboyd.mtv.corp.google.com>
References: <20200330231617.17079-1-digetx@gmail.com> <20200330231617.17079-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200330231617.17079-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2020-03-30 16:16:14)
> In same cases it may be desired to round clock's rate without taking into
> account current min/max requests made by the clock's users. One example is
> building up OPP table based on a possible clock rates.

Shouldn't the OPP table come from firmware/DT? I don't quite understand
why we're generating OPP tables on top of the rate rounding API.
clk_round_rate() is supposed to tell us what rate we'll get if we call
clk_set_rate() with the same arguments. An unboundly version of that
doesn't make sense.=20

I wonder if perhaps the clk provider should be populating OPP tables in
this case? Or basically anything besides adding another clk consumer API
to solve this problem. Who is the caller? Something later in this
series?
