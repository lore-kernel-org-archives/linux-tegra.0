From: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Subject: Re: Multi-platform, and secure-only ARM errata workarounds
Date: Tue, 26 Feb 2013 11:11:30 +0000
Message-ID: <20130226111130.GC16875@arm.com>
References: <512BF81A.3080700@wwwdotorg.org>
 <20130226103114.GA16875@arm.com>
 <20130226103503.GB16875@arm.com>
 <201302261048.06644.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201302261048.06644.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ARM kernel mailing list <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 26, 2013 at 10:48:06AM +0000, Arnd Bergmann wrote:
> On Tuesday 26 February 2013, Catalin Marinas wrote:
> > On Tue, Feb 26, 2013 at 10:31:14AM +0000, Catalin Marinas wrote:
> > > On Tue, Feb 26, 2013 at 10:23:26AM +0000, Arnd Bergmann wrote:
> > > > On Monday 25 February 2013, Stephen Warren wrote:
> > > > > Is there any other alternative I'm not seeing? Having the kernel
> > > > > suddenly become incompatible with any currently extant bootloader when I
> > > > > enable CONFIG_MULTIPLATFORM doesn't seem like a great idea.
> > > > 
> > > > Could we make those errata be run-time enabled only when not booting
> > > > in secure mode?
> > > 
> > > There is no easy way to detect whether Linux booted in secure mode,
> > > unless we add some information in the DT. But I wouldn't add S vs NS
> > > information, rather which errata need to be enabled by the kernel.
> > 
> > Another difficulty - parsing the DT is done later while some workarounds
> > are enabled before the MMU (or require the MMU to be disabled
> > temporarily).
> 
> Can we do it easily after detecting the machine_desc? Maybe we could
> add a bit mask of errata to the struct.

On DT platforms we detect the machine_desc after the MMU has been
initialised. Some errata workarounds currently go to __v7_setup and many
of them can't be enabled from non-secure mode. You would need to
simulate a lower power mode or reset to briefly disable the MMU.

Usually the workaround (setting implementation defined bits) is needed
for secondary CPUs as well, but at least at that point we have more
information.

-- 
Catalin
