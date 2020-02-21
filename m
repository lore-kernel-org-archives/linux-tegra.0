From: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 13/17] cpuidle: tegra: Squash Tegra30 driver into the
 common driver
Date: Fri, 21 Feb 2020 18:41:28 +0100
Message-ID: <20200221174128.GW10516@linaro.org>
References: <20200212235134.12638-1-digetx@gmail.com>
 <20200212235134.12638-14-digetx@gmail.com>
 <20200221162951.GQ10516@linaro.org>
 <89a9838c-faf3-b890-cea2-aad53df1eac3@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <89a9838c-faf3-b890-cea2-aad53df1eac3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 21, 2020 at 07:59:14PM +0300, Dmitry Osipenko wrote:
> 21.02.2020 19:29, Daniel Lezcano пишет:
> > On Thu, Feb 13, 2020 at 02:51:30AM +0300, Dmitry Osipenko wrote:
> >> Tegra20 and Terga30 SoCs have common C1 and CC6 idling states and thus
> >> share the same code paths, there is no point in having separate drivers
> >> for a similar hardware. This patch merely moves functionality of the old
> >> driver into the new, although the CC6 state is kept disabled for now since
> >> old driver had a rudimentary support for this state (allowing to enter
> >> into CC6 only when secondary CPUs are put offline), while new driver can
> >> provide a full-featured support. The new feature will be enabled by
> >> another patch.
> >>
> >> Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
> >> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >> ---
> >>  arch/arm/mach-tegra/Makefile          |   3 -
> >>  arch/arm/mach-tegra/cpuidle-tegra30.c | 123 --------------------------
> > 
> > Add the -M option when resending please.
> 
> Okay, thank you very much for taking a look at the patches!

Yeah, sorry for the delay. Nice cleanup BTW.

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
