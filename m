From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Thu, 15 May 2014 13:17:00 +0300
Message-ID: <20140515101700.GH15168@tbergstrom-lnx.Nvidia.com>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
 <1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com>
 <53725FED.7050303@wwwdotorg.org> <20140514142739.GA8612@ulmo>
 <CAL1qeaGS-78QaiMN-3zXYYXu+K1s7u2rFXQkt7-MRJQS1-sW5A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAL1qeaGS-78QaiMN-3zXYYXu+K1s7u2rFXQkt7-MRJQS1-sW5A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 14, 2014 at 07:58:26PM +0200, Andrew Bresticker wrote:
> On Wed, May 14, 2014 at 7:27 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > As for shared clocks I'm only aware of one use-case, namely EMC scaling.
> > Using clocks for that doesn't seem like the best option to me. While it
> > can probably fix the immediate issue of choosing an appropriate
> > frequency for the EMC clock it isn't a complete solution for the problem
> > that we're trying to solve. From what I understand EMC scaling is one
> > part of ensuring quality of service. The current implementations of that
> > seems to abuse clocks (essentially one X.emc clock per X clock) to
> > signal the amount of memory bandwidth required by any given device. But
> > there are other parts to the puzzle. Latency allowance is one. The value
> > programmed to the latency allowance registers for example depends on the
> > EMC frequency.
> >
> > Has anyone ever looked into using a different framework to model all of
> > these requirements? PM QoS looks like it might fit, but if none of the
> > existing frameworks have what we need, perhaps something new can be
> > created.
> 
> On Exynos we use devfreq, though in that case we monitor performance
> counters to determine how internal buses should be scaled - not sure
> if Tegra SoCs have similar counters that could be used for this
> purpose.  It seems like EMC scaling would fit nicely within the PM QoS
> framework, perhaps with a new PM_QOS_MEMORY_THROUGHPUT class.

We do have counters, however, counters are reactive which is a problem
for some isochronous clients (eg. display). Counters also don't solve
the latency problem.

Cheers,

Peter.
