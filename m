From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 3/8] ARM: tegra: rework Tegra secondary CPU core
 bringup
Date: Wed, 1 Feb 2012 11:08:36 +0000
Message-ID: <20120201110836.GB3058@mudshark.cambridge.arm.com>
References: <1328028051-24271-1-git-send-email-pdeschrijver@nvidia.com>
 <1328028051-24271-4-git-send-email-pdeschrijver@nvidia.com>
 <20120131225045.GE8338@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120131225045.GE8338-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 31, 2012 at 10:50:45PM +0000, Russell King - ARM Linux wrote:
> On Tue, Jan 31, 2012 at 06:40:41PM +0200, Peter De Schrijver wrote:
> > +#ifdef CONFIG_ARM_ERRATA_743622
> > +	teq	r6, #0x20			@ present in r2p0
> > +	teqne	r6, #0x21			@ present in r2p1
> > +	teqne	r6, #0x22			@ present in r2p2
> > +	teqne	r6, #0x27			@ present in r2p7
> > +	teqne	r6, #0x29			@ present in r2p9
> 
> Okay, so we have this errata in proc-v7.S, but only for p0..p2.  If
> it's also p7 and p9, then it shows that the errata in the kernel aren't
> being actively maintained, and brings into question their worth.

It looks like the errata document has been updated since I wrote the
workaround in proc-v7.S (and new r2p* versions of the A9 have been
released). The new document states that r2p* are affected, so we should
update the workaround.

> Plus, of course, we don't want platforms re-implementing the errata
> in their own code if we're already implementing it somewhere in the
> kernel.  So, that's something which needs to be thought about.

Indeed, that could become extremely confusing, especially when they start
doing different things.

> That's something that needs considering along side the whole 'what
> to do about errata when running in non-secure mode' problem which
> OMAP suffers from.

My view is that the workarounds in the kernel are a good way to highlight
which errata we consider to be important from Linux's point-of-view and also
how to avoid them in practice. It's not always possible to apply them in the
kernel at runtime (due to security constraints) but I think it's important
to show what Linux expects.

I'll go back through the errata document and check if any others have been
updated besides this one.

Will
