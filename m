From: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Subject: Re: [PATCH] timekeeping: Move persistent clock registration code
 from ARM to kernel
Date: Fri, 14 Nov 2014 01:26:44 +0100 (CET)
Message-ID: <alpine.DEB.2.11.1411140123060.3935@nanos>
References: <1415388855-35074-1-git-send-email-anatol.pomozov@gmail.com> <20141110095325.GC12126@ulmo> <CAOMFOmXpAm5iKCLFyorTW+n9YmgZMmrDGGe736tJX8C6BYQv-A@mail.gmail.com> <alpine.DEB.2.11.1411132334400.3935@nanos>
 <CALAqxLXYVLXZafNH_ag3WDFHkhMe5t23zLbvg7Sq+4_rTfy+Kw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALAqxLXYVLXZafNH_ag3WDFHkhMe5t23zLbvg7Sq+4_rTfy+Kw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Anatol Pomozov <anatol.pomozov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 13 Nov 2014, John Stultz wrote:
> On Thu, Nov 13, 2014 at 2:46 PM, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org> wrote:
> > Aside of that I really wonder why we need that persistent_clock stuff
> > at all. We already have mechanisms to register persistent clocks AKA
> > RTCs after the early boot process and update the wall clock time
> > before we actually need it. Nothing in early boot depends on correct
> > wall clock at all.
> >
> > So instead of adding more extra persistent clock nonsense, can we just
> > move all of that to the place where it belongs, i.e. RTC?
> 
> Sigh.. I've got this on an eventual todo list.. The big problem though
> is that the RTC infrastructure can't be called with irqs off, so its
> not as optimal for measuring suspend time. Some of the suspend-time
> measurement with clocksources that don't halt is interesting here.
> 
> So we need to add to the RTC infrastructure special accessors that are
> safe when irqs are off, and we can then deprecate the persistent clock
> bits. There's still evaluation quirks with setting the time earlier in
> boot or not (possibly some rng effects as well there), but that could
> be worked out if we had the suspend timing via safe RTC interfaces
> sorted.

So we better work on this instead of creating more legacy enforcement
APIs....

Thanks,

	tglx
