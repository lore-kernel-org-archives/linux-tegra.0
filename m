From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 71/97] ARM: l2c: convert tegra to generic l2c
	initialisation
Date: Mon, 28 Apr 2014 21:56:52 +0100
Message-ID: <20140428205652.GW26756@n2100.arm.linux.org.uk>
References: <20140428192419.GV26756@n2100.arm.linux.org.uk> <E1WerHi-0001YW-Oi@rmk-PC.arm.linux.org.uk> <535EB900.6010506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <535EB900.6010506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-0qwDCntBQCZpWr+L1FloEB2eb7JE58TQ@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 28, 2014 at 02:24:32PM -0600, Stephen Warren wrote:
> On 04/28/2014 01:32 PM, Russell King wrote:
> 
> > diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> 
> >  DT_MACHINE_START(TEGRA_DT, "NVIDIA Tegra SoC (Flattened Device Tree)")
> > -	.map_io		= tegra_map_common_io,
> > +	.l2c_aux_val	= 0x3c400001,
> > +	.l2c_aux_mask	= 0xc20fc3fe,
> 
> I assume those values are simply ignored for CPUs without an l2c (or
> with an architected one?) i.e. A15. If so,
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

l2x0_of_init() only does something when your DT file specifies that
there's a L2C cache controller of the appropriate type present.  So
yes, when there's no L2C cache controller mentioned, it's a no-op.

-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
