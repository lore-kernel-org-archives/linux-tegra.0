From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 3/3] clk: tegra: Implement Tegra124 shared/cbus clks
Date: Thu, 15 May 2014 13:59:29 +0300
Message-ID: <20140515105929.GJ15168@tbergstrom-lnx.Nvidia.com>
References: <1399990023-30318-1-git-send-email-pdeschrijver@nvidia.com>
 <1399990023-30318-4-git-send-email-pdeschrijver@nvidia.com>
 <53725FED.7050303@wwwdotorg.org> <20140514142739.GA8612@ulmo>
 <20140514193518.19795.64334@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140514193518.19795.64334@quantum>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 14, 2014 at 09:35:18PM +0200, Mike Turquette wrote:
> Quoting Thierry Reding (2014-05-14 07:27:40)
> > On Tue, May 13, 2014 at 12:09:49PM -0600, Stephen Warren wrote:
> > > On 05/13/2014 08:06 AM, Peter De Schrijver wrote:
> > > > Add shared and cbus clocks to the Tegra124 clock implementation.
> > > 
> > > > diff --git a/include/dt-bindings/clock/tegra124-car.h b/include/dt-bindings/clock/tegra124-car.h
> > > 
> > > > +#define TEGRA124_CLK_C2BUS 401
> > > > +#define TEGRA124_CLK_C3BUS 402
> > > > +#define TEGRA124_CLK_GR3D_CBUS 403
> > > > +#define TEGRA124_CLK_GR2D_CBUS 404
> > > ...
> > > 
> > > I worry about this a bit. IIUC, these clocks don't actually exist in HW,
> > > but are more a way of SW applying policy to the clock that do exist in
> > > HW. As such, I'm not convinced it's a good idea to expose these clock
> > > IDS to DT, since DT is supposed to represent the HW, and not be
> > > influenced by internal SW implementation details.
> > > 
> > > Do any DTs actually need to used these new clock IDs? I don't think we
> > > could actually use these value in e.g. tegra124.dtsi's clocks
> > > properties, since these clocks don't exist in HW. Was it your intent to
> > > do that? If not, can't we just define these SW-internal clock IDs in the
> > > header inside the Tegra clock driver, so the values are invisible to DT?
> > 
> > I'm beginning to wonder if abusing clocks in this way is really the best
> > solution. From what I understand there are two problems here that are
> > mostly orthogonal though they're implemented using similar techniques.
> 
> Ack. "Virtual clocks" have been implemented by vendors before as a way
> to manage complicated clock rate changes. I do not think we should
> support such a method upstream.
> 
> I'm working with another engineer in Linaro on a "coordinated clock rate
> change" series that might help solve some of the problems that this
> patch series is trying to achieve.
> 

Any preview? :)

For us to be useful it needs to be possible to:

1) change to a different parent during a rate change
2) adjust a clocks divider when changing parents
3) ignore disabled child clocks
4) have notifiers to hook voltage scaling into

> > 
> > The reason for introducing cbus clocks are still unclear to me. From the
> > cover letter of this patch series it seems like these should be
> > completely hidden from drivers and as such they don't belong in device
> > tree. Also if they are an implementation detail, why are they even
> > implemented as clocks? Perhaps an example use-case would help illustrate
> > the need for this.
> 
> I also have this question. Does "cbus" come from your TRM or data sheet?
> Or is it purely a software solution to coordinating rate changes within
> known limits and for validated combinations?
> 

cbus is a software solution. It's not menioned in any TRM or hardware
document.

Cheers,

Peter.
