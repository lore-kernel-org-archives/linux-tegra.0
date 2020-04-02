From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Thu, 2 Apr 2020 02:33:40 +0200
Message-ID: <20200402003339.GA11124@qmqm.qmqm.pl>
References: <20200330231617.17079-1-digetx@gmail.com>
 <20200330231617.17079-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200330231617.17079-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 31, 2020 at 02:16:14AM +0300, Dmitry Osipenko wrote:
[...]
> +/**
> + * clk_round_rate_unboundly - unboundly round the given rate for a clk

Just grammar nits:

clk_round_rate_unbounded - round the given rate for a clk, ignoring users' min/max constraints

> + * @clk: the clk for which we are rounding a rate
> + * @rate: the rate which is to be rounded
> + *
> + * Takes in a rate as input and rounds it to a rate that the clk can use
> + * which is then returned.  The given rate isn't bounded by clk users min-max

s/bounded/limited/ ?

> + * rates, unlike in a case of clk_round_rate().  If clk doesn't support

"... unlike in clk_round_rate()."

> + * round_rate operation then the parent rate is returned.
> + */
[...]

Best Regards,
Micha³ Miros³aw
