From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Wed, 14 May 2014 12:35:18 -0700
Message-ID: <20140514193518.19795.64334@quantum>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
 <1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com>
 <53725FED.7050303@wwwdotorg.org> <20140514142739.GA8612@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140514142739.GA8612@ulmo>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2014-05-14 07:27:40)
> On Tue, May 13, 2014 at 12:09:49PM -0600, Stephen Warren wrote:
> > On 05/13/2014 08:06 AM, Peter De Schrijver wrote:
> > > Add shared and cbus clocks to the Tegra124 clock implementation.
> > 
> > > diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
> > 
> > > +#define TEGRA124_CLK_C2BUS 401
> > > +#define TEGRA124_CLK_C3BUS 402
> > > +#define TEGRA124_CLK_GR3D_CBUS 403
> > > +#define TEGRA124_CLK_GR2D_CBUS 404
> > ...
> > 
> > I worry about this a bit. IIUC, these clocks don't actually exist in HW,
> > but are more a way of SW applying policy to the clock that do exist in
> > HW. As such, I'm not convinced it's a good idea to expose these clock
> > IDS to DT, since DT is supposed to represent the HW, and not be
> > influenced by internal SW implementation details.
> > 
> > Do any DTs actually need to used these new clock IDs? I don't think we
> > could actually use these value in e.g. tegra124.dtsi's clocks
> > properties, since these clocks don't exist in HW. Was it your intent to
> > do that? If not, can't we just define these SW-internal clock IDs in the
> > header inside the Tegra clock driver, so the values are invisible to DT?
> 
> I'm beginning to wonder if abusing clocks in this way is really the best
> solution. From what I understand there are two problems here that are
> mostly orthogonal though they're implemented using similar techniques.

Ack. "Virtual clocks" have been implemented by vendors before as a way
to manage complicated clock rate changes. I do not think we should
support such a method upstream.

I'm working with another engineer in Linaro on a "coordinated clock rate
change" series that might help solve some of the problems that this
patch series is trying to achieve.

> 
> The reason for introducing cbus clocks are still unclear to me. From the
> cover letter of this patch series it seems like these should be
> completely hidden from drivers and as such they don't belong in device
> tree. Also if they are an implementation detail, why are they even
> implemented as clocks? Perhaps an example use-case would help illustrate
> the need for this.

I also have this question. Does "cbus" come from your TRM or data sheet?
Or is it purely a software solution to coordinating rate changes within
known limits and for validated combinations?

> 
> As for shared clocks I'm only aware of one use-case, namely EMC scaling.
> Using clocks for that doesn't seem like the best option to me. While it
> can probably fix the immediate issue of choosing an appropriate
> frequency for the EMC clock it isn't a complete solution for the problem
> that we're trying to solve. From what I understand EMC scaling is one
> part of ensuring quality of service. The current implementations of that
> seems to abuse clocks (essentially one X.emc clock per X clock) to
> signal the amount of memory bandwidth required by any given device. But
> there are other parts to the puzzle. Latency allowance is one. The value
> programmed to the latency allowance registers for example depends on the
> EMC frequency.
> 
> Has anyone ever looked into using a different framework to model all of
> these requirements? PM QoS looks like it might fit, but if none of the
> existing frameworks have what we need, perhaps something new can be
> created.

It has been discussed. Using a QoS throughput constraint could help
scale frequency. But this deserves a wider discussion and starts to
stray into both PM QoS territory and also into "should we have a DVFS
framework" territory.

Regards,
Mike

> 
> Thierry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
