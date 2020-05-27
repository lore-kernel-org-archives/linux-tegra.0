From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/5] clk: Introduce clk_round_rate_unboundly()
Date: Wed, 27 May 2020 20:57:01 +0300
Message-ID: <3fcac59c-7a37-d4af-9d12-710d7af05845@gmail.com>
References: <20200330231617.17079-1-digetx@gmail.com>
 <20200330231617.17079-3-digetx@gmail.com>
 <159055894944.88029.2029223648098859689@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <159055894944.88029.2029223648098859689-n1Xw8LXHxjTHt/MElyovVYaSKrA+ACpX0E9HWUfgJXw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

27.05.2020 08:55, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2020-03-30 16:16:14)
>> In same cases it may be desired to round clock's rate without taking into
>> account current min/max requests made by the clock's users. One example is
>> building up OPP table based on a possible clock rates.
> 
> Shouldn't the OPP table come from firmware/DT? I don't quite understand
> why we're generating OPP tables on top of the rate rounding API.
> clk_round_rate() is supposed to tell us what rate we'll get if we call
> clk_set_rate() with the same arguments. An unboundly version of that
> doesn't make sense. 

The OPP should come from the DT, but unfortunately DT and Tegra's
devfreq driver wasn't designed like that from the start, so it will take
some extra effort to re-do it properly now. I wanted to postpone that
effort a tad and get at least the basics upstreamed for the starter.

> I wonder if perhaps the clk provider should be populating OPP tables in
> this case? Or basically anything besides adding another clk consumer API
> to solve this problem. Who is the caller? Something later in this
> series?

I'll try to add a proper OPP table with freqs and voltages, will see how
it goes. We will need to do it sooner or later anyways. So perhaps it's
fine to drop the current approach with the clk_round_rate_unboundly()
and re-focus on a proper OPP implementation.

Thank you for getting back and replying to this topic :)
