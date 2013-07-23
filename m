From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: tegra: correct Colibri T20 regulator settings
Date: Tue, 23 Jul 2013 22:35:52 +0200
Message-ID: <1374611752.1712.6.camel@tellur>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
	 <1374442132-24040-5-git-send-email-dev@lynxeye.de>
	 <51EEC669.9050703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51EEC669.9050703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag, den 23.07.2013, 11:07 -0700 schrieb Stephen Warren:
> On 07/21/2013 02:28 PM, Lucas Stach wrote:
> > Core and CPU voltage settings were a bit on the safe side. The actually
> > used chips on the Colibri allow for lower voltages and work just fine
> > this way.
> 
> That sounds like a non-critical issue. Shouldn't that part be separated
> out into a patch for 3.12?
Hm, yes.

> 
> > SM2 is not a the parent of LDO regs, but actually the DDR regulator. The
> > Colibri uses a different version of the TPS with other voltage mapping
> > tables for SM2, currently we cheat by setting a fake 3,2V which results
> > in 1,8V physical.
> 
> That's quite unfortunate. Since DT is supposed to be an ABI, the
> existing DT should continue to work for arbitrary kernels, and the
> modified DT should also work for arbitrary kernels. Clearly that isn't
> possible if we start putting incorrect voltage values into the DT. Isn't
> there some way to make an isolated fix to the PMIC driver itself so that
> it actually programs the HW correctly? Even if that patch is larger than
> this patch, it still seems more likely to be acceptable for 3.11.
> 
I'm a bit one the fence here. One the one hand it's a severe issue as
the DDR ram gets overvolted by a fair bit and should be fixed by putting
the correct voltage in the DT and getting this into stable. On the other
hand this will prevent older kernels from working correctly as with 1,8V
set on this rail the regulator driver will just plainly refuse to probe.

Thinking again about this maybe it really the best thing to get the DT
right first with CC stable and then changing the regulator driver and
try and see if stable also accepts this patch. I don't really want to
leave people with a supposedly working system, but constantly
overvolting their RAM.

> But is this a regression? If not, how far back in CC: stable should this
> change go?

This is not a regression. It was introduced with the original Colibri
T20 commit and was caused by Toradex not providing any schematics for
the Module plus me not physically checking this voltage rail before
pushing things out.

Regards,
Lucas
