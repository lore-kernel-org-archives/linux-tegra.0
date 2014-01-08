From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/6] ARM: tegra: rework fuse.c
Date: Wed, 8 Jan 2014 10:31:33 +0200
Message-ID: <20140108083133.GK26588@tbergstrom-lnx.Nvidia.com>
References: <1387891931-9854-1-git-send-email-pdeschrijver@nvidia.com>
 <1387891931-9854-5-git-send-email-pdeschrijver@nvidia.com>
 <52CB1722.70306@wwwdotorg.org>
 <20140107141004.GF26588@tbergstrom-lnx.Nvidia.com>
 <52CC67C9.9000704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52CC67C9.9000704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 07, 2014 at 09:47:05PM +0100, Stephen Warren wrote:
> On 01/07/2014 07:10 AM, Peter De Schrijver wrote:
> > On Mon, Jan 06, 2014 at 09:50:42PM +0100, Stephen Warren wrote:
> >> On 12/24/2013 06:32 AM, Peter De Schrijver wrote:
> >>> Reduce fuse.c to the minimum functionality required for the early bootstages.
> >>>
> >>> Also export tegra_read_straps() for use by the fuse driver.
> 
> >>> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
> 
> >>> -int tegra_sku_id;
> >>> -int tegra_cpu_process_id;
> >>> -int tegra_core_process_id;
> >>>  int tegra_chip_id;
> >>> -int tegra_cpu_speedo_id;		/* only exist in Tegra30 and later */
> >>> -int tegra_soc_speedo_id;
> >>>  enum tegra_revision tegra_revision;
> >>
> >> It's a bit odd to remove most of this, but leave a few parts hanging
> >> around. Wouldn't it be better to the drivers/misc/fuse code to export
> >> this, so that /all/ the fuse logic was there, rather than part of it
> >> being left over in arch/arm/? We'll need to fix that up anyway when we
> >> start using these globals on ARMv8, so may as well get it right now.
> >> Also, I rather think that the new drivers/misc/fuse code shouldn't be a
> >> module or driver, so that we can guarantee it's always there to provide
> >> the globals and that they are initialized early enough...
> > 
> > tegra_revision is used in tegra_dt_init() to initialize soc_dev_attr->revision
> > Hence this needs to be available before the fuse driver is initialized.
> 
> Yes, the same for tegra_chip_id too.
> 
> My point is: Why not move all the globals into the fuse driver, and make
> an early call to that fuse driver to initialize all these globals.
> Basically, rework this patch series to simply move the code to
> drivers/misc/fuse/, and keep initializing it by function call rather
> than as a driver probe(). The code can still scan DT to get the required
> reg/clock/... resources, in a similar fashion to e.g. the Tegra timer or
> cpufreq drivers IIRC. Perhaps the sysfs exports could be associated with
> a driver still though - just initialize the globals early?

That's probably better indeed... Will look into that.

Cheers,

Peter.
